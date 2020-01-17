package com.siarhei.app.core.exceptions;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(value= HttpStatus.NOT_FOUND)
public class PageNotFoundException extends ApplicationBaseException {
    final static String message = "PageNotFoundException";

    protected PageNotFoundException() {
        super(message);
    }
}
