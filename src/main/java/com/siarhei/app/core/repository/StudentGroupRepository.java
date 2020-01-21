package com.siarhei.app.core.repository;

import com.siarhei.app.core.model.Course;
import com.siarhei.app.core.model.StudentGroup;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface StudentGroupRepository extends JpaRepository<StudentGroup, Long> {
    Optional<StudentGroup> findByName(String name);

    List<StudentGroup> findAllByCourses(Course course);

    Optional<StudentGroup> findById(long id);
}
