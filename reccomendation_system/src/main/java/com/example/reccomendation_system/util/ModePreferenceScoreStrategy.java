package com.example.reccomendation_system.util;

import com.example.reccomendation_system.dto.UserRequirements;
import com.example.reccomendation_system.repository.InternshipRequirementsJpaRepository;
import com.example.reccomendation_system.repository.ScoreStrategy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.List;

@Component
public class ModePreferenceScoreStrategy implements ScoreStrategy {

    private final InternshipRequirementsJpaRepository internshipRequirementsJpaRepository;

    @Autowired
    public ModePreferenceScoreStrategy(InternshipRequirementsJpaRepository internshipRequirementsJpaRepository) {
        this.internshipRequirementsJpaRepository = internshipRequirementsJpaRepository;
    }

    @Override
    public void apply(List<Integer> eligibleInternshipIds, HashMap<Integer, Double> preferenceScores, UserRequirements userRequirements, double weight) {
        String preferredMode = userRequirements.getPreferredMode();
        List<Object[]> modes = internshipRequirementsJpaRepository.findAllModesById(eligibleInternshipIds);
        HashMap<Integer, String> modesMap = new HashMap<>();
        for (Object[] record : modes) {
            if (record[1] != null) {
                modesMap.put(((Number) record[0]).intValue(), record[1].toString());
            }
        }

        for (int internshipId : eligibleInternshipIds) {
            double score = 0.0;
            String mode = modesMap.getOrDefault(internshipId, null);
            if (preferredMode.equalsIgnoreCase("Any") || preferredMode.equalsIgnoreCase(mode)) {
                score = 1;
            } else if ("Hybrid".equalsIgnoreCase(mode)) {
                score = 0.5;
            }
            preferenceScores.put(internshipId, score * weight + preferenceScores.getOrDefault(internshipId, 0.0));
        }
    }
}
