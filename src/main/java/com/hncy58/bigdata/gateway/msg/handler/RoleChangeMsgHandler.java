package com.hncy58.bigdata.gateway.msg.handler;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.hncy58.bigdata.gateway.domain.AuthChangeMsg;

@Service("roleChangeMsgHandler")
public class RoleChangeMsgHandler implements Handler {
	
	Logger log = LoggerFactory.getLogger(RoleChangeMsgHandler.class);

	@Override
	public Object handle(AuthChangeMsg msg) {
		
		log.info("role change msg handler start to handle msg:{}", msg.getData());
		
		return null;
	}

}
