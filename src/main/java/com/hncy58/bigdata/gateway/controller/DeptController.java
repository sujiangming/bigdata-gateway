package com.hncy58.bigdata.gateway.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.hncy58.bigdata.gateway.model.Dept;
import com.hncy58.bigdata.gateway.service.DeptService;

@RestController
@RequestMapping("/api/dept")
public class DeptController {
	
	private Logger log = LoggerFactory.getLogger(DeptController.class);
	
	@Autowired
	private DeptService deptService;

	@RequestMapping(value = "/get", method = RequestMethod.GET)
	public ResponseEntity<Dept> selectByPrimaryKey(int id) {
		Dept dept = deptService.selectByPrimaryKey(id);
		return ResponseEntity.ok(dept);
	}

	@RequestMapping(value = "/all", method = RequestMethod.GET)
	public List<Dept> selectAll() {
		List<Dept> ret = deptService.selectAll();
		ret.forEach(role ->{
			System.out.println(role.getCreateTime());
			System.out.println(role.getUpdateTime());
			System.out.println(role);
		});
		log.info("roles:{}", ret);
		return ret;
	}
	
	@RequestMapping(value = "/select", method = RequestMethod.GET)
	public List<Dept> selectByPage(int pageNo, int pageSize) {
		return deptService.selectAll(pageNo, pageSize);
	}

	@RequestMapping(value = "/delete", method = RequestMethod.DELETE)
	public int deleteByPrimaryKey(int id) {
		return deptService.deleteByPrimaryKey(id);
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public int insert(Dept dept) {
		int ret = deptService.insert(dept);
		ret = dept.getId();
		return ret;
	}

	/**
	 * 直接通过传递表单形式的参数绑定到实体T中，可以减少通过N个req.getParameter("xxx")获取参数然后再手动绑定到实体T中带来的麻烦
	 * @param dept
	 * @return
	 */
	@RequestMapping(value = "/update1", method = RequestMethod.PUT)
	public int updateByPrimaryKeySelective1(Dept dept) {
		int ret = deptService.updateByPrimaryKeySelective(dept);
		return ret;
	}
	
	/**
	 * 通过RequestBody绑定参数，可以用来传递List<T>形式参数
	 * 注意：请求的Content-Type必须是"application/json; charset=UTF-8",
	 * @param req
	 * @param dept
	 * @return
	 */
	@RequestMapping(value = "/update2", method = RequestMethod.PUT)
	public int updateByPrimaryKeySelective2(@RequestBody Dept dept) {
		int ret = deptService.updateByPrimaryKeySelective(dept);
		return ret;
	}
}
