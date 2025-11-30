package com.example.reccomendation_system.util;

import com.example.reccomendation_system.dto.UserRequirements;
import com.example.reccomendation_system.repository.InternshipJpaRepository;
import com.example.reccomendation_system.repository.ScoreStrategy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.List;

@Component
public class AppliedCountScoreStrategy implements ScoreStrategy {

    private final InternshipJpaRepository internshipJpaRepository;
    private final DefaultScoreStrategy defaultScoreStrategy;

    @Autowired
    public AppliedCountScoreStrategy(InternshipJpaRepository internshipJpaRepository, DefaultScoreStrategy defaultScoreStrategy) {
        this.internshipJpaRepository = internshipJpaRepository;
        this.defaultScoreStrategy = defaultScoreStrategy;
    }

    @Override
    public void apply(List<Integer> eligibleInternshipIds, HashMap<Integer, Double> preferenceScores, UserRequirements userRequirements, double weight) {
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
            defaultScoreStrategy.apply(eligibleInternshipIds, preferenceScores, userRequirements, weight);
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
            preferenceScores.put(internshipId, score * weight + preferenceScores.getOrDefault(internshipId, 0.0));
        }
    }
}
