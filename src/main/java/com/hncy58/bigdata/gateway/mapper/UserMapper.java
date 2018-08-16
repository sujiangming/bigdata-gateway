package com.hncy58.bigdata.gateway.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hncy58.bigdata.gateway.model.User;

public interface UserMapper {

	User selectByPrimaryKey(int id);

	List<User> selectAll();

	List<User> select(User queryUser);

	int deleteByPrimaryKey(int id);

	int delete(@Param("ids") List<String> ids);

	int insert(User user);

	int updateByPrimaryKeySelective(User user);

	int updateByPrimaryKey(User user);

	User selectByUserCode(String userCode);

	int linkRoles(@Param("userId") String userId, @Param("roleIds") List<String> roleIds);

	int unlinkRoles(@Param("userId") String userId, @Param("roleIds") List<String> roleIds);

}
