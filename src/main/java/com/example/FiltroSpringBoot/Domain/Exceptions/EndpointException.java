package com.example.FiltroSpringBoot.Domain.Exceptions;

public class EndpointException extends RuntimeException {
    public EndpointException(String message) {
        super(message);
    }
}
