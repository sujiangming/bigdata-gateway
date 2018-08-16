package com.hncy58.bigdata.gateway.msg.handler;

import com.hncy58.bigdata.gateway.domain.AuthChangeMsg;

public interface Handler {
	
	Object handle(AuthChangeMsg msg);
}
