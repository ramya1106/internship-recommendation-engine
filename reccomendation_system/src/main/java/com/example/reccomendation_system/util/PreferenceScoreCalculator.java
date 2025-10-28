package com.example.reccomendation_system.util;

import com.example.reccomendation_system.repository.InternshipJpaRepository;
import com.example.reccomendation_system.repository.InternshipRequirementsJpaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.*;

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
        System.out.println(preferenceScores);
        return preferenceScores;
    }
    private void getModePreferenceScores(HashMap<Integer, Double> preferenceScores, ArrayList<Integer> internshipIds, String preferredMode) {
        // HashMap<Integer, Double> modePreferenceScores = new HashMap<>();
        for (int internshipId : internshipIds) {
            double score = 0.0;
            String mode = internshipRequirementsJpaRepository.findModeByInternshipId(internshipId);
            if (preferredMode == null || preferredMode.equalsIgnoreCase("Any") || preferredMode.equalsIgnoreCase(mode)) {
                score = 1;
            }
            else if (mode.equalsIgnoreCase("Hybrid")){
                score = 0.5;
            }
            // modePreferenceScores.put(internshipId, score);
            preferenceScores.put(internshipId, score + preferenceScores.getOrDefault(internshipId, 0.0));
        }
    }
    // TODO : OPTIMIZE QUERY (get all values in the same query)
    private void getAppliedRatioScores(List<Integer> internshipIds, Map<Integer, Double> preferenceScores) {
        if (internshipIds == null || internshipIds.isEmpty()){
            return;
        }
        Object[] maxMinRatiosAndAppliedCounts = internshipJpaRepository.findMaxMinRatiosAndAppliedCounts(internshipIds).get(0);
        double maxAppliedRatio = ((Number) maxMinRatiosAndAppliedCounts[0]).doubleValue();
        double minAppliedRatio = ((Number) maxMinRatiosAndAppliedCounts[1]).doubleValue();
        int maxAppliedCount = ((Number) maxMinRatiosAndAppliedCounts[2]).intValue();
        int minAppliedCount = ((Number) maxMinRatiosAndAppliedCounts[3]).intValue();
        if (maxAppliedRatio == minAppliedRatio && maxAppliedCount == minAppliedCount) {
            return;
        }
        for (int internshipId : internshipIds) {
            double score = 0.0;
            Object[] currAppliedRatioAndAppliedCount = internshipJpaRepository.findAppliedRatioAndAppliedCountById(internshipId).get(0);
            if (currAppliedRatioAndAppliedCount[0] == null) {
                if (maxAppliedCount != minAppliedCount) {
                    int currAppliedCount = ((Number) currAppliedRatioAndAppliedCount[1]).intValue();
                    score = ((double) maxAppliedCount - currAppliedCount) / (maxAppliedCount - minAppliedCount);
                }
            }
            else if (maxAppliedRatio != minAppliedRatio) {
                double currAppliedRatio = ((Number) currAppliedRatioAndAppliedCount[0]).doubleValue();
                score = (maxAppliedRatio - currAppliedRatio) / (maxAppliedRatio - minAppliedRatio);
            }
            preferenceScores.put(internshipId, score + preferenceScores.getOrDefault(internshipId, 0.0));
        }
    }
}
