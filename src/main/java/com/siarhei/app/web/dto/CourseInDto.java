package com.siarhei.app.web.dto;

import org.hibernate.validator.constraints.NotBlank;

public class CourseInDto {

    @NotBlank
    private String name;

    @NotBlank
    private String description;

    @NotBlank
    private String teacher;

    @NotBlank
    private String studentGroup;

    public CourseInDto() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getTeacher() {
        return teacher;
    }

    public void setTeacher(String teacher) {
        this.teacher = teacher;
    }

    public String getStudentGroup() {
        return studentGroup;
    }

    public void setStudentGroup(String studentGroup) {
        this.studentGroup = studentGroup;
    }
}
