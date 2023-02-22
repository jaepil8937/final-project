package com.last.exception;

public class ApplicationException extends RuntimeException {

	private static final long serialVersionUID = 7899409403811404381L;

	public ApplicationException(String message) {
		super(message);
	}
	
	public ApplicationException(String message, Throwable cause) {
		super(message, cause);
	}
}
