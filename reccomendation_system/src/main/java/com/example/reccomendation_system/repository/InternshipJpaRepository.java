package com.example.reccomendation_system.repository;

import com.example.reccomendation_system.model.Internship;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface InternshipJpaRepository extends JpaRepository<Internship, Integer> {
}
