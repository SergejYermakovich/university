package com.siarhei.app.core.exceptions;

public class StudentGroupNotFoundException extends ApplicationBaseException {
    final static private String message = "StudentGroupNotFoundException";

    public StudentGroupNotFoundException() {
        super(message);
    }
}
