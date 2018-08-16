package com.hncy58.bigdata.gateway.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.hncy58.bigdata.gateway.model.Resource;
import com.hncy58.bigdata.gateway.service.ResourceService;
import com.hncy58.bigdata.gateway.util.Constant;

@RestController
@RequestMapping("/api/res")
public class ResourceController {

	@Autowired
	private ResourceService resourceService;

	@RequestMapping(value = "/get", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> selectByPrimaryKey(int id) {
		Map<String, Object> ret = new HashMap<>();
		Resource res = resourceService.selectByPrimaryKey(id);
		ret.put("code", Constant.REQ_SUCCESS_CODE);
		ret.put("data", res);
		return ResponseEntity.ok(ret);

	}

	@RequestMapping(value = "/getResourceByUser", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> getResourceByUser(int userId) {
		Map<String, Object> ret = new HashMap<>();
		ret.put("code", Constant.REQ_SUCCESS_CODE);
		ret.put("data", resourceService.getResourceByUser(userId));
		return ResponseEntity.ok(ret);
	}

	@RequestMapping(value = "/all", method = RequestMethod.GET)
	public Map<String, Object> selectAll() {
		Map<String, Object> ret = new HashMap<>();
		List<Resource> roles = resourceService.selectAll();
		ret.put("code", Constant.REQ_SUCCESS_CODE);
		ret.put("data", roles);
		return ret;

	}

	@RequestMapping(value = "/select", method = RequestMethod.GET)
	public Map<String, Object> selectByPage(int pageNo, int pageSize) {
		// TODO 还未完全实现
		Map<String, Object> ret = new HashMap<>();
		List<Resource> roles = resourceService.selectAll(pageNo, pageSize);
		ret.put("code", Constant.REQ_SUCCESS_CODE);
		ret.put("data", roles);
		return ret;

	}

	@RequestMapping(value = "/delete", method = RequestMethod.DELETE)
	public Map<String, Object> deleteByPrimaryKey(int id) {
		Map<String, Object> ret = new HashMap<>();
		Map<String, Object> data = new HashMap<>();
		int num = resourceService.deleteByPrimaryKey(id);
		if (num > 0) {
			ret.put("code", Constant.REQ_SUCCESS_CODE);
			data.put("num", num);
		} else {
			ret.put("code", "3004");
			ret.put("msg", "删除资源失败");
		}
		ret.put("data", data);
		return ret;

	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public Map<String, Object> insert(Resource user) {
		Map<String, Object> ret = new HashMap<>();
		Map<String, Object> data = new HashMap<>();
		int num = resourceService.insert(user);
		if (num > 0) {
			ret.put("code", Constant.REQ_SUCCESS_CODE);
			data.put("id", user.getId());
		} else {
			ret.put("code", "3001");
			ret.put("msg", "添加资源失败");
		}
		ret.put("data", data);
		return ret;

	}

	@RequestMapping(value = "/update", method = RequestMethod.PUT)
	public Map<String, Object> updateByPrimaryKeySelective(Resource user) {
		int num = resourceService.updateByPrimaryKeySelective(user);
		Map<String, Object> ret = new HashMap<>();
		Map<String, Object> data = new HashMap<>();

		if (num > 0) {
			ret.put("code", Constant.REQ_SUCCESS_CODE);
			data.put("num", num);
		} else {
			ret.put("code", "3002");
			ret.put("msg", "更新资源失败");
		}

		ret.put("data", data);
		return ret;
	}

	@Deprecated
	@RequestMapping(value = "/update2", method = RequestMethod.PUT)
	public int updateByPrimaryKey(Resource user) {
		return resourceService.updateByPrimaryKey(user);
	}
}
