package com.example.reccomendation_system.service;

import com.example.reccomendation_system.dto.InternshipDTO;
import com.example.reccomendation_system.mapper.Mapper;
import com.example.reccomendation_system.model.Internship;
import com.example.reccomendation_system.repository.InternshipJpaRepository;
import com.example.reccomendation_system.repository.InternshipRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class InternshipService implements InternshipRepository {

    private final InternshipJpaRepository internshipJpaRepository;
    private final Mapper mapper;

    @Autowired
    public InternshipService(InternshipJpaRepository internshipJpaRepository, Mapper mapper) {
        this.internshipJpaRepository = internshipJpaRepository;
        this.mapper = mapper;
    }

    @Override
    public ArrayList<InternshipDTO> getInternships() {

        List<Internship> internshipList = internshipJpaRepository.findAll();
        ArrayList<InternshipDTO> internshipDTOS = new ArrayList<>();

        for (Internship internship : internshipList) {
            internshipDTOS.add(mapper.toInternshipDTO(internship));
        }
        return internshipDTOS;

    }
}
