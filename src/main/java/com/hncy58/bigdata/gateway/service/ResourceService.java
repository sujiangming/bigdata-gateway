package com.hncy58.bigdata.gateway.service;

import java.util.List;

import com.github.pagehelper.Page;
import com.hncy58.bigdata.gateway.domain.ResourceDomain;
import com.hncy58.bigdata.gateway.model.Resource;

public interface ResourceService {

	Resource selectByPrimaryKey(int id);

	List<Resource> selectAll();

	List<Resource> selectAll(int pageNo, int pageSize);

	int deleteByPrimaryKey(int id);

	int insert(Resource resource);

	int updateByPrimaryKeySelective(Resource resource);

	int updateByPrimaryKey(Resource resource);

	List<Resource> getResourceByUser(int userId);

	int delete(List<String> ids);

	Page<Resource> select(int pageNo, int pageSize, ResourceDomain queryRes);
}
