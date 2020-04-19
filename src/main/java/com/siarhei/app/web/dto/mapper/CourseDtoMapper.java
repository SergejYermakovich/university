package com.siarhei.app.web.dto.mapper;

import com.siarhei.app.core.exceptions.StudentGroupNotFoundException;
import com.siarhei.app.core.exceptions.TeacherNotFoundException;
import com.siarhei.app.core.exceptions.UserNotFoundException;
import com.siarhei.app.core.model.Course;
import com.siarhei.app.core.model.StudentGroup;
import com.siarhei.app.core.model.Teacher;
import com.siarhei.app.core.model.User;
import com.siarhei.app.core.service.StudentGroupService;
import com.siarhei.app.core.service.TeacherService;
import com.siarhei.app.core.service.UserService;
import com.siarhei.app.web.dto.CourseInDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class CourseDtoMapper {

    @Autowired
    private TeacherService teacherService;

    @Autowired
    private UserService userService;

    @Autowired
    private StudentGroupService studentGroupService;

    public void fillFromInDto(Course course, CourseInDto courseInDto) {

        String name = courseInDto.getName();
        String description = courseInDto.getDescription();
        String studentGroupString = courseInDto.getStudentGroup();
        String teacherString = courseInDto.getTeacher();

        User user = userService.findBySurname(teacherString).stream().findFirst().orElseThrow(UserNotFoundException::new);
        Teacher teacher = teacherService.getByUser(user).orElseThrow(TeacherNotFoundException::new);
        StudentGroup studentGroup = studentGroupService.findByName(studentGroupString).orElseThrow(StudentGroupNotFoundException::new);
        List<StudentGroup> studentGroups = new ArrayList<>();

        studentGroups.add(studentGroup);

        course.setName(name);
        course.setDescription(description);
        course.setTeacher(teacher);
        course.setStudentGroups(studentGroups);

    }
}
