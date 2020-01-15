package com.siarhei.app.core.repository;

import com.siarhei.app.core.model.Lab;
import org.springframework.data.jpa.repository.JpaRepository;

public interface LabRepository  extends JpaRepository<Lab, Long> {
}
