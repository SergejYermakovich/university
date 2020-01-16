package com.siarhei.app.core.model;

import javax.persistence.*;
import java.nio.file.Path;
import java.nio.file.Paths;

@Entity
@Table(name = "files")
public class File {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "file_directory", length = 100)
    private String fileDirectory;

    @Column(name = "file_name", length = 100)
    private String fileName;

    public File() {
    }

    public File(
            String fileDirectory,
            String fileName
    ) {
        this.fileDirectory = fileDirectory;
        this.fileName = fileName;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFileDirectory() {
        return fileDirectory;
    }

    public void setFileDirectory(String fileDirectory) {
        this.fileDirectory = fileDirectory;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public Path getFilePath() {
        if (fileName == null || fileDirectory == null) {
            return null;
        }
        return Paths.get(fileDirectory, fileName);
    }
}
