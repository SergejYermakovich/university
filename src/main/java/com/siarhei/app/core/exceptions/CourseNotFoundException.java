package com.siarhei.app.core.exceptions;

public class CourseNotFoundException extends ApplicationBaseException {
    final static String message = "CourseNotFound";

    public CourseNotFoundException() {
        super(message);
    }
}
