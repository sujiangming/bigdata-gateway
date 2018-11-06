package com.hncy58.bigdata.gateway.service.datasync.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.hncy58.bigdata.gateway.domain.datasync.KafkaConfDomain;
import com.hncy58.bigdata.gateway.domain.datasync.KafkaMonitorDomain;
import com.hncy58.bigdata.gateway.mapper.KafkaMapper;
import com.hncy58.bigdata.gateway.model.datasync.KafkaConfInfo;
import com.hncy58.bigdata.gateway.model.datasync.KafkaMonitorInfo;
import com.hncy58.bigdata.gateway.service.AuditService;
import com.hncy58.bigdata.gateway.service.datasync.KafkaService;

@Service
public class KafkaServiceImpl implements KafkaService {

	Logger log = LoggerFactory.getLogger(AuditService.class);

	@Autowired
	private KafkaMapper kafkaMapper;

	@Override
	public Page<KafkaMonitorInfo> selectMonitor(int pageNo, int pageSize, KafkaMonitorDomain domain) {
		
		Page<KafkaMonitorInfo> page = PageHelper.startPage(pageNo, pageSize, true);
		kafkaMapper.selectMonitor(domain);
		log.debug("total audit : {}", page.getTotal());
		log.debug("ret audit : {}", page.getResult());

		Page<KafkaMonitorInfo> pageRet = new Page<>(pageNo, pageSize);
		pageRet.setTotal(page.getTotal());
		pageRet.addAll(page.getResult());

		return pageRet;
	}
	
	@Override
	public Page<KafkaConfInfo> selectConf(int pageNo, int pageSize, KafkaConfDomain domain) {
		
		Page<KafkaConfInfo> page = PageHelper.startPage(pageNo, pageSize, true);
		kafkaMapper.selectConf(domain);
		log.debug("total audit : {}", page.getTotal());
		log.debug("ret audit : {}", page.getResult());
		
		Page<KafkaConfInfo> pageRet = new Page<>(pageNo, pageSize);
		pageRet.setTotal(page.getTotal());
		pageRet.addAll(page.getResult());
		
		return pageRet;
	}

	@Override
	public int addConf(KafkaConfInfo domain) {
		return kafkaMapper.addConf(domain);
	}

	@Override
	public int modifyConf(KafkaConfInfo domain) {
		return kafkaMapper.modifyConf(domain);
	}

}
