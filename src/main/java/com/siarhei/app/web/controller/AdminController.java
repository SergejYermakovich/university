package com.siarhei.app.web.controller;

import com.siarhei.app.core.exceptions.UserNotFoundException;
import com.siarhei.app.core.model.RoleName;
import com.siarhei.app.core.model.User;
import com.siarhei.app.core.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
@RequestMapping("admin/")
public class AdminController {

    @Autowired
    UserService userService;

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


}
