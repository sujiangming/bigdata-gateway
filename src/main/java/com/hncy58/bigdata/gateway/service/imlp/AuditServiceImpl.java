package com.hncy58.bigdata.gateway.service.imlp;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.hncy58.bigdata.gateway.domain.AuditDomain;
import com.hncy58.bigdata.gateway.mapper.AuditMapper;
import com.hncy58.bigdata.gateway.model.AuditInfo;
import com.hncy58.bigdata.gateway.service.AuditService;

@Service
public class AuditServiceImpl implements AuditService {

	Logger log = LoggerFactory.getLogger(AuditService.class);

	@Autowired
	private AuditMapper auditMapper;
	
	@Override
	public int save(AuditInfo audit) {
		return auditMapper.save(audit);
	}

	@Override
	public Page<AuditInfo> select(int pageNo, int pageSize, AuditDomain queryAudit) {
		

		Page<AuditInfo> page = PageHelper.startPage(pageNo, pageSize, true);
		auditMapper.select(queryAudit);
		log.debug("total audit : {}", page.getTotal());
		log.debug("ret audit : {}", page.getResult());

		Page<AuditInfo> pageRet = new Page<>(pageNo, pageSize);
		pageRet.setTotal(page.getTotal());
		pageRet.addAll(page.getResult());

		return pageRet;
	}

}
