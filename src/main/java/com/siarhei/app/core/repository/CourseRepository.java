package com.siarhei.app.core.repository;

import com.siarhei.app.core.model.Course;
import com.siarhei.app.core.model.StudentGroup;
import org.springframework.data.jpa.repository.JpaRepository;


import java.util.List;
import java.util.Optional;

public interface CourseRepository extends JpaRepository<Course, Long> {

    Optional<Course> getById(long id);

    List<Course> getAllByStudentGroups(StudentGroup studentGroup);

}
