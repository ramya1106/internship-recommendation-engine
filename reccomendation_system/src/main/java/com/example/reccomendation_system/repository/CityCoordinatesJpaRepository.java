package com.example.reccomendation_system.repository;

import com.example.reccomendation_system.dto.LocationCoordinates;
import com.example.reccomendation_system.model.CityCoordinates;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CityCoordinatesJpaRepository extends JpaRepository<CityCoordinates, Integer> {

    @Query("""
            SELECT new com.example.reccomendation_system.dto.LocationCoordinates(c.cityName, c.latitude, c.longitude)
             FROM CityCoordinates c
            WHERE c.cityName = :city""")
    List<LocationCoordinates> findCityCoordinatesByCityName(String city);
}
