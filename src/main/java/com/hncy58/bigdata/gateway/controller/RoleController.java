package com.hncy58.bigdata.gateway.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.util.StringUtil;
import com.hncy58.bigdata.gateway.model.Role;
import com.hncy58.bigdata.gateway.service.RoleService;
import com.hncy58.bigdata.gateway.util.Constant;

import io.swagger.annotations.ApiOperation;

/**
 * 角色操作API
 * 
 * @author tokings
 * @company hncy58 湖南长银五八
 * @website http://www.hncy58.com
 * @version 1.0
 * @date 2018年8月15日 下午7:36:41
 *
 */
@RestController
@RequestMapping("/api/role")
public class RoleController {

	private Logger log = LoggerFactory.getLogger(RoleController.class);

	@Autowired
	private RoleService roleService;

	@RequestMapping(value = "/get", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> selectByPrimaryKey(int id) {
		Map<String, Object> ret = new HashMap<>();
		Role role = roleService.selectByPrimaryKey(id);
		ret.put("code", Constant.REQ_SUCCESS_CODE);
		ret.put("data", role);
		return ResponseEntity.ok(ret);
	}

	@RequestMapping(value = "/all", method = RequestMethod.GET)
	public Map<String, Object> selectAll() {
		Map<String, Object> ret = new HashMap<>();
		List<Role> roles = roleService.selectAll();
		ret.put("code", Constant.REQ_SUCCESS_CODE);
		ret.put("data", roles);
		return ret;
	}

	@RequestMapping(value = "/select", method = RequestMethod.GET)
	public Map<String, Object> selectByPage(int pageNo, int pageSize, Role queryRole) {
		// TODO 没有完全实现好
		Map<String, Object> ret = new HashMap<>();
		ret.put("code", Constant.REQ_SUCCESS_CODE);
		ret.put("data", roleService.select(pageNo, pageSize, queryRole));
		return ret;

	}

	@RequestMapping(value = "/delete", method = RequestMethod.DELETE)
	public Map<String, Object> delete(String ids) {
		Map<String, Object> ret = new HashMap<>();
		Map<String, Object> data = new HashMap<>();
		int num = roleService.delete(Arrays.asList(ids.trim().split(",")));
		if (num > 0) {
			ret.put("code", Constant.REQ_SUCCESS_CODE);
			data.put("num", num);
		} else {
			ret.put("code", "3004");
			ret.put("msg", "删除角色失败，没有删除任何用户");
		}

		ret.put("data", data);
		return ret;
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public Map<String, Object> insert(Role role) {
		int num = roleService.insert(role);
		Map<String, Object> ret = new HashMap<>();
		Map<String, Object> data = new HashMap<>();
		if (num > 0) {
			data.put("id", role.getId());
			ret.put("code", Constant.REQ_SUCCESS_CODE);
		} else {
			ret.put("code", "2001");
			ret.put("msg", "添加角色失败");
		}
		ret.put("data", data);
		return ret;
	}

	@RequestMapping(value = "/update", method = RequestMethod.PUT)
	public Map<String, Object> updateByPrimaryKeySelective(Role role) {
		Map<String, Object> ret = new HashMap<>();
		int num = roleService.updateByPrimaryKeySelective(role);
		if (num > 0) {
			ret.put("code", Constant.REQ_SUCCESS_CODE);
		} else {
			ret.put("code", "2002");
			ret.put("msg", "更新角色失败");
		}
		ret.put("data", Collections.emptyMap());
		return ret;

	}

	@RequestMapping(value = "/linkRes", method = RequestMethod.PUT)
	public Map<String, Object> linkResource(String roleId, String resIds) {
		Map<String, Object> ret = new HashMap<>();
		Map<String, Object> data = new HashMap<>();
		List<String> resList = new ArrayList<>();
		if (!StringUtil.isEmpty(resIds.trim())) {
			resList = Arrays.asList(resIds.trim().split(","));
		}

		int num = roleService.linkRes(roleId, resList);
		data.put("num", num);
		ret.put("code", Constant.REQ_SUCCESS_CODE);
		ret.put("data", data);
		return ret;

	}

	@Deprecated
	@ApiOperation(value = "测试组合注解", notes = "注意事项")
	@RequestMapping(value = "/update2", method = RequestMethod.PUT)
	public int updateByPrimaryKey(Role role) {
		return roleService.updateByPrimaryKey(role);
	}

}
