package com.siarhei.app.web.controller;

import com.siarhei.app.core.exceptions.CourseNotFoundException;
import com.siarhei.app.core.exceptions.StudentGroupNotFoundException;
import com.siarhei.app.core.exceptions.UserNotFoundException;
import com.siarhei.app.core.model.*;
import com.siarhei.app.core.service.*;
import com.siarhei.app.web.dto.CourseInDto;
import com.siarhei.app.web.dto.mapper.CourseDtoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Controller
@RequestMapping("admin/")
public class AdminController {

    @Autowired
    private UserService userService;

    @Autowired
    private RoleService roleService;

    @Autowired
    private StudentGroupService studentGroupService;

    @Autowired
    private TeacherService teacherService;

    @Autowired
    private CourseService courseService;

    @Autowired
    private CourseDtoMapper courseDtoMapper;

    @RequestMapping(value = "/panel", method = RequestMethod.GET)
    public String panel(Model model) {
        List<User> students = userService.findAllByRole(RoleName.ROLE_STUDENT);
        List<User> teachers = userService.findAllByRole(RoleName.ROLE_TEACHER);
        List<User> admins = userService.findAllByRole(RoleName.ROLE_ADMIN);
        model.addAttribute("students", students);
        model.addAttribute("teachers", teachers);
        model.addAttribute("admins", admins);
        return "admin_panel";
    }

    @RequestMapping("/{id}/activate")
    public String activateUser(@PathVariable Long id) {
        User user = userService.findById(id).orElseThrow(UserNotFoundException::new);
        user.setActive(true);
        userService.save(user);
        return "redirect:/admin/panel";
    }

    @RequestMapping("/{id}/deactivate")
    public String deactivateUser(@PathVariable Long id) {
        User user = userService.findById(id).orElseThrow(UserNotFoundException::new);
        user.setActive(false);
        userService.save(user);
        return "redirect:/admin/panel";
    }

    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String search(Model model) {
        model.addAttribute("users", userService.findAll());
        return "admin_search";
    }

    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public String searchResult(Model model, @ModelAttribute("search") String search) {
        List<User> users;
        if (search.equals("")) {
            users = userService.findAll();
        } else {
            users = getUserListBySearchString(search);
        }
        model.addAttribute("users", users);

        return "admin_search";
    }

    private List<User> getUserListBySearchString(String searchStr) {
        List<User> users = new ArrayList<>();
        Optional<User> userByLogin = userService.findByLogin(searchStr);
        List<User> listBySurname = userService.findBySurname(searchStr);
        List<User> listByName = userService.findByName(searchStr);
        userByLogin.ifPresent(users::add);
        users.addAll(listByName);
        users.addAll(listBySurname);
        return users;
    }


    @RequestMapping(value = "/search/getInfo/{id}", method = RequestMethod.GET)
    public String getInfoAboutUser(Model model, @PathVariable Long id) {
        User user = userService.findById(id).orElseThrow(UserNotFoundException::new);
        model.addAttribute("user", user);
        model.addAttribute("userRole", "NOT LOADED YET");
        return "userInfoForAdmin";
    }

    @RequestMapping(value = "/courseAdministration", method = RequestMethod.GET)
    public String courseAdministration(Model model) {
        List<Course> courses = courseService.getAll();
        List<String> teachers = teacherService.findAll()
                .stream()
                .map(teacher -> teacher.getUser().getSurname())
                .collect(Collectors.toList());
        List<String> studentGroups = studentGroupService.getAll()
                .stream()
                .map(StudentGroup::getName)
                .collect(Collectors.toList());
        model.addAttribute("courseInDto", new CourseInDto());
        model.addAttribute("courses", courses);
        model.addAttribute("teachers", teachers);
        model.addAttribute("studentGroups", studentGroups);
        return "courseAdministration";
    }

    @RequestMapping(value = "/studentGroupAdministration", method = RequestMethod.GET)
    public String studentGroupAdministration(Model model) {
        List<StudentGroup> studentGroups = studentGroupService.getAll();
        model.addAttribute("group", new StudentGroup());
        model.addAttribute("groups", studentGroups);
        return "studentGroupAdministration";
    }

    @RequestMapping(value = "/deleteCourse/{id}", method = RequestMethod.GET)
    public String deleteCourse(@PathVariable Long id) {
        Course course = courseService.getById(id).orElseThrow(CourseNotFoundException::new);
        //courseservise -> delete
        System.out.print("course deleted");
        System.out.print("course deleted");
        System.out.print("course deleted");
        return "redirect:/admin/courseAdministration";
    }

    @RequestMapping(value = "/deleteGroup/{id}", method = RequestMethod.GET)
    public String deleteGroup(@PathVariable Long id) {
        StudentGroup studentGroup = studentGroupService.findById(id).orElseThrow(StudentGroupNotFoundException::new);
        studentGroupService.delete(studentGroup);
        return "redirect:/admin/studentGroupAdministration";
    }


    @RequestMapping(value = "/addCourse", method = RequestMethod.POST)
    public String addCourse(@ModelAttribute("courseInDto") CourseInDto courseInDto, BindingResult bindingResult) {
        Course course = new Course();
        courseDtoMapper.fillFromInDto(course, courseInDto);
        //  courseService.save(course); //troubles with teacher(попробовать написать скл скрипт)
        return "redirect:/admin/courseAdministration";
    }

    @RequestMapping(value = "/addGroup", method = RequestMethod.POST)
    public String addStudentGroup(@ModelAttribute("group") StudentGroup group, BindingResult bindingResult) {
        studentGroupService.save(group);
        return "redirect:/admin/studentGroupAdministration";
    }
}
