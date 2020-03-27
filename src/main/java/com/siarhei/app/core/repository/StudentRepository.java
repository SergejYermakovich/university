package com.siarhei.app.core.repository;

import com.siarhei.app.core.model.Student;

import com.siarhei.app.core.model.StudentGroup;
import com.siarhei.app.core.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


public interface StudentRepository extends JpaRepository<Student, Long> {
    Student findByUser(User user);

    List<Student> findAllByStudentGroup(StudentGroup studentGroup);
}