package com.example.reccomendation_system.dto;


import com.example.reccomendation_system.model.Skill;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class InternshipDetailsDTO {

    private String title;
    private String sector;
    private String field;
    private int totalCount;
    private int appliedCount;
    private String internshipDescription;

    private String address;
    private String minimumQualification;
    private String course;
    private String specialization;
    private ArrayList<Skill> skills;
    private String qualificationsDescription;

    private String benefits;

}
