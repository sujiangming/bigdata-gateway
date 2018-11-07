package com.hncy58.bigdata.gateway.controller.datasync;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.Page;
import com.hncy58.bigdata.gateway.domain.datasync.CanalMonitorDomain;
import com.hncy58.bigdata.gateway.domain.datasync.CanalConfDomain;
import com.hncy58.bigdata.gateway.model.datasync.CanalMonitorInfo;
import com.hncy58.bigdata.gateway.model.datasync.CanalConfInfo;
import com.hncy58.bigdata.gateway.service.datasync.CanalService;
import com.hncy58.bigdata.gateway.util.Constant;

/**
 * Canal数据抽取控制器
 * @author	tokings
 * @company	hncy58	湖南长银五八
 * @website	http://www.hncy58.com
 * @version 1.0
 * @date	2018年11月1日 下午4:33:10
 *
 */
@RestController
@RequestMapping("/api/canal")
public class CanalExtractorController {

	Logger log = LoggerFactory.getLogger(CanalExtractorController.class);

	@Autowired
	private CanalService service;

	@RequestMapping(value = "/conf/select", method = RequestMethod.GET)
	public Map<String, Object> selectByPage(int pageNo, int pageSize, CanalConfDomain domain) {

		Map<String, Object> ret = new HashMap<>();

		if (!StringUtils.isEmpty(domain.getSortField()))
			domain.setSortFiled();
			
		Page<CanalConfInfo> pageRet = service.selectConf(pageNo, pageSize, domain);

		ret.put("code", Constant.REQ_SUCCESS_CODE);
		ret.put("total", pageRet.getTotal());
		ret.put("pages", pageRet.getPages());
		ret.put("curPageNum", pageRet.getPageNum());
		ret.put("pageSize", pageRet.getPageSize());
		ret.put("data", pageRet.getResult());

		return ret;
	}
	
	@RequestMapping(value = "/monitor/select", method = RequestMethod.GET)
	public Map<String, Object> selectAuditByPage(int pageNo, int pageSize, CanalMonitorDomain domain) {
		
		Map<String, Object> ret = new HashMap<>();
		
		if (!StringUtils.isEmpty(domain.getSortField()))
			domain.setSortFiled();
		
		Page<CanalMonitorInfo> pageRet = service.selectMonitor(pageNo, pageSize, domain);
		
		ret.put("code", Constant.REQ_SUCCESS_CODE);
		ret.put("total", pageRet.getTotal());
		ret.put("pages", pageRet.getPages());
		ret.put("curPageNum", pageRet.getPageNum());
		ret.put("pageSize", pageRet.getPageSize());
		ret.put("data", pageRet.getResult());
		
		return ret;
	}

	@RequestMapping(value = "/conf/add")
	public Map<String, Object> addConf(CanalConfInfo model) {

		Map<String, Object> ret = new HashMap<>();
		model.setUpdate_time(new Date());
		model.setCreate_time(new Date());

		try {
			int num = service.addConf(model);
			if (num > 0) {
				ret.put("code", Constant.REQ_SUCCESS_CODE);
			} else {
				ret.put("code", "6201");
				ret.put("msg", "添加Canal抽数监控配置失败");
			}
		} catch (Exception e) {
			ret.put("code", "6201");
			ret.put("msg", "添加Canal抽数监控配置失败," + e.getMessage());
		}

		return ret;
	}
	
	@RequestMapping(value = "/conf/modify")
	public Map<String, Object> modifyConf(CanalConfInfo model) {
		
		Map<String, Object> ret = new HashMap<>();
		model.setUpdate_time(new Date());
		
		try {
			int num = service.modifyConf(model);
			if (num > 0) {
				ret.put("code", Constant.REQ_SUCCESS_CODE);
			} else {
				ret.put("code", "6202");
				ret.put("msg", "修改Canal抽数监控配置失败");
			}
		} catch (Exception e) {
			ret.put("code", "6202");
			ret.put("msg", "修改Canal抽数监控配置失败," + e.getMessage());
		}
		
		return ret;
	}
	
	@RequestMapping(value = "/conf/delete", method = {RequestMethod.GET, RequestMethod.POST})
	public Map<String, Object> deleteConf(String ids) {
		
		Map<String, Object> ret = new HashMap<>();
		
		if(StringUtils.isEmpty(ids)) {
			ret.put("code", "6203");
			ret.put("msg", "删除配置失败，没有传入正确的配置ID");
			return ret;
		}
		
		try {
			int num = service.deleteConf(ids);
			if (num > 0) {
				ret.put("code", Constant.REQ_SUCCESS_CODE);
			} else {
				ret.put("code", "6203");
				ret.put("msg", "删除配置失败");
			}
		} catch (Exception e) {
			ret.put("code", "6203");
			ret.put("msg", "删除配置失败," + e.getMessage());
		}
		
		return ret;
	}
}
