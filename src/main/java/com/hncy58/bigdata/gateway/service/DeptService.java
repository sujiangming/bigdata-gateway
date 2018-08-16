package com.hncy58.bigdata.gateway.service;

import java.util.List;

import com.hncy58.bigdata.gateway.model.Dept;

public interface DeptService {

	Dept selectByPrimaryKey(int id);
	List<Dept> selectAll();
	List<Dept> selectAll(int pageNo, int pageSize);
	int deleteByPrimaryKey(int id);
	int insert(Dept user);
	int updateByPrimaryKeySelective(Dept user);
	int updateByPrimaryKey(Dept user);
}
