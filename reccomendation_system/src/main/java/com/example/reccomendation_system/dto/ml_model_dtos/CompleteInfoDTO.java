package com.example.reccomendation_system.dto.ml_model_dtos;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CompleteInfoDTO {

    @JsonProperty("user_info")
    private UserInfoDTO userInfoDTO;

    @JsonProperty("internships")
    private ArrayList<InternshipInfoDTO> internshipInfoDTOS;

}
