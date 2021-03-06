package com.hncy58.bigdata.gateway.exception;

/**
 * 调用restful接口异常
 * @author tdz
 * @company hncy58 长银五八
 * @website http://www.hncy58.com
 * @version 1.0
 * @date 2018年8月25日 下午4:58:30
 */
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
