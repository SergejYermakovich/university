package com.siarhei.app.web.dto;

import org.hibernate.validator.constraints.NotBlank;

public class StudentInDto {

    @NotBlank
    private String studentGroup;

    @NotBlank
    private String address;

    @NotBlank
    private String nationality;

    public String getStudentGroup() {
        return studentGroup;
    }

    public void setStudentGroup(String studentGroup) {
        this.studentGroup = studentGroup;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    @Override
    public String toString() {
        return "StudentInDto{" +
                "studentGroup='" + studentGroup + '\'' +
                ", address='" + address + '\'' +
                ", nationality='" + nationality + '\'' +
                '}';
    }
}
