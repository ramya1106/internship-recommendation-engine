package com.example.reccomendation_system.service;

import com.example.reccomendation_system.dto.InternshipDTO;
import com.example.reccomendation_system.mapper.Mapper;
import com.example.reccomendation_system.model.Internship;
import com.example.reccomendation_system.repository.InternshipJpaRepository;
import com.example.reccomendation_system.repository.InternshipRepository;
import com.example.reccomendation_system.util.EligibilityFiltering;
import com.example.reccomendation_system.util.PreferenceScoreCalculator;
import com.example.reccomendation_system.util.UserRequirements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.PriorityQueue;

@Service
public class InternshipService implements InternshipRepository {

    private final InternshipJpaRepository internshipJpaRepository;
    private final Mapper mapper;
    private final PreferenceScoreCalculator preferenceScoreCalculator;
    private final EligibilityFiltering eligibilityFiltering;

    @Autowired
    public InternshipService(InternshipJpaRepository internshipJpaRepository, Mapper mapper, PreferenceScoreCalculator preferenceScoreCalculator, EligibilityFiltering eligibilityFiltering) {
        this.internshipJpaRepository = internshipJpaRepository;
        this.mapper = mapper;
        this.preferenceScoreCalculator = preferenceScoreCalculator;
        this.eligibilityFiltering = eligibilityFiltering;
    }

    @Override
    public ArrayList<InternshipDTO> getInternships() {
        List<Internship> internshipList = internshipJpaRepository.findAll();
        ArrayList<InternshipDTO> internshipDTOS = new ArrayList<>();
        for (Internship internship : internshipList) {
            internshipDTOS.add(mapper.toInternshipDTO(internship));
        }
        return internshipDTOS;
    }

    @Override
    public ArrayList<InternshipDTO> getPreferenceScoreRankedInternships(int userId, UserRequirements userRequirements) {
        ArrayList<Integer> eligibleInternshipIds = eligibilityFiltering.getEligibleInternshipIds(userId);
        HashMap<Integer, Double> preferenceScores = preferenceScoreCalculator.getPreferenceScores(eligibleInternshipIds, userRequirements);
        PriorityQueue<Integer> preferenceScoreOrderedQueue = new PriorityQueue<>((a, b) -> {
            return Double.compare(preferenceScores.getOrDefault(b, 0.0), preferenceScores.getOrDefault(a, 0.0));
        });
        preferenceScoreOrderedQueue.addAll(preferenceScores.keySet());
        ArrayList<InternshipDTO> rankedInternships = new ArrayList<>();
        while (!preferenceScoreOrderedQueue.isEmpty()) {
            int internshipId = preferenceScoreOrderedQueue.poll();
            Internship internship = internshipJpaRepository.findById(internshipId).get();
            rankedInternships.add(mapper.toInternshipDTO(internship));
        }
        return rankedInternships;
    }
}
