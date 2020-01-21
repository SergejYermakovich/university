package com.siarhei.app.core.service.impl;

import com.siarhei.app.core.model.Course;
import com.siarhei.app.core.model.StudentGroup;
import com.siarhei.app.core.repository.StudentGroupRepository;
import com.siarhei.app.core.service.StudentGroupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class StudentGroupServiceImpl implements StudentGroupService {

    @Autowired
    private StudentGroupRepository studentGroupRepository;

    @Override
    public Optional<StudentGroup> findByName(String name) {
        return studentGroupRepository.findByName(name);
    }

    @Override
    public List<StudentGroup> getAll() {
        return studentGroupRepository.findAll();
    }

    @Override
    public List<StudentGroup> findAllByCourses(Course course) {
        return studentGroupRepository.findAllByCourses(course);
    }

    @Override
    public Optional<StudentGroup> findById(long id) {
        return studentGroupRepository.findById(id);
    }
}
