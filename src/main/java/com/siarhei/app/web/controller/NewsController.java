package com.siarhei.app.web.controller;

import com.siarhei.app.core.exceptions.CourseNotFoundException;
import com.siarhei.app.core.model.Course;
import com.siarhei.app.core.model.News;
import com.siarhei.app.core.model.RoleName;
import com.siarhei.app.core.service.CourseService;
import com.siarhei.app.core.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Date;
import java.util.Set;

@Controller
@RequestMapping("news/")
public class NewsController {

    @Autowired
    CourseService courseService;

    @Autowired
    NewsService newsService;

    @RequestMapping(value = "/add/{courseId}", method = RequestMethod.GET)
    public String add(@PathVariable Long courseId, Model model) {
        model.addAttribute("news", new News());
        return "piece_of_news";
    }

    @RequestMapping(value = "/add/{courseId}", method = RequestMethod.POST)
    public String add(@PathVariable Long courseId , @ModelAttribute("news") News news , Authentication authentication) {
        Set<String> roles = AuthorityUtils.authorityListToSet(authentication.getAuthorities());
        Course course = courseService.getById(courseId).orElseThrow(CourseNotFoundException::new);
        news.setCourse(course);
        news.setDate(new Date());
        newsService.save(news);
        if (roles.contains(RoleName.ROLE_TEACHER.name())){
            return "redirect:/teacher/courses/"+courseId;
        }
        return "redirect:/dededededed";
    }
}
