package com.hncy58.bigdata.gateway.mapper;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.type.JdbcType;

import com.hncy58.bigdata.gateway.model.Resource;

public interface ResourceMapper {

	@Select("select * from sys_res where id=#{id}")
	@Results(id="all_cols", value={
		@Result(column="id", property="id")
		,@Result(column="res_type", property="resType")
		,@Result(column="res_name", property="resName")
		,@Result(column="res_code", property="resCode")
		,@Result(column="p_res_code", property="pResCode")
		,@Result(column="res_uri", property="resUri")
		,@Result(column="rank", property="rank")
		,@Result(column="mark", property="mark")
		,@Result(column="create_time", property="createTime", jdbcType=JdbcType.TIMESTAMP)
		,@Result(column="update_time", property="updateTime", jdbcType=JdbcType.TIMESTAMP)
	})
	Resource selectByPrimaryKey(int id);
	
	@Select("select * from sys_res")
	@ResultMap("all_cols")
	List<Resource> selectAll();
	
	@Delete("delete from sys_res where id = #{id}")
	int deleteByPrimaryKey(int id);
	
	@Insert("insert into sys_res values(#{id}, #{resType}, #{resName}, #{resCode}, #{createTime}, #{updateTime}, #{mark})")
	@Options(useGeneratedKeys = true, keyColumn = "id", keyProperty = "id")
	int insert(Resource res);
	
	@Update("update sys_res set res_type=#{resType}, res_name=#{resName}, res_code=#{resCode}, "
			+ "mark=#{mark}, create_time=#{createTime}, update_time=#{updateTime} where id=#{id}")
	int updateByPrimaryKey(Resource res);
	
}
