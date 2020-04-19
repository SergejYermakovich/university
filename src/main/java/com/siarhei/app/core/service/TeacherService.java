package com.siarhei.app.core.service;

import com.siarhei.app.core.model.Teacher;
import com.siarhei.app.core.model.User;

import java.util.List;
import java.util.Optional;

public interface TeacherService {

    Optional<Teacher> getByUser(User user);

    List<Teacher> findAll();
}
