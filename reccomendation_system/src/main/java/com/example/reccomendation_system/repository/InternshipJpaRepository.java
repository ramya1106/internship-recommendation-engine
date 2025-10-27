package com.example.reccomendation_system.repository;

import com.example.reccomendation_system.model.Internship;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface InternshipJpaRepository extends JpaRepository<Internship, Integer> {
    @Query("""
            SELECT MAX(i.appliedCount * 1.0 / i.totalCount),
            MIN(i.appliedCount * 1.0 / i.totalCount)
            FROM Internship i
            WHERE i.totalCount != 0
            AND i.id IN :ids
            """)
    public List<Object[]> findMaxMinRatios(@Param("ids") List<Integer> eligibleInternshipIds);

    @Query("""
            SELECT MAX(i.appliedCount), MIN(i.appliedCount) FROM
            Internship i
            WHERE i.id IN :ids""")
    public List<Object[]> findMaxMinAppliedCounts(@Param("ids") List<Integer> eligibleInternshipIds);

    @Query("SELECT i.totalCount FROM Internship i WHERE i.id = :id")
    public Integer findTotalCountById(@Param("id") int internshipId);

    @Query("SELECT i.appliedCount FROM Internship i WHERE i.id = :id")
    public Integer findAppliedCountById(@Param("id") int internshipId);

    @Query("SELECT i.appliedCount * 1.0 / i.totalCount FROM Internship i WHERE i.id = :id")
    public Double findAppliedRatioById(@Param("id") int internshipId);
}
