package com.example.reccomendation_system.repository;

import com.example.reccomendation_system.dto.InternshipDTO;
import com.example.reccomendation_system.dto.ml_model_dtos.CompleteInfoDTO;
import com.example.reccomendation_system.dto.ml_model_dtos.ScoredInternshipDTO;

import java.util.ArrayList;

public interface MlModelRepository {
    public ArrayList<InternshipDTO> getTopFiveInternships(int userId);

    public ArrayList<ScoredInternshipDTO> getScoredInternships(CompleteInfoDTO completeInfo);
}
