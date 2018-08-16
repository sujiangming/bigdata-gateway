package com.hncy58.bigdata.gateway.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.hncy58.bigdata.gateway.model.AuthInfo;
import com.hncy58.bigdata.gateway.model.User;
import com.hncy58.bigdata.gateway.service.AuthorityService;
import com.hncy58.bigdata.gateway.service.ResourceService;
import com.hncy58.bigdata.gateway.service.TokenService;
import com.hncy58.bigdata.gateway.service.UserService;
import com.hncy58.bigdata.gateway.util.Constant;
import com.hncy58.bigdata.gateway.util.Utils;

/**
 * 登录、登出API
 * @author	tokings
 * @company	hncy58	湖南长银五八
 * @website	http://www.hncy58.com
 * @version 1.0
 * @date	2018年8月15日 上午11:51:39
 *
 */
@RestController
@RequestMapping("/api")
public class LoginController {

	Logger log = LoggerFactory.getLogger(LoginController.class);

	@Autowired
	private UserService userService;

	@Autowired
	private ResourceService resourceService;

	@Autowired
	private AuthorityService authorityService;

	@Autowired
	private TokenService tokenService;

	@RequestMapping(value = "/login", method = { RequestMethod.POST, RequestMethod.GET })
	public ResponseEntity<Map<String, Object>> login(HttpServletRequest req) {

		String userCode = req.getParameter("userCode");
		String password = req.getParameter("password");

		Map<String, Object> ret = new HashMap<>();
		Map<String, Object> data = new HashMap<>();
		User user = userService.selectByUserCode(userCode);
		HttpSession session = req.getSession();

		log.info("session:{}", session.getId());

		if (user != null && user.getPassword().equals(password)) {
			String token = null;
			// 用户已经登录
			if(tokenService.exists(user.getId())) {
				token = tokenService.getToken(user.getId());
			} else {
				token = tokenService.generateToken(user.getId());
			}
			
			ret.put("code", Constant.REQ_SUCCESS_CODE);
			data.put("token", token);
			// 屏蔽密码信息
			user.setPassword("******");
			data.put("user", user);
			List<AuthInfo> authInfos = authorityService.selectByUserId(user.getId());
			if (!authInfos.isEmpty()) {
				AuthInfo authInfo = authInfos.get(0);

				// 生成菜单栏
				// 判断是否具有超管角色
				if (Utils.hasSuperRole(authInfo)) {
					data.put("menu", Utils.generateMenu(resourceService.selectAll()));
					// 缓存设置用户具有超级管理员角色
					tokenService.putCacheByToken(token, "superrole", "1");
				} else {
					data.put("menu", Utils.generateMenu(authInfo));
				}

				// 放置所有权限
				data.put("authInfo", authInfo);
				// 缓存登录用户权限信息
				tokenService.putCacheByToken(token, "authinfo", authInfo);
			}
		} else {
			ret.put("code", "1001");
			ret.put("msg", "用户不存在或者密码错误");
		}

		ret.put("data", data);
		return ResponseEntity.ok(ret);
	}

	@RequestMapping(value = "/logout", method = { RequestMethod.GET })
	public ResponseEntity<Map<String, Object>> logout(HttpServletRequest req, String userCode, String password) {

		Map<String, Object> ret = new HashMap<>();
		HttpSession session = req.getSession();
		String token = req.getHeader(Constant.REQ_TOKEN_HEADER_KEY);
		log.info("session:{}, token:{}", session.getId(), token);

		// 如果token存在则移除
		if (tokenService.validateToken(token)) {
			tokenService.removeToken(token);
			ret.put("code", Constant.REQ_SUCCESS_CODE);
		} else {
			ret.put("code", "1002");
			ret.put("msg", "请求token不存在，token：" + token);
		}

		return ResponseEntity.ok(ret);
	}

}
