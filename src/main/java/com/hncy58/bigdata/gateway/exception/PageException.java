package com.hncy58.bigdata.gateway.exception;

public class PageException extends Exception {

	private static final long serialVersionUID = 1L;

	public PageException(String message) {
		super(message);
	}

	public PageException() {
		super();
	}

	public PageException(String message, Throwable cause, boolean enableSuppression,
			boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public PageException(String message, Throwable cause) {
		super(message, cause);
	}

	public PageException(Throwable cause) {
		super(cause);
	}

	
}
