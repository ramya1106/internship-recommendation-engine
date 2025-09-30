package com.example.reccomendation_system.repository;

import com.example.reccomendation_system.dto.UserDTO;

public interface UserRepository {

    public UserDTO getUserDetails(int userId);

}