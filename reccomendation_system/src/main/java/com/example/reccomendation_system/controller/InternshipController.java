package com.example.reccomendation_system.controller;


import com.example.reccomendation_system.dto.InternshipDTO;
import com.example.reccomendation_system.helper.EligibilityValidator;
import com.example.reccomendation_system.repository.InternshipJpaRepository;
import com.example.reccomendation_system.service.InternshipService;
import com.example.reccomendation_system.service.MlModelService;
import com.example.reccomendation_system.util.EligibilityFilteringThroughNativeQuery;
import com.example.reccomendation_system.util.UserRequirements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;

@RestController
@RequestMapping("/internships")
public class InternshipController {

    private final InternshipService internshipService;
    private final MlModelService mlModelService;

    private final InternshipJpaRepository internshipJpaRepository;

    // TODO :TESTING
    private final EligibilityValidator eligibilityValidator;
    private final EligibilityFilteringThroughNativeQuery eligibilityFilteringThroughNativeQuery;

    @Autowired
    public InternshipController(InternshipService internshipService, MlModelService mlModelService, InternshipJpaRepository internshipJpaRepository, EligibilityValidator eligibilityValidator, EligibilityFilteringThroughNativeQuery eligibilityFilteringThroughNativeQuery) {
        this.internshipService = internshipService;
        this.mlModelService = mlModelService;


        this.internshipJpaRepository = internshipJpaRepository;


        this.eligibilityValidator = eligibilityValidator;
        this.eligibilityFilteringThroughNativeQuery = eligibilityFilteringThroughNativeQuery;
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
    public ArrayList<InternshipDTO> getAllEligibleInternships(@PathVariable("userId") int userId, @RequestBody UserRequirements userRequirements) {
        // return eligibilityValidator.getAllEligibleInternships(userId);
        return eligibilityFilteringThroughNativeQuery.getEligibleInternships(userId, userRequirements);
    }
}
