package com.siarhei.app.web.controller;

import com.siarhei.app.core.exceptions.*;
import com.siarhei.app.core.model.*;
import com.siarhei.app.core.service.*;
import com.siarhei.app.web.dto.StudentInDto;
import com.siarhei.app.web.properties.ApplicationProperties;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.xwpf.extractor.XWPFWordExtractor;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequestMapping("teacher/")
public class TeacherController {

    @Autowired
    private ApplicationProperties applicationProperties;

    @Autowired
    private CourseService courseService;

    @Autowired
    private UserService userService;

    @Autowired
    private TeacherService teacherService;

    @Autowired
    private NotificationService notificationService;

    @Autowired
    private StudentGroupService studentGroupService;

    @Autowired
    private StudentService studentService;

    @Autowired
    private LabService labService;

    @Autowired
    private LabCommentService labCommentService;

    @Autowired
    private FileService fileService;

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
                .filter(lab -> lab.getStudent().getStudentGroup().getName().equals(studentGroup.getName()))
                .collect(Collectors.toList());

        List<Lab> labsInReview = labList.stream().filter(lab -> lab.getStatus() == LabStatus.IN_REVIEW).collect(Collectors.toList());
        List<Lab> labsInProgress = labList.stream().filter(lab -> lab.getStatus() == LabStatus.IN_PROGRESS).collect(Collectors.toList());
        List<Lab> labsDone = labList.stream().filter(lab -> lab.getStatus() == LabStatus.DONE).collect(Collectors.toList());

        model.addAttribute("labsInProgress", labsInProgress);
        model.addAttribute("labsInReview", labsInReview);
        model.addAttribute("labsDone", labsDone);

        return "teacher_student_group";
    }


    @RequestMapping(value = "/courses/{courseId}/studentGroup/{studentGroupId}/statistics", method = RequestMethod.GET)
    public String studentStatistics(Model model, @PathVariable Long courseId, @PathVariable Long studentGroupId) {
        StudentGroup studentGroup = studentGroupService.findById(studentGroupId).orElseThrow(StudentGroupNotFoundException::new);
        List<Student> studentList = studentService.findAllByStudentGroup(studentGroup);
        List<Lab> labList = labService.findAll();
        int allLabsQuantity = labService.findMaxOrder(courseId).orElse(0);

        List<StudentLabStatistics> studentLabStatistics = new ArrayList<>();
        for (Student student : studentList) {
            int onReview = 0, done = 0, inProgress = 0;
            for (Lab lab : labList) {
                if (lab.getStudent().getId().equals(student.getId())) {
                    if (lab.getStatus() == LabStatus.IN_PROGRESS) {
                        inProgress++;
                    } else if (lab.getStatus() == LabStatus.IN_REVIEW) {
                        onReview++;
                    } else if (lab.getStatus() == LabStatus.DONE) {
                        done++;
                    }
                }
            }
            StudentLabStatistics statistics = new StudentLabStatistics(student,onReview,done,inProgress);
            studentLabStatistics.add(statistics);
        }

        model.addAttribute("allLabsQuantity", allLabsQuantity);
        model.addAttribute("studentLabStatistics", studentLabStatistics);
        return "teacher_student_group_statistics";
    }


    @RequestMapping(value = "/courses/{courseId}/studentGroup/{studentGroupId}/approveReport/{fileName}", method = RequestMethod.GET)
    public String approveReport(@PathVariable Long courseId, @PathVariable Long studentGroupId, @PathVariable String fileName, Authentication authentication) {
        User user = userService.findByLogin(authentication.getName()).orElseThrow(UserNotFoundException::new);
        File report = fileService.findByFileName(fileName).orElseThrow(LabNotFoundException::new);
        Lab labForApproving = labService.findByReport(report).orElseThrow(LabNotFoundException::new);
        labForApproving.setStatus(LabStatus.DONE);
        labService.save(labForApproving);

        createNotificationForUserAboutLabStatus(labForApproving, user);
        return "redirect:/teacher/courses/{courseId}/studentGroup/{studentGroupId}";
    }

    @RequestMapping(value = "/courses/{courseId}/studentGroup/{studentGroupId}/openReport/{fileName}", method = RequestMethod.GET)
    public String openReportByTeacher(Model model, @PathVariable Long courseId, @PathVariable Long studentGroupId, @PathVariable String fileName) throws IOException, InvalidFormatException {
        FileInputStream fileInputStream = new FileInputStream(applicationProperties.getPath() + "\\" + courseId + "\\" + "reports" + "\\" + fileName + ".doc");
        XWPFDocument doc = new XWPFDocument(OPCPackage.open(fileInputStream));
        XWPFWordExtractor extractor = new XWPFWordExtractor(doc);
        extractor.close();
        doc.close();
        model.addAttribute("document", extractor.getText());
        model.addAttribute("labComment", new LabComment());
        return "open_report_by_teacher";
    }

    @RequestMapping(value = "/courses/{courseId}/studentGroup/{studentGroupId}/openReport/{fileName}", method = RequestMethod.POST)
    public String addCommentAndSendToInProgress(Authentication authentication, @PathVariable Long studentGroupId, @PathVariable Long courseId, @ModelAttribute("labComment") LabComment labComment, @PathVariable String fileName) {
        File report = fileService.findByFileName(fileName).orElseThrow(LabNotFoundException::new);
        Course course = courseService.getById(courseId).orElseThrow(CourseNotFoundException::new);
        Lab lab = labService.findByReport(report).orElseThrow(LabNotFoundException::new);

        lab.setStatus(LabStatus.IN_PROGRESS);
        labService.save(lab);

        labComment.setDate(new Date());
        labComment.setLab(lab);
        labComment.setTeacher(course.getTeacher());
        labCommentService.save(labComment);

        User teacherUser = userService.findByLogin(authentication.getName()).orElseThrow(UserNotFoundException::new);
        createNotificationForUserAboutLabStatus(lab, teacherUser);
        return "redirect:/teacher/courses/" + courseId + "/studentGroup/" + studentGroupId;
    }

    private void createNotificationForUserAboutLabStatus(Lab lab, User user) {
        String message = "Your Lab №" + lab.getOrder() + " of " + lab.getCourse().getName() + " course got " + lab.getStatus() + " status by teacher " + user.getName() + " " + user.getSurname();
        Notification notification = notificationService.createNotification(message, lab.getStudent().getUser());
        notificationService.save(notification);
    }

}
