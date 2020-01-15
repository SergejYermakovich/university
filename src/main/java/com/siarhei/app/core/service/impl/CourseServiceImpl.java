package com.siarhei.app.core.service.impl;

import com.siarhei.app.core.model.Course;
import com.siarhei.app.core.model.StudentGroup;
import com.siarhei.app.core.repository.CourseRepository;
import com.siarhei.app.core.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class CourseServiceImpl implements CourseService {

    @Autowired
    CourseRepository courseRepository;

    @Override
    public Optional<Course> getById(long id) {
        return courseRepository.getById(id);
    }

    @Override
    public List<Course> getAllByStudentGroups(StudentGroup studentGroup) {
        return courseRepository.getAllByStudentGroups(studentGroup);
    }

    @Override
    public List<Course> getAll() {
        return courseRepository.findAll();
    }
}
