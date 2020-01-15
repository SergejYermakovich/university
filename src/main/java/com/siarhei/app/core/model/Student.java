package com.siarhei.app.core.model;

import javax.persistence.*;
@Entity
@Table(name = "students")
public class Student {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    protected Long id;

    @OneToOne(cascade = CascadeType.MERGE,fetch = FetchType.EAGER)//cascade = CascadeType.MERGE,
    @JoinColumn(name="user_id")
    User user;

    @OneToOne
    @JoinColumn(name="student_group_id")
    StudentGroup studentGroup;

    @Column(name = "address")
    private String address;

    @Column(name = "nationality")
    private String nationality;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public StudentGroup getStudentGroup() {
        return studentGroup;
    }

    public void setStudentGroup(StudentGroup studentGroup) {
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
        return "Student{" +
                "id=" + id +
                ", user=" + user +
                ", studentGroup=" + studentGroup +
                ", address='" + address + '\'' +
                ", nationality='" + nationality + '\'' +
                '}';
    }
}
