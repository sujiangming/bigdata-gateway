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

import com.github.pagehelper.Page;
import com.hncy58.bigdata.gateway.domain.ResourceDomain;
import com.hncy58.bigdata.gateway.model.Resource;

public interface ResourceMapper {

	@Select("select * from sys_res where id=#{id}")
	@Results(id="all_cols", value={
		@Result(column="id", property="id")
		,@Result(column="pid", property="pid")
		,@Result(column="res_type", property="resType")
		,@Result(column="res_name", property="resName")
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
	
	@Select("<script>"
			+ "select * from sys_res where res_type in "
			+ " <foreach collection='resTypes' item='resType' index='index' open='(' close=')' separator=','> "
			+ "  #{resType, jdbcType=INTEGER} "
			+ " </foreach>"
			+ "</script>")
	@ResultMap("all_cols")
	List<Resource> selectAllByType(@Param("resTypes") List<String> resTypes);
	
	@Delete("delete from sys_res where id = #{id}")
	int deleteByPrimaryKey(int id);
	
	@Insert("insert into sys_res (id, pid, res_type, res_name, res_uri, rank, mark, res_icon, create_time, update_time) "
			+ " values (#{id}, #{pid}, #{resType}, #{resName}, #{resUri}, #{rank}, #{mark}, #{resIcon}, #{createTime,jdbcType=TIMESTAMP}, #{updateTime,jdbcType=TIMESTAMP})")
	@Options(useGeneratedKeys = true, keyColumn = "id", keyProperty = "id")
	int insert(Resource res);
	
	@Update("UPDATE sys_res SET pid = #{pid}, res_type = #{resType}, res_name = #{resName}, res_uri = #{resUri}"
			+ ", rank = #{rank}, update_time = now(), mark = #{mark}, res_icon = #{resIcon} WHERE id = #{id}")
	int updateByPrimaryKey(Resource res);

	@Select("select r.* from sys_user u "
			+ "left join sys_user_role ur on u.id = ur.user_id "
			+ "left join sys_role_res rr on ur.role_id = rr.role_id "
			+ "left join sys_res r on rr.res_id = r.id "
			+ "where u.id = #{userId}")
	@ResultMap("all_cols")
	List<Resource> getResourceByUser(int userId);
	
	@Select("<script>"
			+ "select r.* from sys_res r where r.res_type = #{resType} and r.pid in "
			+ " <foreach collection='resPids' item='resPid' index='index' open='(' close=')' separator=','> "
			+ "  #{resPid, jdbcType=INTEGER} "
			+ " </foreach>"
			+ "</script>")
	@ResultMap("all_cols")
	List<Resource> getResourceByPids(@Param("resPids") List<String> resPids, @Param("resType") int resType);

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

	@Select("<script>"
			+ "select r.* from sys_res r "
			+ "<where>  "
			+ "	<if test=\"resName != null and resName != ''\"> "
			+ "		res_name like '%${resName}%' "
			+ "	</if> "
			+ "	<if test=\"pid != null and pid > -2\"> "
			+ "		and pid = #{pid} "
			+ "	</if> "
			+ "	<if test=\"mark != null and mark != ''\"> "
			+ "		and mark like '%${mark}%' "
			+ "	</if> "
			+ "	<if test='resType != null'> "
			+ "		and res_type = #{resType} "
			+ "	</if> "
			+ "	<if test=\"createTime != null and createTime != ''\"> "
			+ "		and create_time  &gt;= #{createTime} "
			+ "	</if> "
			+ "	<if test=\"updateTime != null and updateTime != ''\"> "
			+ "		and update_time  &gt;= #{updateTime} "
			+ "	</if> "
			+ "</where> "
			+ "	<if test=\"sortField != null and sortField != '' and sortType != null and sortType != ''\"> "
			+ "		order by ${sortField} ${sortType}"
			+ "	</if> "
			+ "</script>"
			)
	@ResultMap("all_cols")
	Page<Resource> select(ResourceDomain queryRes);
	
	@Update("<script>"
			+ "UPDATE sys_res SET pid = #{pResId}, update_time = now() WHERE id in "
			+ " <foreach collection='resIds' item='resId' index='index' open='(' close=')' separator=','> "
			+ "  #{resId, jdbcType=INTEGER} "
			+ " </foreach>"
			+ "</script>")
	int updateResesPid(@Param("pResId") String pResId, @Param("resIds") List<String> resIds);
}
