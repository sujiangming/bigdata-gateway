package com.hncy58.bigdata.gateway.mapper;

import java.util.List;

import com.hncy58.bigdata.gateway.model.AuthInfo;

/**
 * 权限数据映射
 * @author tdz
 * @company hncy58 长银五八
 * @website http://www.hncy58.com
 * @version 1.0
 * @date 2018年8月25日 下午4:42:28
 */
public interface AuthorityMapper {

	/**
	 * 根据用户ID获取权限信息
	 * @param userId
	 * @return
	 */
	List<AuthInfo> selectByUserId(int userId);

	/**
	 * 根据用户编码获取权限信息
	 * @param userCode
	 * @return
	 */
	List<AuthInfo> selectByUserCode(String userCode);
	
}
