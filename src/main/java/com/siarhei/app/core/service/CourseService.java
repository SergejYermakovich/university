package com.siarhei.app.core.service;

import com.siarhei.app.core.model.Course;
import com.siarhei.app.core.model.StudentGroup;
import com.siarhei.app.core.model.Teacher;

import java.util.List;
import java.util.Optional;

public interface CourseService {

    Course save(Course course);

    Optional<Course> getById(long id);

    List<Course> getAllByStudentGroups(StudentGroup studentGroup);

    List<Course> getAll();

    List<Course> getAllByTeacher(Teacher teacher);
}
