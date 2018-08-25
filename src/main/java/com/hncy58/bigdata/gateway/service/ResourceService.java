package com.hncy58.bigdata.gateway.service;

import java.util.List;

import com.github.pagehelper.Page;
import com.hncy58.bigdata.gateway.domain.ResourceDomain;
import com.hncy58.bigdata.gateway.model.Resource;

public interface ResourceService {

	Resource selectByPrimaryKey(int id);

	List<Resource> selectAllByType(List<String> resTypes);
	
	List<Resource> selectAll();

	List<Resource> selectAll(int pageNo, int pageSize);

	int deleteByPrimaryKey(int id);

	int insert(Resource resource);

	int updateByPrimaryKeySelective(Resource resource);

	List<Resource> getResourceByUser(int userId);

	int delete(List<String> ids);

	Page<Resource> select(int pageNo, int pageSize, ResourceDomain queryRes);

	int linkParentRes(String pResId, List<String> resList);

	int unlinkParentRes(String pResId, List<String> resList);

	List<Resource> getResourceByPids(List<String> resPids, int resType);
}
