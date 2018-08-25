package com.hncy58.bigdata.gateway.service;

import java.util.List;

import com.hncy58.bigdata.gateway.model.AuthInfo;

/**
 * 权限服务
 * @author tdz
 * @company hncy58 长银五八
 * @website http://www.hncy58.com
 * @version 1.0
 * @date 2018年8月25日 下午5:12:03
 */
public interface AuthorityService {

	List<AuthInfo> selectByUserId(int id);
	
	List<AuthInfo> selectByUserCode(String userCode);
}
