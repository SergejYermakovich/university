package com.siarhei.app.core.service.impl;

import com.siarhei.app.core.model.Lab;
import com.siarhei.app.core.repository.LabRepository;
import com.siarhei.app.core.service.LabService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class LabServiceImpl implements LabService {
    @Autowired
    private LabRepository labRepository;

    @Override
    public Lab save(Lab lab) {
        return labRepository.save(lab);
    }

    @Override
    public Optional<Integer> findMaxOrder() {
        return labRepository.findMaxOrder();
    }

    @Override
    public List<Lab> findAllByCourseName(String courseName) {
        return labRepository.findAllByCourseName(courseName);
    }
}