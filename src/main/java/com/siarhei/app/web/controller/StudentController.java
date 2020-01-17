package com.siarhei.app.web.controller;

import com.siarhei.app.core.exceptions.UserNotFoundException;
import com.siarhei.app.core.model.*;
import com.siarhei.app.core.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Controller
@RequestMapping("student/")
public class StudentController {

    @Autowired
    private UserService userService;

    @Autowired
    private StudentService studentService;

    @Autowired
    private CourseService courseService;

    @Autowired
    private NewsService newsService;

    @Autowired
    private LabService labService;

    @RequestMapping(value = "/news", method = RequestMethod.GET)
    public String news(Model model, Authentication authentication) {
        String login = authentication.getName();
        System.out.println("login: " + login);
        User user = userService.findByLogin(login).orElseThrow(UserNotFoundException::new);
        System.out.println("username: " + user.getName());
        Student student = studentService.findByUser(user);
        System.out.println("student group: " + student.getStudentGroup());
        StudentGroup studentGroup = student.getStudentGroup();
        List<Course> courses = courseService.getAllByStudentGroups(studentGroup);
        System.out.println("courses: " + courses.size());
        List<News> newsList = new ArrayList<>();
        for (Course course : courses) {
            System.out.println(course.getDescription());
            newsList.addAll(newsService.getAllByCourse(course));
        }
        Collections.sort(newsList);
        model.addAttribute("news", newsList);
        return "student_news";
    }

    @RequestMapping(value = "/labs", method = RequestMethod.GET)
    public String labs(Model model, Authentication authentication) {
model.addAttribute("labs");
        return "student_labs";
    }
}
