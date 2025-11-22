package com.example.reccomendation_system.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class LocationDTO {
    private int internshipId;
    private String cityName;
    private Double cityLatitude;
    private Double cityLongitude;
    private String stateName;
    private Double stateLatitude;
    private Double stateLongitude;
}
