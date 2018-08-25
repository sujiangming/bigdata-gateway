package com.hncy58.bigdata.gateway.service;

import java.util.List;

import com.github.pagehelper.Page;
import com.hncy58.bigdata.gateway.domain.ResourceDomain;
import com.hncy58.bigdata.gateway.model.Resource;

/**
 * 资源服务
 * @author tdz
 * @company hncy58 长银五八
 * @website http://www.hncy58.com
 * @version 1.0
 * @date 2018年8月25日 下午5:12:12
 */
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
