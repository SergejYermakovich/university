package com.siarhei.app.web.controller;

import com.siarhei.app.core.exceptions.UserNotFoundException;
import com.siarhei.app.core.model.Message;
import com.siarhei.app.core.model.User;
import com.siarhei.app.core.service.MessageService;
import com.siarhei.app.core.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.List;

@Controller
@RequestMapping("message/")
public class MessageController {

    @Autowired
    private UserService userService;

    @Autowired
    MessageService messageService;

    @RequestMapping(value = "/createMessageDialog", method = RequestMethod.GET)
    public String createMessageDialog(Model model, Authentication authentication) {
        List<User> userList = userService.findAll();
        userList.removeIf(user -> authentication.getName().equals(user.getLogin()));
        model.addAttribute("userList", userList);
        return "createMessageDialog";
    }

    @RequestMapping(value = "/createMessageDialog", method = RequestMethod.POST)
    public String createMessageDialogAfterSearch(Model model, Authentication authentication, @ModelAttribute("search") String search) {
        List<User> userList = new ArrayList<>();
        if (search.equals("")) {
            userList = userService.findAll();
        } else {
            userList.addAll(userService.findByName(search));
            userList.addAll(userService.findBySurname(search));
        }
        userList.removeIf(user -> authentication.getName().equals(user.getLogin()));
        model.addAttribute("userList", userList);
        return "createMessageDialog";
    }

    @RequestMapping(value = "/dialog/{id}", method = RequestMethod.GET)
    public String showMessageDialog(@PathVariable long id, Model model, Authentication authentication) {
        User to = userService.findById(id).orElseThrow(UserNotFoundException::new);
        User from = userService.findByLogin(authentication.getName()).orElseThrow(UserNotFoundException::new);
        List<Message> messageList = messageService.findAllByToAndFrom(to.getId(), from.getId());
        Collections.sort(messageList);
        model.addAttribute("messageList", messageList);
        model.addAttribute("newMessage", new Message());
        return "showMessageDialog";
    }

    @RequestMapping(value = "/dialog/{id}", method = RequestMethod.POST)
    public String addMessage(@PathVariable long id, @ModelAttribute("newMessage") Message message, Authentication authentication) {
        if (message.getText().length() == 0) {
            System.out.println("empty message!!!!!!!!!");
            return "redirect:/message/dialog/" + id;
        }
        Message newMessage = new Message();
        newMessage.setText(message.getText());
        User to = userService.findById(id).orElseThrow(UserNotFoundException::new);
        User from = userService.findByLogin(authentication.getName()).orElseThrow(UserNotFoundException::new);
        newMessage.setTo(to);
        newMessage.setFrom(from);
        newMessage.setDate(Calendar.getInstance().getTime());
        messageService.save(newMessage);
        return "redirect:/message/dialog/" + id;
    }

}
