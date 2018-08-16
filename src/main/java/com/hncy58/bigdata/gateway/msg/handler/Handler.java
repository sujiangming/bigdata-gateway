package com.hncy58.bigdata.gateway.msg.handler;

public interface Handler {
	
	Object handle(String oprSubject, String oprType, Object data);
}
