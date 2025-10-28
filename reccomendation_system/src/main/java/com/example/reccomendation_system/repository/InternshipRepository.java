package com.example.reccomendation_system.repository;

import com.example.reccomendation_system.dto.InternshipDTO;
import com.example.reccomendation_system.util.UserRequirements;

import java.util.ArrayList;

public interface InternshipRepository {
    ArrayList<InternshipDTO> getInternships();
    ArrayList<InternshipDTO> getPreferenceScoreRankedInternships(int userId, UserRequirements userRequirements);
}
