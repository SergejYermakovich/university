package com.siarhei.app.core.model;

public class StudentLabStatistics {

    private Student student;

    private int onReview;

    private int done;

    private int inProgress;

    public StudentLabStatistics(Student student, int onReview, int done, int inProgress) {
        this.student = student;
        this.onReview = onReview;
        this.done = done;
        this.inProgress = inProgress;
    }

    public StudentLabStatistics() {
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public int getOnReview() {
        return onReview;
    }

    public void setOnReview(int onReview) {
        this.onReview = onReview;
    }

    public int getDone() {
        return done;
    }

    public void setDone(int done) {
        this.done = done;
    }

    public int getInProgress() {
        return inProgress;
    }

    public void setInProgress(int inProgress) {
        this.inProgress = inProgress;
    }


}
