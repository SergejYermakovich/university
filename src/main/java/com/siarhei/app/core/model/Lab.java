package com.siarhei.app.core.model;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "labs")
public class Lab {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    protected Long id;

    @Column(name = "lab_description")
    private String description;

    @Enumerated(EnumType.STRING)
    @Column(name = "lab_status")
    private LabStatus status;

    @Column(name = "lab_order")
    private int order;

    @OneToOne
    @JoinColumn(name = "student_id")
    private Student student;

    @OneToOne
    @JoinColumn(name = "course_id")
    private Course  course;

    @OneToOne
    @JoinColumn(name = "doc_id" )//,insertable = false, updatable = false
    private File doc;

    @OneToOne
    @JoinColumn(name = "report_id")
    private File report;

    @OneToMany(mappedBy = "lab")
    private List<LabComment> labComments;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public LabStatus getStatus() {
        return status;
    }

    public void setStatus(LabStatus status) {
        this.status = status;
    }

    public int getOrder() {
        return order;
    }

    public void setOrder(int order) {
        this.order = order;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public File getDoc() {
        return doc;
    }

    public void setDoc(File doc) {
        this.doc = doc;
    }

    public File getReport() {
        return report;
    }

    public void setReport(File report) {
        this.report = report;
    }

    public List<LabComment> getLabComments() {
        return labComments;
    }

    public void setLabComments(List<LabComment> labComments) {
        this.labComments = labComments;
    }

    @Override
    public String toString() {
        return "Lab{" +
                "id=" + id +
                ", description='" + description + '\'' +
                ", status=" + status +
                ", order=" + order +
                ", student=" + student +
                ", course=" + course +
                ", doc=" + doc +
                ", report=" + report +
                ", labComments=" + labComments +
                '}';
    }
}
