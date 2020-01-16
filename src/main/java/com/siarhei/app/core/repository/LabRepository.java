package com.siarhei.app.core.repository;

import com.siarhei.app.core.model.Lab;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface LabRepository  extends JpaRepository<Lab, Long> {

    @Query("SELECT MAX(lab.order) FROM Lab lab")
    Optional<Integer> findMaxOrder();

    List<Lab> findAllByCourseName(String courseName);
}
