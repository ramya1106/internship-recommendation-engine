package com.example.reccomendation_system.util;

import com.example.reccomendation_system.model.InternshipRequirements;
import com.example.reccomendation_system.model.User;
import com.example.reccomendation_system.repository.InternshipRequirementsJpaRepository;
import com.example.reccomendation_system.repository.UserJpaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.HashMap;

@Component
public class QulaificationDataMigration implements CommandLineRunner {

    private final InternshipRequirementsJpaRepository internshipRequirementsJpaRepository;
    private final UserJpaRepository userJpaRepository;
    private HashMap<String, Integer> qualificationConstants;

    @Autowired
    public QulaificationDataMigration(InternshipRequirementsJpaRepository internshipRequirementsJpaRepository, UserJpaRepository userJpaRepository) {
        this.internshipRequirementsJpaRepository = internshipRequirementsJpaRepository;
        this.userJpaRepository = userJpaRepository;
        this.qualificationConstants = QualificationConstants.QUALIFICATION_CONSTANTS;
    }

    @Override
    public void run(String... args) throws Exception {


        ArrayList<InternshipRequirements> internshipRequirementsList = new ArrayList<>(internshipRequirementsJpaRepository.findAll());
        for (InternshipRequirements i : internshipRequirementsList) {
            if (i.getMinimumQualification() != null && i.getMinimumQualificationRank() == 0) {
                i.setMinimumQualificationRank(qualificationConstants.get(i.getMinimumQualification()));
            }
        }

        ArrayList<User> users = new ArrayList<>(userJpaRepository.findAll());
        for (User u : users) {
            if (u.getHighestQualification() != null && u.getHighestQualificationRank() == 0) {
                u.setHighestQualificationRank(qualificationConstants.get(u.getHighestQualification()));
            }
        }

    }
}
