package com.example.reccomendation_system.model;


import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.ColumnDefault;

import java.util.Date;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "internship")
public class Internship {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "title", nullable = false)
    private String title; // NOT NULL

    @ManyToOne
    @JoinColumn(name = "company_id", nullable = false)
    private Company company;// FK , NOT NULL

    @Column(name = "min_stipend")
    @ColumnDefault("0")
    private double minStipend;

    @Column(name = "max_stipend")
    @ColumnDefault("0")
    private double maxStipend;

    @Column(name = "duration")
    private String duration; // 1 month

    @Column(name = "posting_time", nullable = false)
    private Date postingTime; // not null

    @Column(name = "location")
    private String location;

    @Column(name = "sector")
    private String sector;

    @Column(name = "description", columnDefinition = "TEXT")
    private String description;

    @Column(name = "applied_count")
    private int appliedCount;

    @Column(name = "total_count")
    private int totalCount;

    @Column(name = "internship_state")
    private String internshipState;

    @Column(name = "internship_district")
    private String internshipDistrict;

    @Column(name = "benefits")
    private String benefits;

    @Column(name = "address_line1")
    private String addressLine1;

    @Column(name = "address_line2")
    private String addressLine2;

    @Column(name = "state")
    private String state;

    @Column(name = "district")
    private String district;

    @Column(name = "block")
    private String block;

    @Column(name = "village")
    private String village;

    @Column(name = "field")
    private String field;

    @Column(name = "postal_code")
    private String postalCode;
}
