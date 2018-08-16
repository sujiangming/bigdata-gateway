package com.hncy58.bigdata.gateway.mapper;

import java.util.List;

import com.hncy58.bigdata.gateway.model.AuthInfo;

public interface AuthorityMapper {

	List<AuthInfo> selectByUserId(int userId);

	List<AuthInfo> selectByUserCode(String userCode);
	
}
