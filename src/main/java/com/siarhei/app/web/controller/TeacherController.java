package com.siarhei.app.web.controller;

import com.siarhei.app.core.exceptions.CourseNotFoundException;
import com.siarhei.app.core.exceptions.TeacherNotFoundException;
import com.siarhei.app.core.exceptions.UserNotFoundException;
import com.siarhei.app.core.model.Course;
import com.siarhei.app.core.model.Teacher;
import com.siarhei.app.core.model.User;
import com.siarhei.app.core.service.CourseService;
import com.siarhei.app.core.service.TeacherService;
import com.siarhei.app.core.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("teacher/")
public class TeacherController {

    @Autowired
    CourseService courseService;

    @Autowired
    UserService userService;

    @Autowired
    TeacherService teacherService;

    @RequestMapping(value = "/courses", method = RequestMethod.GET)
    public String courses(Model model, Authentication authentication) {
        User user = userService.findByLogin(authentication.getName()).orElseThrow(UserNotFoundException::new);
        Teacher teacher = teacherService.getByUser(user).orElseThrow(TeacherNotFoundException::new);
        model.addAttribute("courses", courseService.getAllByTeacher(teacher));
        return "teacher_courses";
    }

    @RequestMapping(value = "/courses/{id}", method = RequestMethod.GET)
    public String coursesMenu(Model model, @PathVariable Long id) {
        Course course = courseService.getById(id).orElseThrow(CourseNotFoundException::new);
        model.addAttribute("course", course);
        return "teacher_course_menu";
    }

}
