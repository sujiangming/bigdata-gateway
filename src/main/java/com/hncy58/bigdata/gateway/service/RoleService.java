package com.hncy58.bigdata.gateway.service;

import java.util.List;

import com.github.pagehelper.Page;
import com.hncy58.bigdata.gateway.domain.RoleDomain;
import com.hncy58.bigdata.gateway.exception.RestfulJsonException;
import com.hncy58.bigdata.gateway.model.Resource;
import com.hncy58.bigdata.gateway.model.Role;

/**
 * 角色服务
 * @author tdz
 * @company hncy58 长银五八
 * @website http://www.hncy58.com
 * @version 1.0
 * @date 2018年8月25日 下午5:12:18
 */
public interface RoleService {

	Role selectByPrimaryKey(int id);

	List<Role> selectAll();

	Page<Role> select(int pageNo, int pageSize, RoleDomain roleDomain);

	int deleteByPrimaryKey(int id);

	int insert(Role role);

	int updateByPrimaryKeySelective(Role role, List<String> resIds);

	int updateByPrimaryKey(Role role);

	int linkRes(String roleId, List<String> asList);

	List<Role> getRoleByUserId(String userId) throws RestfulJsonException;

	List<Resource> getResourceByRole(int roleId);

	int delete(List<String> ids);
}
