package com.example.reccomendation_system.service;

import com.example.reccomendation_system.dto.InternshipDetailsDTO;
import com.example.reccomendation_system.mapper.Mapper;
import com.example.reccomendation_system.model.Internship;
import com.example.reccomendation_system.model.InternshipRequirements;
import com.example.reccomendation_system.repository.InternshipDetailsRepository;
import com.example.reccomendation_system.repository.InternshipJpaRepository;
import com.example.reccomendation_system.repository.InternshipRequirementsJpaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class InternshipDetailsService implements InternshipDetailsRepository {

    private final InternshipJpaRepository internshipJpaRepository;
    private final InternshipRequirementsJpaRepository internshipRequirementsJpaRepository;
    private final Mapper mapper;

    @Autowired
    public InternshipDetailsService(InternshipJpaRepository internshipJpaRepository, InternshipRequirementsJpaRepository internshipRequirementsJpaRepository, Mapper mapper) {

        this.internshipJpaRepository = internshipJpaRepository;
        this.internshipRequirementsJpaRepository = internshipRequirementsJpaRepository;
        this.mapper = mapper;

    }

    @Override
    public InternshipDetailsDTO getInternshipDetails(int internshipId) {
        Internship internship = internshipJpaRepository.findById(internshipId).get();
        InternshipRequirements internshipRequirements = internshipRequirementsJpaRepository.findById(internshipId).get();
        return mapper.toInternshipDetailsDTO(internship, internshipRequirements);
    }

}
