package com.hncy58.bigdata.gateway.msg.handler;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.hncy58.bigdata.gateway.domain.AuthChangeMsg;

@Service("userRoleChangeMsgHandler")
public class UserRoleChangeMsgHandler implements Handler {
	
	Logger log = LoggerFactory.getLogger(UserRoleChangeMsgHandler.class);

	@Override
	public Object handle(AuthChangeMsg msg) {
		
		log.info("user role msg handler start to handle msg:{}", msg.getData());
		
		return null;
	}

}
