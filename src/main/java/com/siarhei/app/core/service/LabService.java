package com.siarhei.app.core.service;

import com.siarhei.app.core.model.Course;
import com.siarhei.app.core.model.Lab;
import com.siarhei.app.core.model.Student;

import java.util.List;
import java.util.Optional;

public interface LabService {
    Lab save(Lab lab);

    Optional<Integer> findMaxOrder(Long courseId);

    List<Lab> findAllByCourseName(String courseName);

    List<Lab> findAll();

    List<Lab> findAllByStudent(Student student);

    List<Lab> findAllByStudentAndCourse(Student student, Course course);

    Optional<Lab> findByReportId(Long id);
}
