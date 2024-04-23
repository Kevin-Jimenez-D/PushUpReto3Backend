package com.example.FiltroSpringBoot.Domain.Exceptions;

public class InvalidNumberFormatException extends RuntimeException {
    public InvalidNumberFormatException(String message) {
        super(message);
    }
}
