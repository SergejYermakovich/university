package com.siarhei.app.core.service;

import com.siarhei.app.core.model.Course;
import com.siarhei.app.core.model.StudentGroup;

import java.util.List;
import java.util.Optional;

public interface StudentGroupService {

    StudentGroup save(StudentGroup studentGroup);

    void delete(StudentGroup studentGroup);

    Optional<StudentGroup> findByName(String name);

    List<StudentGroup> getAll();

    List<StudentGroup> findAllByCourses(Course course);

    Optional<StudentGroup> findById(long id);
}
