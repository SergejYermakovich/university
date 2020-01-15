package com.siarhei.app.web.controller;

import com.siarhei.app.core.exceptions.CourseNotFoundException;
import com.siarhei.app.core.model.Course;
import com.siarhei.app.core.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
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

    @RequestMapping(value = "/courses", method = RequestMethod.GET)
    public String courses(Model model) {
        model.addAttribute("courses", courseService.getAll());
        return "teacher_courses";
    }

    @RequestMapping(value = "/courses/{id}", method = RequestMethod.GET)
    public String coursesMenu(Model model, @PathVariable Long id) {
        Course course = courseService.getById(id).orElseThrow(CourseNotFoundException::new);
        model.addAttribute("course", course);
        return "teacher_course_menu";
    }

}
