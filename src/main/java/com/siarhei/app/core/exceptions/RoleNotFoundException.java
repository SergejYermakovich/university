package com.siarhei.app.core.exceptions;

public class RoleNotFoundException extends ApplicationBaseException {
   final static String message = "RoleNotFoundException";

    public RoleNotFoundException() {
        super(message);
    }
}
