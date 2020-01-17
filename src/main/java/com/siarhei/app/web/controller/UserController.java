package com.siarhei.app.web.controller;

import com.siarhei.app.core.exceptions.RoleNotFoundException;
import com.siarhei.app.core.exceptions.UserAlreadyExistsException;
import com.siarhei.app.core.exceptions.UserNotFoundException;
import com.siarhei.app.core.model.Role;
import com.siarhei.app.core.model.RoleName;
import com.siarhei.app.core.model.Student;
import com.siarhei.app.core.model.User;
import com.siarhei.app.core.service.RoleService;
import com.siarhei.app.core.service.StudentGroupService;
import com.siarhei.app.core.service.StudentService;
import com.siarhei.app.core.service.UserService;
import com.siarhei.app.web.dto.StudentInDto;
import com.siarhei.app.web.dto.mapper.StudentDtoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Collections;
import java.util.Set;

@Controller
public class UserController {

    @Autowired
    UserService userService;

    @Autowired
    StudentService studentService;

    @Autowired
    StudentGroupService studentGroupService;

    @Autowired
    RoleService roleService;

    @Autowired
    StudentDtoMapper studentDtoMapper;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {
        return "login";
    }

    @RequestMapping(value = {"/welcome"}, method = RequestMethod.GET)
    public String welcome(Authentication authentication) {
        if (authentication == null) {
            return "redirect:/login";
        }
        Set<String> roles = AuthorityUtils.authorityListToSet(authentication.getAuthorities());
        if (roles.contains(RoleName.ROLE_STUDENT.name())) {
            return "redirect:/welcome_student";
        } else if (roles.contains(RoleName.ROLE_ADMIN.name())) {
            return "redirect:/welcome_admin";
        } else if (roles.contains(RoleName.ROLE_TEACHER.name())) {
            return "redirect:/welcome_teacher";
        } else {
            throw new RoleNotFoundException();
        }
    }

    @RequestMapping(value = {"/welcome_student"}, method = RequestMethod.GET)
    public String welcomeStudent(Authentication authentication) {
        User user = userService.findByLogin(authentication.getName()).orElseThrow(UserNotFoundException::new);
        Student student = studentService.findByUser(user);
        if (student == null) {
            return "redirect:/createStudentForUser";
        }
        return "welcome_student";
    }

    @RequestMapping(value = {"/createStudentForUser"}, method = RequestMethod.GET)
    public String createStudentForUser(Model model) {
        model.addAttribute("groups", studentGroupService.getAll());
        model.addAttribute("studentInDto", new StudentInDto());
        return "createStudentForUser";
    }

    @RequestMapping(value = "/createStudentForUser", method = RequestMethod.POST)
    public String createStudentForUser(@ModelAttribute("studentInDto") StudentInDto studentInDto, BindingResult bindingResult, Model model, Authentication authentication) {
        if (bindingResult.hasErrors()) {
            return "createStudentForUser";
        }
        Student student = new Student();
        User user = userService.findByLogin(authentication.getName()).orElseThrow(UserNotFoundException::new);
        student.setUser(user);
        studentDtoMapper.fillFromInDto(student, studentInDto);
        student = studentService.save(student);
        model.addAttribute("student", student);
        return "redirect:/welcome";
    }

    @RequestMapping(value = {"/welcome_admin"}, method = RequestMethod.GET)
    public String welcomeAdmin() {
        return "welcome_admin";
    }

    @RequestMapping(value = {"/welcome_teacher"}, method = RequestMethod.GET)
    public String welcomeTeacher() {
        return "welcome_teacher";
    }

    @RequestMapping(value = "/logout", method = RequestMethod.POST)
    public String logout(HttpServletRequest request, HttpServletResponse response) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null) {
            new SecurityContextLogoutHandler().logout(request, response, authentication);
        }
        return "redirect:/login";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration(Model model) {
        model.addAttribute("user", new User());
        return "registration";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@ModelAttribute("user") User user, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            return "registration";
        }
        try {
            user.setActive(true);
            Role role = roleService.findRoleByRoleName(RoleName.ROLE_STUDENT).orElseThrow(RoleNotFoundException::new);
            user.setRoles(Collections.singletonList(role));
            user = userService.save(user);
            model.addAttribute("user", user);
            return "redirect:/welcome";
        } catch (UserAlreadyExistsException userAlreadyExistsException) {
            model.addAttribute("userExists", "User already exists !!! Please,try again.");
            return "registration";
        }
    }
}
