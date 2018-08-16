package com.hncy58.bigdata.gateway.msg.handler;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@Service("userMsgHandler")
public class UserMsgHandler implements Handler {
	
	Logger log = LoggerFactory.getLogger(UserMsgHandler.class);

	@Override
	public Object handle(String oprSubject, String oprType, Object data) {
		
		log.info("user msg handler start to handle msg:{}", data);
		
		return null;
	}

}
