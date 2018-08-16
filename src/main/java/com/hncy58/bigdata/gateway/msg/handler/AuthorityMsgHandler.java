package com.hncy58.bigdata.gateway.msg.handler;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@Service("authorityMsgHandler")
public class AuthorityMsgHandler implements Handler {
	
	Logger log = LoggerFactory.getLogger(AuthorityMsgHandler.class);

	@Override
	public Object handle(String oprSubject, String oprType, Object data) {
		
		log.info("authority msg handler start to handle msg:{}", data);
		
		return null;
	}

}
