package com.hncy58.bigdata.gateway.service;

import java.util.List;

import com.hncy58.bigdata.gateway.model.AuthInfo;

public interface AuthorityService {

	List<AuthInfo> selectByUserId(int id);
	
	List<AuthInfo> selectByUserCode(String userCode);
}
