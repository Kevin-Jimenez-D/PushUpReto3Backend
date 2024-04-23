package com.example.FiltroSpringBoot.Domain.Exceptions;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;

@ControllerAdvice
public class GlobalExceptionHandler {
    @ExceptionHandler(EndpointException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public ResponseEntity<Object> handleEndpointException(EndpointException ex) {
        ErrorResponses errorResponse = new ErrorResponses(
                "Endpoint not available",
                ex.getMessage(),
                "Make sure that the endpoint is allowed, you can see it in OpeanAPI documentation - URI/doc/swagger-ui.html");
        return new ResponseEntity<>(errorResponse, HttpStatus.BAD_REQUEST);
    }

    @ExceptionHandler(InvalidNumberFormatException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public ResponseEntity<Object> handleInvalidNumberFormatException(InvalidNumberFormatException ex) {
        ErrorResponses errorResponse = new ErrorResponses(
                "Invalid parameter format",
                ex.getMessage(),
                "The parameter must have a number format in order to work");
        return new ResponseEntity<>(errorResponse, HttpStatus.BAD_REQUEST);
    }

    @ExceptionHandler(UserDuplicateException.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public ResponseEntity<Object> handleUserDuplicateException(UserDuplicateException ex) {
        ErrorResponses errorResponse = new ErrorResponses(
                "Duplicate entry for username",
                ex.getMessage(),
                "Try entering any other username");
        return new ResponseEntity<>(errorResponse, HttpStatus.INTERNAL_SERVER_ERROR);
    }

    @ExceptionHandler(InvalidUserException.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public ResponseEntity<Object> handleInvalidUserException(InvalidUserException ex) {
        ErrorResponses errorResponse = new ErrorResponses(
                "Credentials wrong",
                ex.getMessage(),
                "Make sure you are entering the correct username and password");
        return new ResponseEntity<>(errorResponse, HttpStatus.INTERNAL_SERVER_ERROR);
    }

    @ExceptionHandler(Exception.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public ResponseEntity<Object> handleGlobalException(Exception ex) {
        ErrorResponses errorResponse = new ErrorResponses(
                "Error in application",
                ex.getMessage(),
                "An internal server error has occurred. Please try again later");
        return new ResponseEntity<>(errorResponse, HttpStatus.INTERNAL_SERVER_ERROR);
    }
}
