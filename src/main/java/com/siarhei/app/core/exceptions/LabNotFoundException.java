package com.siarhei.app.core.exceptions;

public class LabNotFoundException extends ApplicationBaseException {
    final static String message = "LabNotFoundException";
    public LabNotFoundException() {
        super(message);
    }
}
