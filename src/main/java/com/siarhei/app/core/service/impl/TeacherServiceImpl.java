package com.siarhei.app.core.service.impl;

import com.siarhei.app.core.model.Teacher;
import com.siarhei.app.core.model.User;
import com.siarhei.app.core.repository.TeacherRepository;
import com.siarhei.app.core.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class TeacherServiceImpl implements TeacherService {

    @Autowired
    private TeacherRepository teacherRepository;

    @Override
    public Optional<Teacher> getByUser(User user) {
        return teacherRepository.getByUser(user);
    }

    @Override
    public List<Teacher> findAll() {
        return teacherRepository.findAll();
    }
}
