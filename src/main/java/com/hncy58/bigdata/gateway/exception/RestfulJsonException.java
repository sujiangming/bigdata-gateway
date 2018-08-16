package com.hncy58.bigdata.gateway.exception;

public class RestfulJsonException extends Exception {

	private static final long serialVersionUID = 1L;

	public RestfulJsonException(String message) {
		super(message);
	}

	public RestfulJsonException() {
		super();
	}

	public RestfulJsonException(String message, Throwable cause, boolean enableSuppression,
			boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public RestfulJsonException(String message, Throwable cause) {
		super(message, cause);
	}

	public RestfulJsonException(Throwable cause) {
		super(cause);
	}

	
}
