package com.siarhei.app.web.controller;

import com.siarhei.app.core.exceptions.CourseNotFoundException;
import com.siarhei.app.core.exceptions.DescriptionNotExistsException;
import com.siarhei.app.core.model.*;

import com.siarhei.app.core.service.CourseService;
import com.siarhei.app.core.service.FileService;
import com.siarhei.app.core.service.LabService;
import com.siarhei.app.core.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("labs/")
public class LabsController {

    @Autowired
    private CourseService courseService;

    @Autowired
    private StudentService studentService;

    @Autowired
    private LabService labService;

    @Autowired
    private FileService fileService;

    @RequestMapping(value = "/add/{courseId}", method = RequestMethod.GET)
    public String add(Model model, @PathVariable Long courseId) {
        Course course = courseService.getById(courseId).orElseThrow(CourseNotFoundException::new);
        model.addAttribute("course", course);
        model.addAttribute("lab", new Lab());
        model.addAttribute("labs", labService.findAllByCourseName(course.getName()));
        return "newLab";
    }

    @RequestMapping(value = "/add/{courseId}", method = RequestMethod.POST)
    public String add(@PathVariable Long courseId, @ModelAttribute("lab") Lab lab, @RequestParam("file") MultipartFile multipartFile) throws IOException {
        if (lab.getDescription().length() == 0) {
            throw new DescriptionNotExistsException();
        }
        System.out.println(multipartFile.getContentType());
        Course course = courseService.getById(courseId).orElseThrow(CourseNotFoundException::new);
        List<Student> allStudents = studentService.findAll();
        List<Student> allNecessaryStudents = getAllNecessaryStudentsForLab(allStudents, course);
        createLab(lab, course, multipartFile);
        createLabsForStudents(allNecessaryStudents, lab);
        return "redirect:/labs/add/" + courseId;
    }

    private List<Student> getAllNecessaryStudentsForLab(List<Student> allStudents, Course course) {
        List<StudentGroup> studentGroups = course.getStudentGroups();
        List<Student> allNecessaryStudents = new ArrayList<>();
        for (Student student : allStudents) {
            for (StudentGroup studentGroup : studentGroups) {
                if (student.getStudentGroup().getName().equals(studentGroup.getName())) {
                    allNecessaryStudents.add(student);
                }
            }
        }
        if (allNecessaryStudents.size() == 0) {
            throw new RuntimeException("allNecessaryStudents == 0 exception !!!");
        }
        return allNecessaryStudents;
    }

    private void createLabsForStudents(List<Student> students, Lab lab) throws IOException {
        for (Student student : students) {
            Lab newLab = new Lab();
            newLab.setDescription(lab.getDescription());
            newLab.setOrder(lab.getOrder());
            newLab.setCourse(lab.getCourse());
            newLab.setStatus(lab.getStatus());
            newLab.setDoc(lab.getDoc());
            newLab.setStudent(student);
            String fileName = "" + student.getUser().getSurname() + student.getUser().getName() + "Course" + lab.getCourse().getId() + "Lab" + lab.getOrder();
            File report = new File("reports", fileName);
            fileService.createEmptyDoc(report, lab.getCourse().getId());
            fileService.save(report);
            newLab.setReport(report);
            labService.save(newLab);
        }

    }

    private Lab createLab(Lab lab, Course course, MultipartFile multipartFile) throws IOException {
        lab.setStatus(LabStatus.IN_PROGRESS);
        lab.setCourse(course);
        lab.setOrder(getOrderForCourseLab());
        File doc = new File("manuals", "doc" + lab.getOrder());
        fileService.createManualFile(doc, course.getId(), multipartFile);
        fileService.save(doc);
        lab.setDoc(doc);
        return lab;
    }

    private int getOrderForCourseLab() {
        return labService.findMaxOrder().orElse(0) + 1;
    }

}
