package com.siarhei.app.core.service;

import com.siarhei.app.core.model.Student;
import com.siarhei.app.core.model.User;

import java.util.List;

public interface StudentService {
    Student findByUser(User user);

    Student save(Student student);

    List<Student> findAll();
}
