package com.example.reccomendation_system.model;

import jakarta.persistence.Embeddable;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import java.io.Serializable;


@Embeddable
@NoArgsConstructor
@AllArgsConstructor
public class UserSkillId implements Serializable {

    private int userId;
    private int skillId;

}
