package com.siarhei.app.core.repository;

import com.siarhei.app.core.model.LabComment;
import org.springframework.data.jpa.repository.JpaRepository;

public interface LabCommentRepository extends JpaRepository<LabComment, Long> {
}
