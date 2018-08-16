package com.hncy58.bigdata.gateway.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
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
		,@Result(column="res_icon", property="resIcon")
		,@Result(column="create_time", property="createTime", jdbcType=JdbcType.TIMESTAMP)
		,@Result(column="update_time", property="updateTime", jdbcType=JdbcType.TIMESTAMP)
	})
	Resource selectByPrimaryKey(int id);
	
	@Select("select * from sys_res")
	@ResultMap("all_cols")
	List<Resource> selectAll();
	
	@Delete("delete from sys_res where id = #{id}")
	int deleteByPrimaryKey(int id);
	
	@Insert("insert into sys_res (id, res_code, p_res_code, res_type, res_name, res_uri, rank, create_time, update_time, mark, res_icon) "
			+ " values (#{id}, #{resCode}, #{pResCode}, #{resType}, #{resName}, #{resUri}, #{rank}, now(), now(), #{mark}, #{resIcon})")
	@Options(useGeneratedKeys = true, keyColumn = "id", keyProperty = "id")
	int insert(Resource res);
	
	@Update("UPDATE bigdata.sys_res SET p_res_code = #{pResCode}, res_type = #{resType}, res_name = #{resName}, res_uri = #{resUri}"
			+ ", rank = #{rank}, update_time = now(), mark = #{mark}, res_icon = #{resIcon} WHERE id = #{id}")
	int updateByPrimaryKey(Resource res);

	@Select("select r.* from sys_user u "
			+ "left join sys_user_role ur on u.id = ur.user_id "
			+ "left join sys_role_res rr on ur.role_id = rr.role_id "
			+ "left join sys_res r on rr.res_id = r.id "
			+ "where u.id = #{userId}")
	@ResultMap("all_cols")
	List<Resource> getResourceByUser(int userId);

	@Delete("<script>"
			+ "delete from sys_res where id in"
			+ " <foreach collection='ids' item='id' index='index' open='(' close=')' separator=','> "
			+ "  #{id, jdbcType=INTEGER} "
			+ " </foreach>"
			+ "</script>")
	int delete(@Param("ids") List<String> ids);

	@Delete("<script>"
			+ "delete from sys_role_res where res_id in "
			+ " <foreach collection='resIds' item='resId' index='index' open='(' close=')' separator=','> "
			+ "  #{resId, jdbcType=INTEGER} "
			+ " </foreach>"
			+ "</script>")
	int unlinkRole(@Param("resIds") List<String> resIds);
	
}
