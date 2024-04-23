package com.example.FiltroSpringBoot.Domain.Exceptions;

public class UserDuplicateException extends RuntimeException {
    public UserDuplicateException(String message) {
        super(message);
    }
}
