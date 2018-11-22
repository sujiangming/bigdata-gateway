package com.hncy58.bigdata.gateway.service.datasync.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.hncy58.bigdata.gateway.domain.datasync.CanalConfDomain;
import com.hncy58.bigdata.gateway.domain.datasync.CanalMonitorDomain;
import com.hncy58.bigdata.gateway.domain.datasync.CanalSpeConfDomain;
import com.hncy58.bigdata.gateway.mapper.CanalMapper;
import com.hncy58.bigdata.gateway.model.datasync.CanalConfInfo;
import com.hncy58.bigdata.gateway.model.datasync.CanalMonitorInfo;
import com.hncy58.bigdata.gateway.model.datasync.CanalSpeConfInfo;
import com.hncy58.bigdata.gateway.service.datasync.CanalService;

@Service
public class CanalServiceImpl implements CanalService {

	Logger log = LoggerFactory.getLogger(CanalServiceImpl.class);

	@Autowired
	private CanalMapper canalMapper;

	@Override
	public Page<CanalMonitorInfo> selectMonitor(int pageNo, int pageSize, CanalMonitorDomain domain) {

		Page<CanalMonitorInfo> page = PageHelper.startPage(pageNo, pageSize, true);
		canalMapper.selectMonitor(domain);
		log.debug("total monitor : {}", page.getTotal());
		log.debug("ret monitor : {}", page.getResult());

		Page<CanalMonitorInfo> pageRet = new Page<>(pageNo, pageSize);
		pageRet.setTotal(page.getTotal());
		pageRet.addAll(page.getResult());

		return pageRet;
	}

	@Override
	public Page<CanalConfInfo> selectConf(int pageNo, int pageSize, CanalConfDomain domain) {

		Page<CanalConfInfo> page = PageHelper.startPage(pageNo, pageSize, true);
		canalMapper.selectConf(domain);
		log.debug("total conf : {}", page.getTotal());
		log.debug("ret conf : {}", page.getResult());

		Page<CanalConfInfo> pageRet = new Page<>(pageNo, pageSize);
		pageRet.setTotal(page.getTotal());
		pageRet.addAll(page.getResult());

		return pageRet;
	}

	@Override
	public int addConf(CanalConfInfo model) {
		return canalMapper.addConf(model);
	}

	@Override
	public int modifyConf(CanalConfInfo model) {
		return canalMapper.modifyConf(model);
	}

	@Override
	public int deleteConf(String id) {
		return canalMapper.deleteConf(id);
	}

	@Override
	public int addSpeConf(CanalSpeConfInfo model) {
		return canalMapper.addSpeConf(model);
	}

	@Override
	public int modifySpeConf(CanalSpeConfInfo model) {
		return canalMapper.modifySpeConf(model);
		}

	@Override
	public int deleteSpeConf(String id) {
		return canalMapper.deleteSpeConf(id);
		}

	@Override
	public Page<CanalSpeConfInfo> selectSpeConf(int pageNo, int pageSize, CanalSpeConfDomain domain) {

		Page<CanalSpeConfInfo> page = PageHelper.startPage(pageNo, pageSize, true);
		canalMapper.selectSpeConf(domain);
		log.debug("total conf : {}", page.getTotal());
		log.debug("ret conf : {}", page.getResult());

		Page<CanalSpeConfInfo> pageRet = new Page<>(pageNo, pageSize);
		pageRet.setTotal(page.getTotal());
		pageRet.addAll(page.getResult());

		return pageRet;
	}

}
