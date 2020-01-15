package com.siarhei.app.core.service;

import com.siarhei.app.core.model.Course;
import com.siarhei.app.core.model.StudentGroup;

import java.util.List;
import java.util.Optional;

public interface CourseService {

    Optional<Course> getById(long id);

    List<Course> getAllByStudentGroups(StudentGroup studentGroup);

    List<Course> getAll();
}
