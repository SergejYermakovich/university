package com.siarhei.app.core.exceptions;

public class TeacherNotFoundException extends ApplicationBaseException {
    private static final String message = "TeacherNotFoundException";

    public TeacherNotFoundException( ) {
        super(message);
    }
}
