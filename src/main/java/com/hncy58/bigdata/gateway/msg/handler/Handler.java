package com.hncy58.bigdata.gateway.msg.handler;

public interface Handler<T> {
	
	Object handle(T msg);
}
