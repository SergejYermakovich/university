package com.siarhei.app.web.controller;

import com.siarhei.app.core.exceptions.RoleNotFoundException;
import com.siarhei.app.core.exceptions.UserAlreadyExistsException;
import com.siarhei.app.core.exceptions.UserNotFoundException;
import com.siarhei.app.core.model.*;
import com.siarhei.app.core.service.*;
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
import java.util.List;
import java.util.Set;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private StudentService studentService;

    @Autowired
    private StudentGroupService studentGroupService;

    @Autowired
    private RoleService roleService;

    @Autowired
    private NotificationService notificationService;

    @Autowired
    private MessageService messageService;

    @Autowired
    private StudentDtoMapper studentDtoMapper;

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
    public String welcomeStudent(Authentication authentication, Model model) {
        User user = userService.findByLogin(authentication.getName()).orElseThrow(UserNotFoundException::new);
        Student student = studentService.findByUser(user);
        if (student == null) {
            return "redirect:/createStudentForUser";
        }
        addCountersOnPage(user,model);
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
    public String welcomeAdmin(Authentication authentication , Model model) {
        User user = userService.findByLogin(authentication.getName()).orElseThrow(UserNotFoundException::new);
        addCountersOnPage(user,model);
        return "welcome_admin";
    }

    @RequestMapping(value = {"/welcome_teacher"}, method = RequestMethod.GET)
    public String welcomeTeacher(Authentication authentication , Model model) {
        User user = userService.findByLogin(authentication.getName()).orElseThrow(UserNotFoundException::new);
        addCountersOnPage(user,model);
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
    @RequestMapping(value = "/settings", method = RequestMethod.GET)
    public String getSettings(Authentication authentication, Model model) {
        User user = userService.findByLogin(authentication.getName()).orElseThrow(UserNotFoundException::new);
        model.addAttribute("user",user);
        return "settings";
    }

    @RequestMapping(value = "/updateUserInSettings", method = RequestMethod.POST)
    public String updateUserInSettings() {
        System.out.println("user is updated!!!");
        return "redirect:/settings";
    }


    @RequestMapping(value = "/entertainment", method = RequestMethod.GET)
    public String getEntertainment() {
        return "entertainment";
    }

    @RequestMapping(value = "/instruments", method = RequestMethod.GET)
    public String getInstruments() {
        return "instruments";
    }

    @RequestMapping(value = "/compilerC", method = RequestMethod.GET)
    public String compilerC() {
        return "compilerC";
    }

    @RequestMapping(value = "/compilerJava", method = RequestMethod.GET)
    public String compilerJava() {
        return "compilerJava";
    }

    @RequestMapping(value = "/calculator", method = RequestMethod.GET)
    public String calculate() {
        return "calculator";
    }

    @RequestMapping(value = "/translate", method = RequestMethod.GET)
    public String translate() {
        return "translator";
    }

    @RequestMapping(value = "/snakeGame", method = RequestMethod.GET)
    public String snakeGame() {
        return "snakeGame";
    }

    @RequestMapping(value = "/worldMap", method = RequestMethod.GET)
    public String worldMap() {
        return "worldMap";
    }

    @RequestMapping(value = "/musicPlayer", method = RequestMethod.GET)
    public String musicPlayer() {
        return "musicPlayer";
    }

    @RequestMapping(value = "/worldNews", method = RequestMethod.GET)
    public String worldNews() {
        return "worldNews";
    }

    @RequestMapping(value = "/notifications", method = RequestMethod.GET)
    public String notifications(Authentication authentication, Model model) {
        User user = userService.findByLogin(authentication.getName()).orElseThrow(UserNotFoundException::new);
        List<Notification> notificationList = notificationService.findAllByUser(user);
        model.addAttribute("notificationList", notificationList);
        viewNotifications(notificationList);
        return "notifications";
    }

    private void viewNotifications(List<Notification> notificationList) {
        for (Notification notification : notificationList) {
            notification.setViewed(true);
            notificationService.save(notification);
        }
    }

    private void addCountersOnPage(User user, Model model) {
        List<Notification> notificationList = notificationService.findAllByUser(user);
        int notificationCounter = 0, messageCounter = 0;
        for (Notification notification : notificationList) {
            if (!notification.isViewed()) {
                notificationCounter++;
            }
        }
        List<Message> messageList = messageService.findAllByTo(user);
        for (Message message : messageList) {
            if (!message.isViewed()) {
                messageCounter++;
            }
        }
        model.addAttribute("notificationCounter", notificationCounter);
        model.addAttribute("messageCounter", messageCounter);
    }
}
