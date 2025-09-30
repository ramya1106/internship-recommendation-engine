package com.example.reccomendation_system.controller;

import com.example.reccomendation_system.dto.InternshipDetailsDTO;
import com.example.reccomendation_system.service.InternshipDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/internship/details")
public class InternshipDetailsController {

    private final InternshipDetailsService internshipDetailsService;

    @Autowired
    public InternshipDetailsController(InternshipDetailsService internshipDetailsService) {
        this.internshipDetailsService = internshipDetailsService;
    }

    @GetMapping("/{internshipId}")
    public InternshipDetailsDTO getInternshipDetails(@PathVariable("internshipId") int internshipId) {
        return internshipDetailsService.getInternshipDetails(internshipId);
    }


}
