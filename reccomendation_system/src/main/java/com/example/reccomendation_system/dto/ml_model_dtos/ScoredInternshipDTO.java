package com.example.reccomendation_system.dto.ml_model_dtos;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ScoredInternshipDTO {

    @JsonProperty("internship_id")
    private int internshipId;

    @JsonProperty("score")
    private double probability;
}
