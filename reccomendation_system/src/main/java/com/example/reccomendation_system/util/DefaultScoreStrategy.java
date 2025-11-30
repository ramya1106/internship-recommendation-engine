package com.example.reccomendation_system.util;

import com.example.reccomendation_system.dto.UserRequirements;
import com.example.reccomendation_system.repository.ScoreStrategy;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.List;

@Component
public class DefaultScoreStrategy implements ScoreStrategy {

    @Override
    public void apply(List<Integer> eligibleInternshipIds, HashMap<Integer, Double> preferenceScores, UserRequirements userRequirements, double weight) {
        for (int id : eligibleInternshipIds) {
            preferenceScores.put(id, preferenceScores.getOrDefault(id, 0.0) + weight);
        }
    }
}
