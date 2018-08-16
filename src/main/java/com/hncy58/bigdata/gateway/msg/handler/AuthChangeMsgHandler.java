package com.hncy58.bigdata.gateway.msg.handler;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.hncy58.bigdata.gateway.domain.AuthChangeMsg;

@Service("authChangeMsgHandler")
public class AuthChangeMsgHandler implements Handler {
	
	Logger log = LoggerFactory.getLogger(AuthChangeMsgHandler.class);

	@Override
	public Object handle(AuthChangeMsg msg) {
		
		log.info("authority msg handler start to handle msg:{}", msg.getData());
		
		return null;
	}

}
