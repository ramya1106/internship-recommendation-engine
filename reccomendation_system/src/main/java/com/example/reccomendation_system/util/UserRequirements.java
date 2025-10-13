package com.example.reccomendation_system.util;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserRequirements {

    private String role;
    private String sector;
    private double minStipend;
    @JsonProperty("preferred_mode")
    private String preferredMode;
    private String preferredLocation;
    private String employmentType;

}
