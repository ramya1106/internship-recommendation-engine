package com.example.reccomendation_system.controller;


import com.example.reccomendation_system.dto.InternshipDTO;
import com.example.reccomendation_system.service.InternshipService;
import com.example.reccomendation_system.service.MlModelService;
import com.example.reccomendation_system.util.UserRequirements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;

@RestController
@RequestMapping("/internships")
public class InternshipController {

    private final InternshipService internshipService;
    private final MlModelService mlModelService;


    @Autowired
    public InternshipController(InternshipService internshipService, MlModelService mlModelService) {
        this.internshipService = internshipService;
        this.mlModelService = mlModelService;
    }

    @PostMapping("")
    public ArrayList<InternshipDTO> getInternships(@RequestBody UserRequirements userRequirements) {
        return internshipService.getInternships();
    }

    @PostMapping("/filtered/{userId}")
    public ArrayList<InternshipDTO> getTopFiveInternships(@PathVariable("userId") int userId, @RequestBody UserRequirements userRequirements) {

        return mlModelService.getTopFiveInternships(userId);

    }

}
