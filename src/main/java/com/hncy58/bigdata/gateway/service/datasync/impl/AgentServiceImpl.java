package com.hncy58.bigdata.gateway.service.datasync.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.hncy58.bigdata.gateway.domain.datasync.AgentDomain;
import com.hncy58.bigdata.gateway.mapper.AgentMapper;
import com.hncy58.bigdata.gateway.model.datasync.AgentInfo;
import com.hncy58.bigdata.gateway.service.AuditService;
import com.hncy58.bigdata.gateway.service.datasync.AgentService;

@Service
public class AgentServiceImpl implements AgentService {

	Logger log = LoggerFactory.getLogger(AuditService.class);

	@Autowired
	private AgentMapper agentMapper;

	@Override
	public Page<AgentInfo> select(int pageNo, int pageSize, AgentDomain queryAudit) {
		

		Page<AgentInfo> page = PageHelper.startPage(pageNo, pageSize, true);
		agentMapper.select(queryAudit);
		log.debug("total audit : {}", page.getTotal());
		log.debug("ret audit : {}", page.getResult());

		Page<AgentInfo> pageRet = new Page<>(pageNo, pageSize);
		pageRet.setTotal(page.getTotal());
		pageRet.addAll(page.getResult());

		return pageRet;
	}

}
