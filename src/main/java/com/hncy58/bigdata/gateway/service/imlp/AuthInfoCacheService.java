package com.hncy58.bigdata.gateway.service.imlp;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.hncy58.bigdata.gateway.model.AuthInfo;
import com.hncy58.bigdata.gateway.service.AbstractCacheService;

@Deprecated
@Service
public class AuthInfoCacheService extends AbstractCacheService<AuthInfo> {

	@Value("${cache.user.key:authinfo}")
	protected String cacheKey;
	
	@Value("${cache.user.key:-1}")
	protected long cacheExpire;
	
	@Override
	protected String getCacheKey() {
		return cacheKey;
	}

	@Override
	protected long getCacheExpire() {
		return cacheExpire;
	}

}
