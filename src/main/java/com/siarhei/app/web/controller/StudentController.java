package com.siarhei.app.web.controller;

import com.siarhei.app.core.exceptions.CourseNotFoundException;
import com.siarhei.app.core.exceptions.UserNotFoundException;
import com.siarhei.app.core.model.*;
import com.siarhei.app.core.service.*;
import com.siarhei.app.web.properties.ApplicationProperties;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.xwpf.extractor.XWPFWordExtractor;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequestMapping("student/")
public class StudentController {

    @Autowired
    private ApplicationProperties applicationProperties;

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
    public String allNews(Model model, Authentication authentication) {
        String login = authentication.getName();
        User user = userService.findByLogin(login).orElseThrow(UserNotFoundException::new);
        Student student = studentService.findByUser(user);
        StudentGroup studentGroup = student.getStudentGroup();
        List<Course> courses = courseService.getAllByStudentGroups(studentGroup);
        List<News> newsList = new ArrayList<>();
        for (Course course : courses) {
            newsList.addAll(newsService.getAllByCourse(course));
        }
        Collections.sort(newsList);
        model.addAttribute("news", newsList);
        return "student_news";
    }

    @RequestMapping(value = "/labs", method = RequestMethod.GET)
    public String allLabs(Model model, Authentication authentication) {
        User user = userService.findByLogin(authentication.getName()).orElseThrow(UserNotFoundException::new);
        Student student = studentService.findByUser(user);
        List<Lab> labs = labService.findAllByStudent(student);
        model.addAttribute("labs", labs);
        return "student_labs";
    }

    @RequestMapping(value = "/courses", method = RequestMethod.GET)
    public String courses(Model model, Authentication authentication) {
        User user = userService.findByLogin(authentication.getName()).orElseThrow(UserNotFoundException::new);
        Student student = studentService.findByUser(user);
        StudentGroup studentGroup = student.getStudentGroup();
        List<Course> courses = courseService.getAllByStudentGroups(studentGroup);
        model.addAttribute("courses", courses);
        return "student_courses";
    }

    @RequestMapping(value = "/courses/{id}", method = RequestMethod.GET)
    public String courseMenu(Model model, @PathVariable Long id) {
        model.addAttribute("courseId", id);
        return "student_course_menu";
    }

    @RequestMapping(value = "/courses/{id}/news", method = RequestMethod.GET)
    public String studentCourseNews(Model model, @PathVariable Long id) {
        Course course = courseService.getById(id).orElseThrow(CourseNotFoundException::new);
        List<News> newsList = newsService.getAllByCourse(course);
        model.addAttribute("newsList", newsList);
        return "student_course_news";
    }

    @RequestMapping(value = "/courses/{id}/labs", method = RequestMethod.GET)
    public String studentCourseLabs(Model model, Authentication authentication, @PathVariable Long id) {
        User user = userService.findByLogin(authentication.getName()).orElseThrow(UserNotFoundException::new);
        Course course = courseService.getById(id).orElseThrow(CourseNotFoundException::new);
        Student student = studentService.findByUser(user);
        List<Lab> labs = labService.findAllByStudentAndCourse(student, course);
        List<Lab> labsInProgress = labs.stream().filter(lab -> lab.getStatus() == LabStatus.IN_PROGRESS).collect(Collectors.toList());
        List<Lab> labsInReview = labs.stream().filter(lab -> lab.getStatus() == LabStatus.IN_REVIEW).collect(Collectors.toList());
        List<Lab> labsDone = labs.stream().filter(lab -> lab.getStatus() == LabStatus.DONE).collect(Collectors.toList());
        System.out.println("all labs quantity: " + labs.size());

        model.addAttribute("labsInProgress", labsInProgress);
        model.addAttribute("labsInReview", labsInReview);
        model.addAttribute("labsDone", labsDone);

        //разобраться с открытием документа
        model.addAttribute("path", applicationProperties.getPath() + "\\" + id);//"file://///" +
        return "student_course_labs";
    }

    @RequestMapping(value = "/courses/{id}/report/{filename}", method = RequestMethod.GET)
    public String openStudentReport(Model model, Authentication authentication, @PathVariable Long id, @PathVariable String filename) throws IOException, InvalidFormatException {
        FileInputStream fis = new FileInputStream(applicationProperties.getPath() + "\\" + id+ "\\" +"reports" + "\\" + filename + ".doc");
        //парсим файл
        XWPFDocument xdoc = new XWPFDocument(OPCPackage.open(fis));
        XWPFWordExtractor extractor = new XWPFWordExtractor(xdoc);
        extractor.close();//?
        xdoc.close();//?
        System.out.println(extractor.getText());
        model.addAttribute("document",extractor.getText());
        model.addAttribute("");
        return "edit_student_report";
    }

    @RequestMapping(value = "/courses/{id}/report/{filename}", method = RequestMethod.POST)
    public String openStudentRepor1t(Model model, Authentication authentication, @PathVariable Long id, @PathVariable String filename) {

        return "edit_student_report";
    }
}

