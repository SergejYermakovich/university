package com.siarhei.app.core.repository;

import com.siarhei.app.core.model.File;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FileRepository extends JpaRepository<File, Long> {
}
