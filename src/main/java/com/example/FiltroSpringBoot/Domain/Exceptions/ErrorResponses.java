package com.example.FiltroSpringBoot.Domain.Exceptions;

public class ErrorResponses {
    private String error;
    private String message;
    private String help;

    public ErrorResponses(String error, String message, String help) {
        this.error = error;
        this.message = message;
        this.help = help;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getHelp() {
        return help;
    }

    public void setHelp(String help) {
        this.help = help;
    }
}
