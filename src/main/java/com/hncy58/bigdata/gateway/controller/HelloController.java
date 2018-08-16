package com.hncy58.bigdata.gateway.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hncy58.bigdata.gateway.exception.PageException;
import com.hncy58.bigdata.gateway.exception.RestfulJsonException;
import com.hncy58.bigdata.gateway.model.Role;

@Controller
@RequestMapping("/test")
@Deprecated
public class HelloController {

	/**
	 * restful JSON异常测试
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/json")
	public Object json() throws Exception {
		try {
			int test = 1 / 0;
		} catch (Exception e) {
			throw new RestfulJsonException("发生restful错误测试", e);
		}

		return "test";
	}

	/**
	 * page异常测试
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/hello")
	public String hello() throws Exception {
		try {
			int test = 1 / 0;
		} catch (Exception e) {
			throw new PageException("发生page错误测试", e);
		}

		return "test";
	}

	@RequestMapping(value = "/linkRoleTest")
	public int linkRole(@RequestBody ArrayList<Role> roles) {

		if (roles != null) {
			roles.forEach(role -> {
				System.out.println(role.getId() + "," + role.getRoleName());
			});
			return roles.size();
		}

		return 0;
	}

}
