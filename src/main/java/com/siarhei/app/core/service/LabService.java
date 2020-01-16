package com.siarhei.app.core.service;

import com.siarhei.app.core.model.Lab;

import java.util.List;
import java.util.Optional;

public interface LabService {
    Lab save(Lab lab);

    Optional<Integer> findMaxOrder();

    List<Lab> findAllByCourseName(String courseName);
}
