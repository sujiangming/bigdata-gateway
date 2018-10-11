package com.hncy58.bigdata.gateway.service;

import java.util.List;

import com.github.pagehelper.Page;
import com.hncy58.bigdata.gateway.domain.BtnResourceDomain;
import com.hncy58.bigdata.gateway.model.BtnResource;

/**
 * 按钮级资源服务
 * 
 * @author tdz
 * @company hncy58 长银五八
 * @website http://www.hncy58.com
 * @version 1.0
 * @date 2018年10月11日 上午9:09:20
 */
public interface BtnResourceService {

	BtnResource getById(int id);

	int insert(BtnResource resource);

	int update(BtnResource resource);

	int delete(List<String> ids);
	
	List<BtnResource> selectAll();

	List<BtnResource> selectAll(int pageNum, int pageSize);

	Page<BtnResource> select(int pageNo, int pageSize, BtnResourceDomain queryRes);

	List<BtnResource> getByUserId(int userId);

	List<BtnResource> getByGroupCode(int userId, String groupCode);

	List<BtnResource> getByGroupCode(String groupCode);

	int linkRole(String roleId, List<String> resIds);
	
	int unlinkRole(String roleId, List<String> resIds);
}
