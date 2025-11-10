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
            SELECT
            MAX(
                CASE i.totalCount
                    WHEN 0 THEN NULL
                    ELSE (i.appliedCount * 1.0 / i.totalCount)
                    END
                ),
            MIN(
                CASE i.totalCount
                    WHEN 0 THEN NULL
                    ELSE (i.appliedCount * 1.0 / i.totalCount)
                    END
                ),
            MAX(i.appliedCount),
            MIN(i.appliedCount)
            FROM Internship i
            WHERE i.id IN :ids""")
    List<Object[]> findMaxMinRatiosAndAppliedCounts(@Param("ids") List<Integer> eligibleInternshipIds);

    @Query("""
            SELECT
            CASE i.totalCount
                WHEN 0 THEN NULL
                ELSE (i.appliedCount * 1.0 / i.totalCount)
            END,
            i.appliedCount
            FROM Internship i
            WHERE i.id = :id""")
    List<Object[]> findAppliedRatioAndAppliedCountById(@Param("id") int internshipId);

    @Query("""
            SELECT MAX(i.appliedCount * 1.0 / i.totalCount),
            MIN(i.appliedCount * 1.0 / i.totalCount)
            FROM Internship i
            WHERE i.totalCount != 0
            AND i.id IN :ids
            """)
    List<Object[]> findMaxMinRatios(@Param("ids") List<Integer> eligibleInternshipIds);

    @Query("""
            SELECT MAX(i.appliedCount), MIN(i.appliedCount) FROM
            Internship i
            WHERE i.id IN :ids""")
    List<Object[]> findMaxMinAppliedCounts(@Param("ids") List<Integer> eligibleInternshipIds);

    @Query("""
            SELECT i.id, i.appliedCount,
            CASE i.totalCount
                WHEN 0 THEN NULL
                ELSE i.appliedCount * 1.0 / i.totalCount
            END
            FROM Internship i
            WHERE i.id IN :ids
            """)
    List<Object[]> findAllAppliedCountsAndAppliedRatiosById(@Param("ids") List<Integer> eligibleInternshipIds);

    @Query("""
            SELECT i.id, i.state, i.district
            FROM Internship i
            WHERE i.id IN :ids""")
    List<Object[]> findAllStatesAndDistrictsById(@Param("ids") List<Integer> eligibleInternshipIds);
}
