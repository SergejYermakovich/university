package com.siarhei.app.core.service;

import com.siarhei.app.core.model.File;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Optional;

public interface FileService {
    File save(File file);

    void createEmptyDoc(File file, Long courseId) throws IOException;

    void createManualFile(File file, Long courseId , MultipartFile multipartFile) throws IOException;

    Optional<File> findByFileName(String filename);

}
