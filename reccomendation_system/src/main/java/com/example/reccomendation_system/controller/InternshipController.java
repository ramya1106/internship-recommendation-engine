package com.example.reccomendation_system.controller;

import com.example.reccomendation_system.dto.InternshipDTO;
import com.example.reccomendation_system.repository.InternshipJpaRepository;
import com.example.reccomendation_system.service.InternshipService;
import com.example.reccomendation_system.service.MlModelService;
import com.example.reccomendation_system.util.EligibilityFiltering;
import com.example.reccomendation_system.dto.UserRequirements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;

@RestController
@RequestMapping("/internships")
public class InternshipController {

    private final InternshipService internshipService;
    private final MlModelService mlModelService;
    // TESTING
    private final EligibilityFiltering eligibilityFiltering;

    @Autowired
    public InternshipController(InternshipService internshipService, MlModelService mlModelService, InternshipJpaRepository internshipJpaRepository, EligibilityFiltering eligibilityFiltering) {
        this.internshipService = internshipService;
        this.mlModelService = mlModelService;
        this.eligibilityFiltering = eligibilityFiltering;
    }

    @PostMapping("")
    public ArrayList<InternshipDTO> getInternships(@RequestBody UserRequirements userRequirements) {
        return internshipService.getInternships();
    }

    @PostMapping("/filtered/{userId}")
    public ArrayList<InternshipDTO> getTopFiveInternships(@PathVariable("userId") int userId, @RequestBody UserRequirements userRequirements) {
        return mlModelService.getTopFiveInternships(userId);
    }

    @PostMapping("/eligible/{userId}")
    public ArrayList<InternshipDTO> getAllEligibleInternships(@PathVariable("userId") int userId) {
        // return eligibilityValidator.getAllEligibleInternships(userId);
        return eligibilityFiltering.getEligibleInternships(userId);
    }

    @PostMapping("/ranked/{userId}")
    public ArrayList<InternshipDTO> getPreferenceScoreRankedInternships(@PathVariable("userId") int userId, @RequestBody UserRequirements userRequirements) {
        // return the internships in order of their preference score match
        return internshipService.getPreferenceScoreRankedInternships(userId, userRequirements);
    }
}
