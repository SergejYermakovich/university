package com.siarhei.app.core.exceptions;

public class EmptyFileException extends ApplicationBaseException {
    final static String message = "EmptyFileException";

    public EmptyFileException() {
        super(message);
    }
}
