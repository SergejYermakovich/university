package com.siarhei.app.core.repository;

import com.siarhei.app.core.model.File;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface FileRepository extends JpaRepository<File, Long> {

    Optional<File> findByFileName(String filename);

}
