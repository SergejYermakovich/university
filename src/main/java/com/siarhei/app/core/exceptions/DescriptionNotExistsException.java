package com.siarhei.app.core.exceptions;

public class DescriptionNotExistsException extends ApplicationBaseException {
    final static String message = "DescriptionNotExistsException";

    public DescriptionNotExistsException( ) {
        super(message);
    }
}
