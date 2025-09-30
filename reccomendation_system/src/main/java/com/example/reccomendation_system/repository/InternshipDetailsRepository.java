package com.example.reccomendation_system.repository;

import com.example.reccomendation_system.dto.InternshipDetailsDTO;

public interface InternshipDetailsRepository {

    public InternshipDetailsDTO getInternshipDetails(int internshipId);

}
