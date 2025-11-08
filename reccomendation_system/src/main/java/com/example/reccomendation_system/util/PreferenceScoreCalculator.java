package com.example.reccomendation_system.util;

import com.example.reccomendation_system.repository.InternshipJpaRepository;
import com.example.reccomendation_system.repository.InternshipRequirementsJpaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.*;

/**
 * Calculates internship preference scores based on mode match and popularity.
 * A higher score indicates closer alignment with the user's preferences.
 */

@Component
public class PreferenceScoreCalculator {

    private final InternshipRequirementsJpaRepository internshipRequirementsJpaRepository;
    private final InternshipJpaRepository internshipJpaRepository;

    @Autowired
    public PreferenceScoreCalculator(InternshipRequirementsJpaRepository internshipRequirementsJpaRepository, InternshipJpaRepository internshipJpaRepository) {
        this.internshipRequirementsJpaRepository = internshipRequirementsJpaRepository;
        this.internshipJpaRepository = internshipJpaRepository;
    }
    public HashMap<Integer, Double> getPreferenceScores(ArrayList<Integer> internshipIds, UserRequirements userRequirements) {
        HashMap<Integer, Double> preferenceScores = new HashMap<>();
        // calculate preference score for mode
        getModePreferenceScores(preferenceScores, internshipIds, userRequirements.getPreferredMode());
        // calculate preference scores for applied ratios (applied_count / total_count)
        getAppliedRatioScores(internshipIds, preferenceScores);
        return preferenceScores;
    }
    private void getModePreferenceScores(HashMap<Integer, Double> preferenceScores, ArrayList<Integer> eligibleInternshipIds, String preferredMode) {
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
            if (preferredMode == null || preferredMode.equalsIgnoreCase("Any") || preferredMode.equalsIgnoreCase(mode)) {
                score = 1;
            } else if ("Hybrid".equalsIgnoreCase(mode)) {
                score = 0.5;
            }
            preferenceScores.put(internshipId, score + preferenceScores.getOrDefault(internshipId, 0.0));
        }
    }
    private void getAppliedRatioScores(List<Integer> internshipIds, Map<Integer, Double> preferenceScores) {
        if (internshipIds == null || internshipIds.isEmpty()){
            return;
        }
        List<Object[]> results = internshipJpaRepository.findMaxMinRatiosAndAppliedCounts(internshipIds);
        if (results == null || results.isEmpty()) {
            return;
        }
        Object[] maxMinRatiosAndAppliedCounts = results.get(0);
        double maxAppliedRatio = ((Number) maxMinRatiosAndAppliedCounts[0]).doubleValue();
        double minAppliedRatio = ((Number) maxMinRatiosAndAppliedCounts[1]).doubleValue();
        int maxAppliedCount = ((Number) maxMinRatiosAndAppliedCounts[2]).intValue();
        int minAppliedCount = ((Number) maxMinRatiosAndAppliedCounts[3]).intValue();
        if (maxAppliedRatio == minAppliedRatio && maxAppliedCount == minAppliedCount) {
            return;
        }
        List<Object[]> appliedCountAndAppliedRatios = internshipJpaRepository.findAllAppliedCountsAndAppliedRatiosById(internshipIds);
        HashMap<Integer, Double> appliedRatiosMap = new HashMap<>();
        HashMap<Integer, Integer> appliedCountsMap = new HashMap<>();

        for (Object[] record : appliedCountAndAppliedRatios) {
            int internshipId = ((Number) record[0]).intValue();
            appliedCountsMap.put(internshipId, ((Number) record[1]).intValue());
            if (record[2] != null) {
                appliedRatiosMap.put(internshipId, ((Number) record[2]).doubleValue());
            }
        }
        for (int internshipId : internshipIds) {
            double score = 0.0;
            if (!appliedRatiosMap.containsKey(internshipId)) {
                if (maxAppliedCount != minAppliedCount) {
                    int currAppliedCount = appliedCountsMap.getOrDefault(internshipId, 0);
                    score = ((double) maxAppliedCount - currAppliedCount) / (maxAppliedCount - minAppliedCount);
                }
            }
            else if (maxAppliedRatio != minAppliedRatio) {
                double currAppliedRatio = appliedRatiosMap.get(internshipId);
                score = (maxAppliedRatio - currAppliedRatio) / (maxAppliedRatio - minAppliedRatio);
            }
            preferenceScores.put(internshipId, score + preferenceScores.getOrDefault(internshipId, 0.0));
        }
    }
}
