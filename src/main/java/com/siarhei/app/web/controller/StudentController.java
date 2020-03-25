package com.siarhei.app.web.controller;

import com.siarhei.app.core.exceptions.CourseNotFoundException;
import com.siarhei.app.core.exceptions.DocumentNotFoundException;
import com.siarhei.app.core.exceptions.LabNotFoundException;
import com.siarhei.app.core.exceptions.UserNotFoundException;
import com.siarhei.app.core.model.*;
import com.siarhei.app.core.service.*;
import com.siarhei.app.web.properties.ApplicationProperties;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.xwpf.extractor.XWPFWordExtractor;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.apache.poi.xwpf.usermodel.XWPFRun;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.awt.*;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Path;
import java.util.*;
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
    private TeacherService teacherService;

    @Autowired
    private CourseService courseService;

    @Autowired
    private NewsService newsService;

    @Autowired
    private LabService labService;

    @Autowired
    private NotificationService notificationService;

    @Autowired
    private FileService fileService;

    @Autowired
    private LabCommentService labCommentService;

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

        return "student_course_labs";
    }

    @RequestMapping(value = "/courses/{id}/report/{filename}", method = RequestMethod.GET)
    public String openStudentReport(Model model, Authentication authentication, @PathVariable Long id, @PathVariable String filename) throws IOException, InvalidFormatException {
        FileInputStream fileInputStream = new FileInputStream(applicationProperties.getPath() + "\\" + id + "\\" + "reports" + "\\" + filename + ".doc");
        XWPFDocument document = new XWPFDocument(OPCPackage.open(fileInputStream));
        XWPFWordExtractor extractor = new XWPFWordExtractor(document);
        extractor.close();
        document.close();
        model.addAttribute("document", extractor.getText());

        com.siarhei.app.core.model.File file = fileService.findByFileName(filename).orElseThrow(FileNotFoundException::new);
        Lab lab = labService.findByReport(file).orElseThrow(LabNotFoundException::new);

        List<LabComment> labComments = labCommentService.getAllByLab(lab);
        if (!labComments.isEmpty()) {
            labComments.sort((o1, o2) -> o1.getDate().compareTo(o2.getDate()));
            model.addAttribute("lastComment",labComments.get(0));
            model.addAttribute("labComments",labComments);
        }

        return "edit_student_report";
    }

    @RequestMapping(value = "/courses/{id}/report/{filename}", method = RequestMethod.POST)
    public String saveStudentReport(@ModelAttribute("text") String text, @PathVariable String filename, @PathVariable String id) throws IOException {
        File report = Path.of(applicationProperties.getPath() + "\\" + id + "\\" + "reports" + "\\" + filename + ".doc").toFile();
        XWPFDocument document = new XWPFDocument();
        XWPFParagraph tmpParagraph = document.createParagraph();
        XWPFRun tmpRun = tmpParagraph.createRun();
        tmpRun.setText(text);
        document.write(new FileOutputStream(report));
        document.close();
        return "redirect:/student/courses/{id}/report/{filename}";
    }


    @RequestMapping(value = "/courses/{id}/sendReportToReview/{filename}", method = RequestMethod.GET)
    public String sendReportToReview(@PathVariable String filename, @PathVariable int id, Authentication authentication) {
        int orderNumber = getOrderByFilename(filename);
        User user = userService.findByLogin(authentication.getName()).orElseThrow(UserNotFoundException::new);
        Student student = studentService.findByUser(user);
        Course course = courseService.getById(id).orElseThrow(CourseNotFoundException::new);
        List<Lab> labs = labService.findAllByStudent(student);
        Lab lab = labs.stream()
                .filter(lb -> lb.getCourse().getId().equals(course.getId()))
                .filter(lb -> lb.getOrder() == orderNumber).findFirst().orElseThrow(LabNotFoundException::new);
        lab.setStatus(LabStatus.IN_REVIEW);
        labService.save(lab);

        createNotificationForTeacherAboutLabStatus(lab, user, course);
        return "redirect:/student/courses/{id}/labs";
    }

    @RequestMapping(value = "/courses/{id}/backReportToInProgress/{filename}", method = RequestMethod.GET)
    public String backReportToInProgress(@PathVariable String filename, @PathVariable int id, Authentication authentication) {
        User user = userService.findByLogin(authentication.getName()).orElseThrow(UserNotFoundException::new);
        Student student = studentService.findByUser(user);
        Course course = courseService.getById(id).orElseThrow(CourseNotFoundException::new);
        List<Lab> labs = labService.findAllByStudent(student);
        Lab lab = labs.stream()
                .filter(lb -> lb.getCourse().getId().equals(course.getId()))
                .filter(lb -> lb.getOrder() == getOrderByFilename(filename)).findFirst().orElseThrow(LabNotFoundException::new);
        lab.setStatus(LabStatus.IN_PROGRESS);
        labService.save(lab);

        createNotificationForTeacherAboutLabStatus(lab, user, course);
        return "redirect:/student/courses/{id}/labs";
    }

    @RequestMapping(value = "/courses/{id}/openManual/{filename}", method = RequestMethod.GET)
    public String openManual(@PathVariable String filename, @PathVariable int id) {
        File file = Path.of(applicationProperties.getPath() + "\\" + id + "\\" + "manuals" + "\\" + filename + ".doc").toFile();
        try {
            Desktop.getDesktop().open(file);
        } catch (IOException e) {
           throw new DocumentNotFoundException();
        }
        return "redirect:/student/courses/{id}/labs";
    }


    private int getOrderByFilename(String filename) {
        String order = "";
        for (int i = filename.length() - 1; i >= 0; i--) {
            if (filename.charAt(i) <= 57 && filename.charAt(i) >= 49) {
                order = filename.charAt(i) + order;
            } else {
                break;
            }
        }
        return Integer.parseInt(order);
    }

    private void createNotificationForTeacherAboutLabStatus(Lab lab, User fromWhom, Course course){
        String message = "Lab №" + lab.getOrder() + " of " + lab.getCourse().getName() + " course of " + fromWhom.getName() + " " + fromWhom.getSurname() + " is " + lab.getStatus() + " now.";
        Notification notification = notificationService.createNotification(message, course.getTeacher().getUser());
        notificationService.save(notification);
    }
}

