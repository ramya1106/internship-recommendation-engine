package com.example.reccomendation_system.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Entity
@Table(name = "locationsdistance")
@NoArgsConstructor
@AllArgsConstructor
@Data
public class LocationsDistance {
    @Id
    @Column(name = "locations")
    private String locationsString;
    @Column(name = "distance")
    private double distance;
    @Column(name = "usedat")
    private Date usedAt;
}
