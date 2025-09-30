package com.example.reccomendation_system.repository;

import com.example.reccomendation_system.dto.InternshipDTO;

import java.util.ArrayList;

public interface InternshipRepository {

    public ArrayList<InternshipDTO> getInternships();

}
