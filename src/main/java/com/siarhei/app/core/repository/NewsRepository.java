package com.siarhei.app.core.repository;

import com.siarhei.app.core.model.Course;
import com.siarhei.app.core.model.News;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface NewsRepository  extends JpaRepository<News, Long> {

    List<News> getAllByCourse(Course course);

}
