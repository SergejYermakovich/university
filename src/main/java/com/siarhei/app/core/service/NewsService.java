package com.siarhei.app.core.service;

import com.siarhei.app.core.model.Course;
import com.siarhei.app.core.model.News;

import java.util.List;

public interface NewsService {
     News save(News news);

     List<News> getAll();

     List<News> getAllByCourse(Course course);

}
