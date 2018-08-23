package com.hncy58.bigdata.gateway.controller;

import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.Page;
import com.hncy58.bigdata.gateway.domain.AuthChangeMsg;
import com.hncy58.bigdata.gateway.domain.ResourceDomain;
import com.hncy58.bigdata.gateway.model.Resource;
import com.hncy58.bigdata.gateway.model.User;
import com.hncy58.bigdata.gateway.service.ResourceService;
import com.hncy58.bigdata.gateway.service.UserService;
import com.hncy58.bigdata.gateway.service.imlp.AuthInfoCacheService;
import com.hncy58.bigdata.gateway.util.Constant;

@RestController
@RequestMapping("/api/res")
public class ResourceController {

	private static Logger log = LoggerFactory.getLogger(ResourceController.class);

	@Autowired
	private AuthInfoCacheService authInfoCacheService;

	@Autowired
	private UserService userService;

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
	public Map<String, Object> selectByPage(int pageNo, int pageSize, ResourceDomain queryRes) {

		Map<String, Object> ret = new HashMap<>();
		Page<Resource> pageRet = resourceService.select(pageNo, pageSize, queryRes);

		ret.put("code", Constant.REQ_SUCCESS_CODE);
		ret.put("total", pageRet.getTotal());
		ret.put("pages", pageRet.getPages());
		ret.put("curPageNum", pageRet.getPageNum());
		ret.put("pageSize", pageRet.getPageSize());
		ret.put("data", pageRet.getResult());

		return ret;

	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public Map<String, Object> deleteByPrimaryKey(String ids) {
		Map<String, Object> ret = new HashMap<>();
		Map<String, Object> data = new HashMap<>();
		log.info("start delete res:{}", ids);
		List<String> resIds = Arrays.asList(ids.trim().split(","));
		// 删除资源之前需要先查询已经关联此资源的用户，用于发送用户权限信息更改消息
		List<User> users = userService.selectUserByRes(resIds);
		int num = resourceService.delete(resIds);

		if (num > 0) {
			ret.put("code", Constant.REQ_SUCCESS_CODE);
			data.put("num", num);
			// 发送权限信息更改消息(redis pub/sub)，告知后台需要更新用户权限信息。做成异步、解耦的方式
			AuthChangeMsg msg = new AuthChangeMsg("res", "delete",
					users.stream().map(user -> user.getId()).collect(Collectors.toList()));
			authInfoCacheService.sendMsg(msg);
			log.info("role delete:{}, send auth info change msg", ids);
		} else {
			ret.put("code", "4004");
			ret.put("msg", "删除资源失败，系统删除没有删除任何资源");
		}

		ret.put("data", data);
		return ret;
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public Map<String, Object> insert(Resource res) {
		res.setUpdateTime(new Date());
		res.setCreateTime(new Date());
		Map<String, Object> ret = new HashMap<>();
		try {
			int num = resourceService.insert(res);
			if (num > 0) {
				ret.put("code", Constant.REQ_SUCCESS_CODE);
			} else {
				ret.put("code", "4001");
				ret.put("msg", "添加资源失败");
			}
		} catch (Exception e) {
			if (e instanceof DuplicateKeyException) {
				ret.put("code", "4003");
				ret.put("msg", "数据库唯一键冲突，可能是资源编码重复导致");
			} else {
				ret.put("code", "4001");
				ret.put("msg", "添加资源失败," + e.getMessage());
			}
		}
		ret.put("data", res);
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
			ret.put("code", "4002");
			ret.put("msg", "更新资源失败");
		}

		ret.put("data", data);
		return ret;
	}

}
