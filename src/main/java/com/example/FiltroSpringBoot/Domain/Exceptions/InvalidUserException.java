package com.example.FiltroSpringBoot.Domain.Exceptions;

public class InvalidUserException extends RuntimeException {
    public InvalidUserException(String message) {
        super(message);
    }
}
