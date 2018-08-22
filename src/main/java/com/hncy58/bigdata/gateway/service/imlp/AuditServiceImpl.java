package com.hncy58.bigdata.gateway.service.imlp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hncy58.bigdata.gateway.mapper.AuditMapper;
import com.hncy58.bigdata.gateway.model.AuditInfo;
import com.hncy58.bigdata.gateway.service.AuditService;

@Service
public class AuditServiceImpl implements AuditService {

	@Autowired
	private AuditMapper auditMapper;
	
	@Override
	public int save(AuditInfo audit) {
		return auditMapper.save(audit);
	}

}
