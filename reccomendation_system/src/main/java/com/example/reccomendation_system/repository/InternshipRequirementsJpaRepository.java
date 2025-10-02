package com.example.reccomendation_system.repository;

import com.example.reccomendation_system.dto.InternshipDTO;
import com.example.reccomendation_system.model.InternshipRequirements;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface InternshipRequirementsJpaRepository extends JpaRepository<InternshipRequirements, Integer> {
    @Query("""
       SELECT new com.example.reccomendation_system.dto.InternshipDTO(
           i.id, i.title, i.company, i.duration,
           i.postingTime, i.sector, i.description,
           i.appliedCount, i.totalCount,
           i.benefits, i.state, i.district
       )
       FROM InternshipRequirements ir
       JOIN ir.internship i
       WHERE (ir.age IS NULL OR ir.age <= :age)
         AND (ir.gender IS NULL OR ir.gender = :gender OR ir.gender = 'Any')
       """)
    List<InternshipDTO> findValidInternships(int age, String gender);

}
