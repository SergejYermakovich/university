package com.siarhei.app.web.exceptionHandler;

import com.siarhei.app.core.exceptions.UserAlreadyExistsException;
import com.siarhei.app.core.exceptions.UserNotFoundException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.multipart.MaxUploadSizeExceededException;

@ControllerAdvice
public class ExceptionsHandler {

    @ExceptionHandler(UserNotFoundException.class)
    public String handleUserNotFoundException() {
        return "user_not_found";
    }

    @ExceptionHandler(UserAlreadyExistsException.class)
    public String handleUserAlreadyExistsException() {
        return "user_already_exists";
    }

    @ExceptionHandler(MaxUploadSizeExceededException.class)
    public String handleMaxUploadSizeExceededException() {
        return "max_upload_size_exceeded";
    }
}
