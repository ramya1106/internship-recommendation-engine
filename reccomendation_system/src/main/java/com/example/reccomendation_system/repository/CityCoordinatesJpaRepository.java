package com.example.reccomendation_system.repository;

import com.example.reccomendation_system.model.CityCoordinates;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CityCoordinatesJpaRepository extends JpaRepository<CityCoordinates, Integer> {

}
