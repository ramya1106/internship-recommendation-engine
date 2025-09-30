package com.example.reccomendation_system.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.ColumnDefault;

import java.util.List;


@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "internship_requirements")
public class InternshipRequirements {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @ManyToOne
    @JoinColumn(name = "internship_id")
    private Internship internship;

    @Column(name = "mode")
    private String mode;

    @Column(name = "percentage")
    @ColumnDefault("0")
    private double percentage;

    @Column(name = "age")
    private int age;

    @Column(name = "gender")
    private String gender;

    @Column(name = "minimum_qualification")
    private String minimumQualification;

    @Column(name = "min_experience")
    private int minExperience;

    @Column(name = "max_experience")
    private int maxExperience;

    @Column(name = "stream")
    private String stream;

    @Column(name = "specialization")
    private String specialization;

    @Column(name = "description", columnDefinition = "TEXT")
    private String description;

    @OneToMany(mappedBy = "internshipRequirements", orphanRemoval = true, cascade = CascadeType.ALL)
    private List<InternshipSkill> skills;

}
