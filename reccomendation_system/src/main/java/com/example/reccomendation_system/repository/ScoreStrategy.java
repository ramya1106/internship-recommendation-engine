package com.example.reccomendation_system.repository;

import com.example.reccomendation_system.dto.UserRequirements;

import java.util.HashMap;
import java.util.List;

public interface ScoreStrategy {
    void apply(List<Integer> eligibleInternshipIds, HashMap<Integer, Double> preferenceScores, UserRequirements userRequirements, double weight);
}
