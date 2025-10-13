package com.example.reccomendation_system.util;

import com.example.reccomendation_system.repository.InternshipRequirementsJpaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.HashMap;

@Component
public class PreferenceScoreCalculator {

    private final InternshipRequirementsJpaRepository internshipRequirementsJpaRepository;

    @Autowired
    public PreferenceScoreCalculator(InternshipRequirementsJpaRepository internshipRequirementsJpaRepository) {
        this.internshipRequirementsJpaRepository = internshipRequirementsJpaRepository;
    }
    public HashMap<Integer, Double> getPreferenceScores(ArrayList<Integer> internshipIds, UserRequirements userRequirements) {
        HashMap<Integer, Double> modePreferenceScores = new HashMap<>();
        // calculate preference score for mode
        getModePreferenceScores(modePreferenceScores, internshipIds, userRequirements.getPreferredMode());
        System.out.println(modePreferenceScores);
        return modePreferenceScores;
    }

    private void getModePreferenceScores(HashMap<Integer, Double> modePreferenceScores, ArrayList<Integer> internshipIds, String preferredMode) {
        for (int internshipId : internshipIds) {
            double score = 0.0;
            String mode = internshipRequirementsJpaRepository.findModeByInternshipId(internshipId);
            if (preferredMode == null || preferredMode.equalsIgnoreCase("Any") || preferredMode.equalsIgnoreCase(mode)) {
                score = 1;
            }
            else if (mode.equalsIgnoreCase("Hybrid")){
                score = 0.5;
            }
            modePreferenceScores.put(internshipId, score);
        }
    }
}
