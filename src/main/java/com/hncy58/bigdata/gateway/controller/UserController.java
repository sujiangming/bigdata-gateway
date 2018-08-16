package com.hncy58.bigdata.gateway.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.Page;
import com.github.pagehelper.util.StringUtil;
import com.hncy58.bigdata.gateway.exception.RestfulJsonException;
import com.hncy58.bigdata.gateway.model.Role;
import com.hncy58.bigdata.gateway.model.User;
import com.hncy58.bigdata.gateway.service.RoleService;
import com.hncy58.bigdata.gateway.service.TokenService;
import com.hncy58.bigdata.gateway.service.UserService;
import com.hncy58.bigdata.gateway.util.Constant;
import com.hncy58.bigdata.gateway.util.Utils;

/**
 * 用户操作API
 * 
 * @author tokings
 * @company hncy58 湖南长银五八
 * @website http://www.hncy58.com
 * @version 1.0
 * @date 2018年8月15日 下午7:36:15
 *
 */
@RestController
@RequestMapping("/api/user")
public class UserController {

	private Logger log = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private UserService userService;

	@Autowired
	private RoleService roleService;

	@Autowired
	private TokenService tokenService;

	@RequestMapping(value = "/get", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> selectByPrimaryKey(int id) {
		Map<String, Object> ret = new HashMap<>();
		User user = userService.selectByPrimaryKey(id);
		ret.put("code", Constant.REQ_SUCCESS_CODE);
		ret.put("data", user);
		return ResponseEntity.ok(ret);
	}

	@RequestMapping(value = "/getByToken", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> getByToken(HttpServletRequest req) {

		Map<String, Object> ret = new HashMap<>();
		String token = req.getHeader(Constant.REQ_TOKEN_HEADER_KEY);
		Integer id = 0;

		if (!StringUtils.isEmpty(token)) {
			id = Integer.valueOf(token.split("#")[1]);
		}

		User user = new User();
		if (id > 0)
			user = userService.selectByPrimaryKey(id);
		ret.put("data", user);
		ret.put("code", Constant.REQ_SUCCESS_CODE);
		return ResponseEntity.ok(ret);
	}

	/**
	 * 查询所有数据
	 * 
	 * @return
	 */
	@RequestMapping(value = "/all", method = RequestMethod.GET)
	public Map<String, Object> selectAll() {
		Map<String, Object> ret = new HashMap<>();
		List<User> users = userService.selectAll();
		ret.put("code", Constant.REQ_SUCCESS_CODE);
		ret.put("data", users);
		return ret;
	}

	/**
	 * 根据查询条件和分页参数进行数据过滤查询
	 * 
	 * @param pageNo
	 * @param pageSize
	 * @param queryUser
	 * @return
	 */
	@RequestMapping(value = "/select", method = RequestMethod.GET)
	public Map<String, Object> selectByPage(int pageNo, int pageSize, User queryUser) {

		Map<String, Object> ret = new HashMap<String, Object>();
		Page<User> pageRet = userService.selectAll(pageNo, pageSize, queryUser);

		ret.put("code", Constant.REQ_SUCCESS_CODE);
		ret.put("total", pageRet.getTotal());
		ret.put("pages", pageRet.getPages());
		ret.put("curPageNum", pageRet.getPageNum());
		ret.put("pageSize", pageRet.getPageSize());
		ret.put("data", pageRet.getResult());

		return ret;
	}

	@Deprecated
	@RequestMapping(value = "/deleteByPrimaryKey", method = RequestMethod.DELETE)
	public Map<String, Object> deleteByPrimaryKey(int id) {
		Map<String, Object> ret = new HashMap<>();
		Map<String, Object> data = new HashMap<>();
		int num = userService.deleteByPrimaryKey(id);
		if (num > 0) {
			data.put("num", num);
			ret.put("code", Constant.REQ_SUCCESS_CODE);
		} else {
			ret.put("msg", "删除用户失败");
			ret.put("code", "2004");
		}
		ret.put("data", data);
		return ret;
	}

	@RequestMapping(value = "/delete", method = RequestMethod.DELETE)
	public Map<String, Object> delete(String ids) {
		Map<String, Object> ret = new HashMap<>();
		Map<String, Object> data = new HashMap<>();
		log.info("start delete users:{}", ids);
		int num = userService.delete(Arrays.asList(ids.trim().split(",")));
		if (num > 0) {
			data.put("num", num);
			ret.put("code", Constant.REQ_SUCCESS_CODE);
		} else {
			ret.put("msg", "删除用户失败，系统删除没有删除任何用户");
			ret.put("code", "2004");
		}

		Arrays.asList(ids.trim().split(";")).forEach(userId -> {
			String token = tokenService.getToken(Integer.valueOf(userId.trim()));
			// 如果token存在则移除
			if (tokenService.validateToken(token)) {
				tokenService.removeToken(token);
				log.info("remove token cache, token:{}", token);
			}
		});

		ret.put("data", data);
		return ret;
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public Map<String, Object> insert(User user) {
		int num = userService.insert(user);
		Map<String, Object> ret = new HashMap<>();
		Map<String, Object> data = new HashMap<>();
		if (num > 0) {
			data.put("id", user.getId());
			ret.put("code", Constant.REQ_SUCCESS_CODE);
		} else {
			ret.put("code", "2001");
			ret.put("msg", "添加失败");
		}
		ret.put("data", data);
		return ret;
	}

	@RequestMapping(value = "/update", method = RequestMethod.PUT)
	public Map<String, Object> updateByPrimaryKeySelective(User user) {
		Map<String, Object> ret = new HashMap<>();
		int num = userService.updateByPrimaryKeySelective(user);
		if (num > 0) {
			ret.put("code", Constant.REQ_SUCCESS_CODE);
		} else {
			ret.put("code", "2002");
			ret.put("msg", "更新用户失败");
		}
		ret.put("data", Collections.emptyMap());
		return ret;

	}

	@Deprecated
	@RequestMapping(value = "/update2", method = RequestMethod.PUT)
	public Map<String, Object> updateByPrimaryKey(User user) {
		Map<String, Object> ret = new HashMap<>();
		int num = userService.updateByPrimaryKey(user);
		if (num > 0) {
			ret.put("code", Constant.REQ_SUCCESS_CODE);
		} else {
			ret.put("code", "2003");
			ret.put("msg", "更新用户失败");
		}
		ret.put("data", Collections.emptyMap());
		return ret;
	}

	@RequestMapping(value = "/linkRole", method = RequestMethod.PUT)
	public Map<String, Object> linkRole(String userId, String roleIds) {
		Map<String, Object> ret = new HashMap<>();
		Map<String, Object> data = new HashMap<>();
		List<String> roleList = new ArrayList<>();
		if (!StringUtil.isEmpty(roleIds.trim())) {
			roleList = Arrays.asList(roleIds.trim().split(","));
		}
		int num = userService.linkRole(userId, roleList);
		data.put("num", num);
		ret.put("code", Constant.REQ_SUCCESS_CODE);
		ret.put("data", data);
		return ret;
	}

	@RequestMapping(value = "/getRoleByUserId", method = RequestMethod.GET)
	public Map<String, Object> getRoleByUserId(String userId) throws RestfulJsonException {
		Map<String, Object> ret = new HashMap<>();
		try {
			List<Role> roles = roleService.getRoleByUserId(userId);
			ret.put("code", Constant.REQ_SUCCESS_CODE);
			ret.put("data", roles);
			return ret;
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			Utils.handleRestfulJsonException(e);
		}

		ret.put("code", "2005");
		ret.put("msg", "查询用户角色列表失败");
		ret.put("data", Collections.emptyList());
		return ret;
	}

}
