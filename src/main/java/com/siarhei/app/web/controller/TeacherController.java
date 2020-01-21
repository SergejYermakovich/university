package com.siarhei.app.web.controller;

import com.siarhei.app.core.exceptions.CourseNotFoundException;
import com.siarhei.app.core.exceptions.StudentGroupNotFoundException;
import com.siarhei.app.core.exceptions.TeacherNotFoundException;
import com.siarhei.app.core.exceptions.UserNotFoundException;
import com.siarhei.app.core.model.*;
import com.siarhei.app.core.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequestMapping("teacher/")
public class TeacherController {

    @Autowired
    private CourseService courseService;

    @Autowired
    private UserService userService;

    @Autowired
    private TeacherService teacherService;

    @Autowired
    private StudentGroupService studentGroupService;

    @Autowired
    private LabService labService;

    @RequestMapping(value = "/courses", method = RequestMethod.GET)
    public String courses(Model model, Authentication authentication) {
        User user = userService.findByLogin(authentication.getName()).orElseThrow(UserNotFoundException::new);
        Teacher teacher = teacherService.getByUser(user).orElseThrow(TeacherNotFoundException::new);
        model.addAttribute("courses", courseService.getAllByTeacher(teacher));
        return "teacher_courses";
    }

    @RequestMapping(value = "/courses/{courseId}", method = RequestMethod.GET)
    public String coursesMenu(Model model, @PathVariable Long courseId) {
        Course course = courseService.getById(courseId).orElseThrow(CourseNotFoundException::new);
        model.addAttribute("course", course);
        List<StudentGroup> studentGroups = studentGroupService.findAllByCourses(course);
        model.addAttribute("studentGroups", studentGroups);
        return "teacher_course_menu";
    }

    @RequestMapping(value = "/courses/{courseId}/studentGroup/{studentGroupId}", method = RequestMethod.GET)
    public String studentGroupOfCourse(Model model, @PathVariable Long courseId, @PathVariable Long studentGroupId) {
        StudentGroup studentGroup = studentGroupService.findById(studentGroupId).orElseThrow(StudentGroupNotFoundException::new);
        List<Lab> labList = labService.findAll().stream()
                .filter(lab -> lab.getCourse().getId().equals(courseId))
                .filter(lab -> lab.getCourse().getStudentGroups().contains(studentGroup))
                .collect(Collectors.toList());

        List<Lab> labsInReview = labList.stream().filter(lab -> lab.getStatus() == LabStatus.IN_REVIEW).collect(Collectors.toList());
        List<Lab> labsInProgress = labList.stream().filter(lab -> lab.getStatus() == LabStatus.IN_PROGRESS).collect(Collectors.toList());
        List<Lab> labsDone = labList.stream().filter(lab -> lab.getStatus() == LabStatus.DONE).collect(Collectors.toList());

        model.addAttribute("labsInProgress", labsInProgress);
        model.addAttribute("labsInReview", labsInReview);
        model.addAttribute("labsDone", labsDone);

        return "teacher_student_group";
    }

}
