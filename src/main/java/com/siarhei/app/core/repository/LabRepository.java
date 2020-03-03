package com.siarhei.app.core.repository;

import com.siarhei.app.core.model.Course;
import com.siarhei.app.core.model.Lab;
import com.siarhei.app.core.model.Student;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface LabRepository extends JpaRepository<Lab, Long> {

    @Query("SELECT MAX(lab.order) FROM Lab lab where lab.course.id =?1")
    Optional<Integer> findMaxOrder(Long courseId);

    List<Lab> findAllByCourseName(String courseName);

    List<Lab> findAllByStudent(Student student);

    List<Lab> findAllByStudentAndCourse(Student student, Course course);

    Optional<Lab> findByReportId(Long id);
}
