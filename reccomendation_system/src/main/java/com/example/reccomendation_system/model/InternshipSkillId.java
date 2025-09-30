package com.example.reccomendation_system.model;


import jakarta.persistence.Embeddable;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Embeddable
@NoArgsConstructor
@AllArgsConstructor
@Data
public class InternshipSkillId implements Serializable {

    private int internshipId;
    private int skillId;

}
