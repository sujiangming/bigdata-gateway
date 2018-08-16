package com.hncy58.bigdata.gateway.service;

import java.util.List;

import com.github.pagehelper.Page;
import com.hncy58.bigdata.gateway.exception.RestfulJsonException;
import com.hncy58.bigdata.gateway.model.Resource;
import com.hncy58.bigdata.gateway.model.Role;

public interface RoleService {

	Role selectByPrimaryKey(int id);

	List<Role> selectAll();

	Page<Role> select(int pageNo, int pageSize, Role queryRole);

	int deleteByPrimaryKey(int id);

	int insert(Role user);

	int updateByPrimaryKeySelective(Role user);

	int updateByPrimaryKey(Role user);

	int linkRes(String roleId, List<String> asList);

	List<Role> getRoleByUserId(String userId) throws RestfulJsonException;

	List<Resource> getResourceByRole(int roleId);

	int delete(List<String> ids);
}
