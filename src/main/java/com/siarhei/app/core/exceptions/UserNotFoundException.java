package com.siarhei.app.core.exceptions;

public class UserNotFoundException extends ApplicationBaseException{
    private static final String MESSAGE = "User is not found!!!";

    public UserNotFoundException() {

        super(MESSAGE);

    }
}
