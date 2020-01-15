package com.siarhei.app.core.exceptions;

public class UserAlreadyExistsException extends ApplicationBaseException {
    private static final String MESSAGE = "User already exists !!!";

    public UserAlreadyExistsException() {
        super(MESSAGE);
    }
}
