package com.example.reccomendation_system.helper;

import com.example.reccomendation_system.dto.InternshipDTO;
import com.example.reccomendation_system.model.User;
import com.example.reccomendation_system.repository.InternshipRequirementsJpaRepository;
import com.example.reccomendation_system.repository.UserJpaRepository;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import java.util.ArrayList;
import java.util.List;

@Service
public class EligibilityValidator {

    // age, gender
    private final InternshipRequirementsJpaRepository internshipRequirementsJpaRepository;
    private final UserJpaRepository userJpaRepository;

    public EligibilityValidator(InternshipRequirementsJpaRepository internshipRequirementsJpaRepository, UserJpaRepository userJpaRepository) {
        this.internshipRequirementsJpaRepository = internshipRequirementsJpaRepository;
        this.userJpaRepository = userJpaRepository;
    }
    public ArrayList<InternshipDTO> getAllEligibleInternships(int userId) {
        try {
            User user = userJpaRepository.findById(userId).get();
            List<InternshipDTO> eligibleInternships = internshipRequirementsJpaRepository.findValidInternships(user.getAge(), user.getGender(), user.getHighestQualificationRank());

            return new ArrayList<>(eligibleInternships);
        } catch (Exception e) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        }

    }
}
