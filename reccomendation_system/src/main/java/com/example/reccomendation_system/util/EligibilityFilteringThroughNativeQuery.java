package com.example.reccomendation_system.util;

import com.example.reccomendation_system.dto.InternshipDTO;
import com.example.reccomendation_system.mapper.Mapper;
import com.example.reccomendation_system.model.Internship;
import com.example.reccomendation_system.model.User;
import com.example.reccomendation_system.repository.InternshipJpaRepository;
import com.example.reccomendation_system.repository.UserJpaRepository;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import java.util.ArrayList;
import java.util.HashMap;

@Service
public class EligibilityFilteringThroughNativeQuery {

    private final EntityManager entityManager;
    private final UserJpaRepository userJpaRepository;
    private final InternshipJpaRepository internshipJpaRepository;
    private final Mapper mapper;
    private final PreferenceScoreCalculator preferenceScoreCalculator;

    @Autowired
    public EligibilityFilteringThroughNativeQuery(EntityManager entityManager, UserJpaRepository userJpaRepository, InternshipJpaRepository internshipJpaRepository, Mapper mapper, PreferenceScoreCalculator preferenceScoreCalculator) {
        this.entityManager = entityManager;
        this.userJpaRepository = userJpaRepository;
        this.internshipJpaRepository = internshipJpaRepository;
        this.mapper = mapper;
        this.preferenceScoreCalculator = preferenceScoreCalculator;
    }
    public ArrayList<InternshipDTO> getEligibleInternships(int userId, UserRequirements userRequirements) {
        try {
            User user = userJpaRepository.findById(userId).get();
            int userAge = user.getAge();
            String userGender = user.getGender();
            int highestQualificationRank = user.getHighestQualificationRank();
            double threshold = 0.3;
            String queryStatement = """
                           SELECT i_r.internship_id
                           FROM internship_requirements i_r
                           JOIN internship_skill i_s ON i_r.internship_id = i_s.internship_id
                           LEFT JOIN user_skill u_s ON i_s.skill_id = u_s.skill_id
                           WHERE
                           i_r.age <= :age
                           AND (i_r.gender = :gender OR i_r.gender = 'Any')
                           AND (i_r.minimum_qualification_rank <= :highestQualificationRank)
                           AND u_s.user_id = :userId
                           GROUP BY i_r.internship_id
                           HAVING COUNT(u_s.skill_id) * 1 / COUNT(i_s.skill_id) >= :threshold
                    """;
            Query nativeQuery = entityManager.createNativeQuery(queryStatement, Integer.class);
            nativeQuery.setParameter("age", userAge);
            nativeQuery.setParameter("gender", userGender);
            nativeQuery.setParameter("highestQualificationRank", highestQualificationRank);
            nativeQuery.setParameter("userId", userId);
            nativeQuery.setParameter("threshold", threshold);
            ArrayList<Integer> internshipIdsList = new ArrayList<Integer>(nativeQuery.getResultList());
            // ------TESTING-----
            HashMap<Integer, Double> preferenceScores = preferenceScoreCalculator.getPreferenceScores(internshipIdsList, userRequirements);
            // ------TESTING-----
            ArrayList<InternshipDTO> internshipDTOs = new ArrayList<>();
            for (int internshipId : internshipIdsList) {
                Internship internship = internshipJpaRepository.findById(internshipId).get();
                InternshipDTO internshipDTO = mapper.toInternshipDTO(internship);
                internshipDTOs.add(internshipDTO);
            }
            return internshipDTOs;
        } catch (Exception e) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        }
    }
}
