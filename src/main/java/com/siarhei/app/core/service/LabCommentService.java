package com.siarhei.app.core.service;


import com.siarhei.app.core.model.Lab;
import com.siarhei.app.core.model.LabComment;

import java.util.List;

public interface LabCommentService {

    LabComment save(LabComment labComment);

    List<LabComment> getAllByLab(Lab lab);
}
