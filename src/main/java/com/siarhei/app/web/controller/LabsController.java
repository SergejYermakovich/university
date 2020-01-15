package com.siarhei.app.web.controller;

import com.siarhei.app.core.exceptions.CourseNotFoundException;
import com.siarhei.app.core.model.*;

import com.siarhei.app.core.service.CourseService;
import com.siarhei.app.core.service.LabService;
import com.siarhei.app.core.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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

    @RequestMapping(value = "/add/{courseId}", method = RequestMethod.GET)
    public String add(Model model) {
        model.addAttribute("lab", new Lab());
        return "newLab";
    }

    @RequestMapping(value = "/add/{courseId}", method = RequestMethod.POST)
    public String add(@PathVariable Long courseId, @ModelAttribute("lab") Lab lab, Authentication authentication) {
        Course course = courseService.getById(courseId).orElseThrow(CourseNotFoundException::new);
        List<Student> allStudents = studentService.findAll();
        List<Student> allNecessaryStudents = getAllNecessaryStudentsForLab(allStudents, course);
        createLab(lab, course);
        createLabsForStudents(allNecessaryStudents, lab);
        return "redirect:/dededededed";
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

    private void createLabsForStudents(List<Student> students, Lab lab) {
        for (Student student : students) {
            Lab newLab = new Lab();

            newLab.setDescription(lab.getDescription());
            newLab.setOrder(lab.getOrder());
            newLab.setCourse(lab.getCourse());
            newLab.setStatus(lab.getStatus());
            newLab.setDoc(lab.getDoc());
            newLab.setStudent(student);

            File report = new File();//генерим пустой отчет для каждого студента
            newLab.setReport(report);
            labService.save(newLab);//save newLab

        }

    }

    private Lab createLab(Lab lab, Course course) {
        File doc = new File();//метода

        lab.setStatus(LabStatus.IN_PROGRESS);
        lab.setCourse(course);
        lab.setDoc(doc);
        lab.setOrder(getMinOrderForCourseLab(course));
        return lab;
    }

    private int getMinOrderForCourseLab(Course course) {

        return 1;
    }

}
