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
    private List<Integer> eligibleInternshipIds;
    private HashMap<Integer, Double> preferenceScores;

    @Autowired
    public PreferenceScoreCalculator(InternshipRequirementsJpaRepository internshipRequirementsJpaRepository, InternshipJpaRepository internshipJpaRepository) {
        this.internshipRequirementsJpaRepository = internshipRequirementsJpaRepository;
        this.internshipJpaRepository = internshipJpaRepository;
    }
    public HashMap<Integer, Double> getPreferenceScores(ArrayList<Integer> internshipIds, UserRequirements userRequirements) {
        // calculate preference score for mode
        getModePreferenceScores(userRequirements.getPreferredMode());
        // calculate preference scores for applied ratios (applied_count / total_count)
        getAppliedRatioScores();
        // calculate preference scores based on location
        getLocationPreferenceScores(userRequirements.getPreferredLocation());
        return preferenceScores;
    }
    private void getModePreferenceScores(String preferredMode) {
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
    private void getAppliedRatioScores() {
        if (eligibleInternshipIds == null || eligibleInternshipIds.isEmpty()){
            return;
        }
        List<Object[]> results = internshipJpaRepository.findMaxMinRatiosAndAppliedCounts(eligibleInternshipIds);
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
        List<Object[]> appliedCountAndAppliedRatios = internshipJpaRepository.findAllAppliedCountsAndAppliedRatiosById(eligibleInternshipIds);
        HashMap<Integer, Double> appliedRatiosMap = new HashMap<>();
        HashMap<Integer, Integer> appliedCountsMap = new HashMap<>();

        for (Object[] record : appliedCountAndAppliedRatios) {
            int internshipId = ((Number) record[0]).intValue();
            appliedCountsMap.put(internshipId, ((Number) record[1]).intValue());
            if (record[2] != null) {
                appliedRatiosMap.put(internshipId, ((Number) record[2]).doubleValue());
            }
        }
        for (int internshipId : eligibleInternshipIds) {
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

    private void getLocationPreferenceScores(String preferredLocation) {
        List<Object[]> locations = internshipJpaRepository.findAllStatesAndDistrictsById(eligibleInternshipIds);
        HashMap<Integer, String> districtsMap = new HashMap<>();
        HashMap<Integer, String> statesMap = new HashMap<>();

        for (Object[] location : locations) {
            int internshipId = ((Number) location[0]).intValue();
            if (location[1] != null) {
                statesMap.put(internshipId, location[1].toString());
            }
            if (location[2] != null) {
                districtsMap.put(internshipId, location[2].toString());
            }
        }

        HashMap<String, Double> locationDistanceMap = new HashMap<>();
        // TODO : distance calculation
        // calculate distance between each internship location and user preferred location
        // score_formula = (maxDistance - currDistance) / (maxDistance - minDistance)
    }
}
