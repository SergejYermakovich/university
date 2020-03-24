package com.siarhei.app.web.controller;

import com.siarhei.app.core.exceptions.UserNotFoundException;
import com.siarhei.app.core.model.RoleName;
import com.siarhei.app.core.model.Student;
import com.siarhei.app.core.model.User;
import com.siarhei.app.core.service.StudentService;
import com.siarhei.app.core.service.TeacherService;
import com.siarhei.app.core.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("admin/")
public class AdminController {

    @Autowired
    private UserService userService;

    @Autowired
    private StudentService studentService;

    @Autowired
    private TeacherService teacherService;

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
        model.addAttribute("user",user);
        return "userInfoForAdmin";
    }

}
