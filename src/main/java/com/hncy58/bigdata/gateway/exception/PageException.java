package com.hncy58.bigdata.gateway.exception;

/**
 * 访问页面异常
 * @author tdz
 * @company hncy58 长银五八
 * @website http://www.hncy58.com
 * @version 1.0
 * @date 2018年8月25日 下午4:58:11
 */
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
