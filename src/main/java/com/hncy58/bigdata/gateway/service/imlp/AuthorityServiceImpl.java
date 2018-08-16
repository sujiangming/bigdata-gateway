package com.hncy58.bigdata.gateway.service.imlp;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hncy58.bigdata.gateway.mapper.AuthorityMapper;
import com.hncy58.bigdata.gateway.model.AuthInfo;
import com.hncy58.bigdata.gateway.service.AuthorityService;

@Service
public class AuthorityServiceImpl implements AuthorityService {
	
	Logger log = LoggerFactory.getLogger(AuthorityServiceImpl.class);

	@Autowired
	private AuthorityMapper authorityMapper;

	@Override
	public List<AuthInfo> selectByUserId(int id) {
		return authorityMapper.selectByUserId(id);
	}

	@Override
	public List<AuthInfo> selectByUserCode(String userCode) {
		return authorityMapper.selectByUserCode(userCode);
	}

}
