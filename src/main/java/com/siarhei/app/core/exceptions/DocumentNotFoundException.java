package com.siarhei.app.core.exceptions;

public class DocumentNotFoundException extends ApplicationBaseException  {
    final static String message = "DocumentNotFoundException";

    public DocumentNotFoundException() {
        super(message);
    }
}
