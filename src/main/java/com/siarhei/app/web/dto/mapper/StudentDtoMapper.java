package com.siarhei.app.web.dto.mapper;

import com.siarhei.app.core.model.Student;
import com.siarhei.app.core.model.StudentGroup;
import com.siarhei.app.core.service.StudentGroupService;
import com.siarhei.app.web.dto.StudentInDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class StudentDtoMapper {

    @Autowired
    StudentGroupService studentGroupService;

    public void fillFromInDto(Student student, StudentInDto studentInDto) {
        String studentGroupStr = studentInDto.getStudentGroup();
        StudentGroup studentGroup = studentGroupService.findByName(studentGroupStr).orElseThrow();
        student.setStudentGroup(studentGroup);
        student.setAddress(studentInDto.getAddress());
        student.setNationality(studentInDto.getNationality());
    }
}
