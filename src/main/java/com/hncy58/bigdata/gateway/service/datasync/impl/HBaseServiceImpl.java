package com.hncy58.bigdata.gateway.service.datasync.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.hncy58.bigdata.gateway.domain.datasync.HBaseAuditDomain;
import com.hncy58.bigdata.gateway.domain.datasync.HBaseConfDomain;
import com.hncy58.bigdata.gateway.mapper.HBaseMapper;
import com.hncy58.bigdata.gateway.model.datasync.HBaseAuditInfo;
import com.hncy58.bigdata.gateway.model.datasync.HBaseConfInfo;
import com.hncy58.bigdata.gateway.service.datasync.HBaseService;

@Service
public class HBaseServiceImpl implements HBaseService {

	Logger log = LoggerFactory.getLogger(HBaseServiceImpl.class);

	@Autowired
	private HBaseMapper hbaseMapper;

	@Override
	public Page<HBaseAuditInfo> selectAudit(int pageNo, int pageSize, HBaseAuditDomain domain) {

		Page<HBaseAuditInfo> page = PageHelper.startPage(pageNo, pageSize, true);
		hbaseMapper.selectAudit(domain);
		log.debug("total audit : {}", page.getTotal());
		log.debug("ret audit : {}", page.getResult());

		Page<HBaseAuditInfo> pageRet = new Page<>(pageNo, pageSize);
		pageRet.setTotal(page.getTotal());
		pageRet.addAll(page.getResult());

		return pageRet;
	}

	@Override
	public Page<HBaseConfInfo> selectConf(int pageNo, int pageSize, HBaseConfDomain domain) {

		Page<HBaseConfInfo> page = PageHelper.startPage(pageNo, pageSize, true);
		hbaseMapper.selectConf(domain);
		log.debug("total audit : {}", page.getTotal());
		log.debug("ret audit : {}", page.getResult());

		Page<HBaseConfInfo> pageRet = new Page<>(pageNo, pageSize);
		pageRet.setTotal(page.getTotal());
		pageRet.addAll(page.getResult());

		return pageRet;
	}

	@Override
	public int addConf(HBaseConfInfo domain) {
		return hbaseMapper.addConf(domain);
	}

	@Override
	public int modifyConf(HBaseConfInfo domain) {
		return hbaseMapper.modifyConf(domain);
	}

}
