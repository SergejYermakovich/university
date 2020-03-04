package com.siarhei.app.core.service.impl;

import com.siarhei.app.core.model.Course;
import com.siarhei.app.core.model.File;
import com.siarhei.app.core.model.Lab;
import com.siarhei.app.core.model.Student;
import com.siarhei.app.core.repository.LabRepository;
import com.siarhei.app.core.service.LabService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class LabServiceImpl implements LabService {
    @Autowired
    private LabRepository labRepository;

    @Override
    public Lab save(Lab lab) {
        return labRepository.save(lab);
    }

    @Override
    public Optional<Integer> findMaxOrder(Long courseId) {
        return labRepository.findMaxOrder(courseId);
    }

    @Override
    public List<Lab> findAllByCourseName(String courseName) {
        return labRepository.findAllByCourseName(courseName);
    }

    @Override
    public List<Lab> findAll() {
        return labRepository.findAll();
    }

    @Override
    public List<Lab> findAllByStudent(Student student) {
        return labRepository.findAllByStudent(student);
    }

    @Override
    public List<Lab> findAllByStudentAndCourse(Student student, Course course) {
        return labRepository.findAllByStudentAndCourse(student, course);
    }

    @Override
    public Optional<Lab> findByReportId(Long id) {
        return labRepository.findByReportId(id);
    }

    @Override
    public Optional<Lab> findByReport(File report) {
        return labRepository.findByReport(report);
    }
}
