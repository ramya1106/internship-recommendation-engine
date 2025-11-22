package com.example.reccomendation_system.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class LocationCoordinates {
    String locationName;
    double latitude;
    double longitude;
}
