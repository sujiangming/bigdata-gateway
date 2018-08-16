package com.hncy58.bigdata.gateway.service.imlp;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.hncy58.bigdata.gateway.service.AbstractCacheService;

@Service
public class AuthInfoCacheService extends AbstractCacheService<Object> {

	@Value("${cache.user.key:authinfo}")
	protected String cacheKey;
	
	@Value("${cache.user.key:-1}")
	protected long cacheExpire;

	@Value("${redis.pubsub.patterntopic:pubsub}")
	private String patternTopic;
	
	@Override
	protected String getCacheKey() {
		return cacheKey;
	}

	@Override
	protected long getCacheExpire() {
		return cacheExpire;
	}
	
	public void sendMsg(Object msg) {
		sendChannelMess(patternTopic, msg);
	}
}
