package com.siarhei.app.core.repository;

import com.siarhei.app.core.model.Lab;
import com.siarhei.app.core.model.LabComment;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface LabCommentRepository extends JpaRepository<LabComment, Long> {

    List<LabComment> getAllByLab(Lab lab);
}
