package com.example.reccomendation_system.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "citycoordinates")
@NoArgsConstructor
@AllArgsConstructor
@Data
public class CityCoordinates {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "name")
    private String cityName;
    @Column(name = "latitude")
    private double latitude;
    @Column(name = "longitude")
    private double longitude;
}
