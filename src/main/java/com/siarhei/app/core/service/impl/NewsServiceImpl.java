package com.siarhei.app.core.service.impl;

import com.siarhei.app.core.model.Course;
import com.siarhei.app.core.model.News;
import com.siarhei.app.core.repository.NewsRepository;
import com.siarhei.app.core.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class NewsServiceImpl implements NewsService {
    @Autowired
    NewsRepository newsRepository;

    @Override
    public News save(News news) {
        return newsRepository.save(news);
    }

    @Override
    public List<News> getAll() {
        return newsRepository.findAll();
    }

    @Override
    public List<News> getAllByCourse(Course course) {
        return newsRepository.getAllByCourse(course);
    }
}
