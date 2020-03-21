package com.siarhei.app.core.service.impl;

import com.siarhei.app.core.model.Lab;
import com.siarhei.app.core.model.LabComment;
import com.siarhei.app.core.repository.LabCommentRepository;
import com.siarhei.app.core.service.LabCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class LabCommentServiceImpl implements LabCommentService {

    @Autowired
    private LabCommentRepository labCommentRepository;

    @Override
    public LabComment save(LabComment labComment) {
        return labCommentRepository.save(labComment);
    }

    @Override
    public List<LabComment> getAllByLab(Lab lab) {
        return labCommentRepository.getAllByLab(lab);
    }
}
