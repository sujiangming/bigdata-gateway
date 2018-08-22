package com.hncy58.bigdata.gateway.msg.handler;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.util.StringUtil;
import com.hncy58.bigdata.gateway.domain.AuthChangeMsg;
import com.hncy58.bigdata.gateway.model.AuthInfo;
import com.hncy58.bigdata.gateway.service.AuthorityService;
import com.hncy58.bigdata.gateway.service.TokenService;
import com.hncy58.bigdata.gateway.util.Utils;

@Service("userRoleChangeMsgHandler")
public class UserRoleChangeMsgHandler implements Handler<AuthChangeMsg> {

	Logger log = LoggerFactory.getLogger(UserRoleChangeMsgHandler.class);

	@Autowired
	private TokenService tokenService;

	@Autowired
	private AuthorityService authorityService;

	@Override
	public Object handle(AuthChangeMsg msg) {
		log.info("user role msg handler start to handle msg:{}", msg.getData());
		if (msg.getData() == null)
			return null;
		List<?> arr = (List<?>) msg.getData();
		if (arr.isEmpty())
			return null;

		Integer userId = Integer.valueOf(arr.get(0).toString());
		String token = tokenService.getToken(userId);

		if (StringUtil.isEmpty(token)) {
			log.info("user not login(token is null), no need to update auth cache, userId:{}", userId);
			return null;
		}

		// 如果用户已经登录，则更新用户的缓存信息
		List<AuthInfo> infos = authorityService.selectByUserId(userId);
		if (!infos.isEmpty()) {
			tokenService.putCacheByToken(token, "authinfo", infos.get(0));
			if (Utils.hasSuperRole(infos.get(0)))
				tokenService.putCacheByToken(token, "superrole", "1");
		}
		// 返回用户的权限信息
		return infos.get(0);
	}
}
