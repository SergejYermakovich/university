package com.siarhei.app.core.service.impl;

import com.siarhei.app.core.model.Student;
import com.siarhei.app.core.model.StudentGroup;
import com.siarhei.app.core.model.User;
import com.siarhei.app.core.repository.StudentRepository;
import com.siarhei.app.core.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class StudentServiceImpl implements StudentService {

    @Autowired
    private StudentRepository studentRepository;

    @Override
    public Student findByUser(User user) {
        return studentRepository.findByUser(user);
    }

    @Override
    public Student save(Student student) {
        return studentRepository.save(student);
    }

    @Override
    public List<Student> findAll() {
        return studentRepository.findAll();
    }

    @Override
    public List<Student> findAllByStudentGroup(StudentGroup studentGroup) {
        return studentRepository.findAllByStudentGroup(studentGroup);
    }
}
