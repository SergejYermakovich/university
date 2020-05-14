package com.siarhei.app.core.exceptions;

public class InvalidFileFormatException extends ApplicationBaseException {
    final static String message = "InvalidFileFormatException";

    public InvalidFileFormatException() {
        super(message);
    }
}