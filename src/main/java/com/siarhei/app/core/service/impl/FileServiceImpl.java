package com.siarhei.app.core.service.impl;

import com.siarhei.app.core.exceptions.EmptyFileException;
import com.siarhei.app.core.model.File;
import com.siarhei.app.core.repository.FileRepository;
import com.siarhei.app.core.service.FileService;
import com.siarhei.app.web.properties.ApplicationProperties;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.apache.poi.xwpf.usermodel.XWPFRun;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.transaction.Transactional;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Path;
import java.util.Optional;

@Service
@Transactional
public class FileServiceImpl implements FileService {

    final static private String DOC_CONTENT_TYPE = "doc";

    @Autowired
    private ApplicationProperties applicationProperties;

    @Autowired
    private FileRepository fileRepository;

    @Override
    public File save(File file) {
        return fileRepository.save(file);
    }

    @Override
    public void createEmptyDoc(File file, Long courseId) throws IOException {
        createCourseDir(courseId);
        createReportDir(courseId);
        java.io.File report = getPathToReportFile(courseId, file.getFileName() + "." + DOC_CONTENT_TYPE).toFile();
        XWPFDocument document = new XWPFDocument();
//        XWPFParagraph tmpParagraph = document.createParagraph();
//        XWPFRun tmpRun = tmpParagraph.createRun();
//        tmpRun.setText("Report");
//        tmpRun.setFontSize(18);
        document.write(new FileOutputStream(report));
        document.close();
    }

    @Override
    public void createManualFile(File file, Long courseId, MultipartFile multipartFile) throws IOException {
        if (multipartFile.isEmpty()) {
            throw new EmptyFileException();
        }
        createCourseDir(courseId);
        createManualDir(courseId);
        java.io.File manual = getPathToManualFile(courseId, file.getFileName() + "." + DOC_CONTENT_TYPE).toFile();
        multipartFile.transferTo(manual);
    }

    @Override
    public Optional<File> findByFileName(String filename) {
        return fileRepository.findByFileName(filename);
    }

    private Path getPathToReportsDirectory(long courseId) {
        return Path.of(applicationProperties.getPath(), String.valueOf(courseId), "reports");
    }

    private Path getPathToManualsDirectory(long courseId) {
        return Path.of(applicationProperties.getPath(), String.valueOf(courseId), "manuals");
    }

    private Path getPathToManualFile(long courseId, String filename) {
        return getPathToManualsDirectory(courseId).resolve(filename);
    }

    private Path getPathToReportFile(long courseId, String filename) {
        return getPathToReportsDirectory(courseId).resolve(filename);
    }

    private void createCourseDir(long courseId) {
        java.io.File courseDirectory = Path.of(applicationProperties.getPath(), String.valueOf(courseId)).toFile();
        if (!courseDirectory.exists()) {
            courseDirectory.mkdir();
        }
    }

    private void createReportDir(long courseId) {
        java.io.File reportDirectory = getPathToReportsDirectory(courseId).toFile();
        if (!reportDirectory.exists()) {
            reportDirectory.mkdir();
        }
    }

    private void createManualDir(long courseId) {
        java.io.File manualDirectory = getPathToManualsDirectory(courseId).toFile();
        if (!manualDirectory.exists()) {
            manualDirectory.mkdir();
        }
    }
}
