package com.hncy58.bigdata.gateway.mapper;

import java.sql.Timestamp;
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
import com.hncy58.bigdata.gateway.model.Role;

public interface RoleMapper {

	@Select("select * from sys_role where id=#{id}")
	@Results(id = "cols", value = { @Result(column = "id", property = "id"),
			@Result(column = "role_code", property = "roleCode"), 
			@Result(column = "role_type", property = "roleType"), 
			@Result(column = "role_name", property = "roleName"),
			@Result(column = "mark", property = "mark"),
			@Result(column = "create_time", property = "createTime", jdbcType = JdbcType.TIMESTAMP, javaType = Timestamp.class),
			@Result(column = "update_time", property = "updateTime", jdbcType = JdbcType.TIMESTAMP, javaType = Timestamp.class) })
	Role selectByPrimaryKey(int id);

	@ResultMap(value = "cols")
	@Select("select r.* from sys_role r")
	List<Role> selectAll();
	
	@ResultMap(value = "cols")
	@Select("<script>"
			+ "select r.* from sys_role r "
			+ "<where>  "
			+ "	<if test=\"roleName != null and roleName != ''\"> "
			+ "		role_name = #{roleName} "
			+ "	</if> "
			+ "	<if test=\"roleCode != null and roleCode != ''\"> "
			+ "		and role_code = #{roleCode} "
			+ "	</if> "
			+ "	<if test=\"mark != null and mark != ''\"> "
			+ "		and mark like '%${mark}%' "
			+ "	</if> "
			+ "	<if test='roleType != null'> "
			+ "		and role_type = #{roleType} "
			+ "	</if> "
			+ "	<if test='createTime != null'> "
			+ "		and create_time  &gt;= #{createTime} "
			+ "	</if> "
			+ "	<if test='updateTime != null'> "
			+ "		and update_time  &gt;= #{updateTime} "
			+ "	</if> "
			+ "</where> "
			+ "</script>"
			)
	List<Role> select(Role queryRole);

	@Delete("delete from sys_role where id = #{id}")
	int deleteByPrimaryKey(int id);

	@Insert("insert into sys_role values(#{id}, #{roleCode}, #{roleType}, #{roleName}, #{mark}, now(), now())")
	@Options(useGeneratedKeys = true, keyColumn = "id", keyProperty = "id")
	int insert(Role role);

	@Update("update sys_role set role_code=#{roleCode}, mark=#{mark}, role_type=#{roleType}, role_name=#{roleName}, update_time = now() where id=#{id}")
	int updateByPrimaryKeySelective(Role role);

	@Update("update sys_role set role_code=#{roleCode}, mark=#{mark}, role_type=#{roleType}, role_name=#{roleName}, update_time = now() where id=#{id}")
	int updateByPrimaryKey(Role role);

	@Select("select r.id,r.create_time createTime,r.mark,r.role_code roleCode,r.role_name roleName,r.role_type roleType,r.update_time updateTime"
			+ " from sys_role r left join sys_user_role ur on r.id=ur.role_id where ur.user_id = #{userId}")
	List<Role> getRoleByUserId(String userId);

	@Select("SELECT res.id,res.res_code resCode,res.p_res_code pResCode,res.res_type resType,res.res_name resName"
			+ ",res.res_uri resUri,res.rank,res.mark,res.create_time createTime,res.update_time updateTime "
			+ " FROM sys_role_res rr "
			+ " LEFT JOIN sys_role role ON rr.role_id = role.id "
			+ " LEFT JOIN sys_res res ON rr.res_id = res.id WHERE role.id = #{roleId}")
	List<Resource> getResourceByRole(int roleId);

	@Delete("<script>"
			+ "delete from sys_role_res where role_id = #{roleId} and res_id in "
			+ " <foreach collection='unlinkResIds' item='unlinkResId' index='index' open='(' close=')' separator=','> "
			+ "  #{unlinkResId, jdbcType=INTEGER} "
			+ " </foreach>"
			+ "</script>")
	int unlinkReses(@Param("roleId") String roleId, @Param("unlinkResIds") List<String> unlinkResIds);

	@Insert("<script>"
			+ "insert into sys_role_res(role_id, res_id) values "
			+ " <foreach collection='addResIds' item='addResId' index='index' open='' close='' separator=','>"
			+ "  (#{roleId, jdbcType=INTEGER},#{addResId, jdbcType=INTEGER})"
			+ " </foreach>"
			+ "</script>")
	int linkReses(@Param("roleId") String roleId, @Param("addResIds") List<String> addResIds);

	@Delete("<script>"
			+ "delete from sys_role where id in"
			+ " <foreach collection='ids' item='id' index='index' open='(' close=')' separator=','> "
			+ "  #{id, jdbcType=INTEGER} "
			+ " </foreach>"
			+ "</script>")
	int delete(@Param("ids") List<String> ids);
	
	@Delete("<script>"
			+ "delete from sys_role_res where role_id in "
			+ " <foreach collection='roleIds' item='roleId' index='index' open='(' close=')' separator=','> "
			+ "  #{roleId, jdbcType=INTEGER} "
			+ " </foreach>"
			+ "</script>")
	int unlinkRoleReses(@Param("roleIds") List<String> ids);
	
	@Delete("<script>"
			+ "delete from sys_user_role where role_id in "
			+ " <foreach collection='roleIds' item='roleId' index='index' open='(' close=')' separator=','> "
			+ "  #{roleId, jdbcType=INTEGER} "
			+ " </foreach>"
			+ "</script>")
	int unlinkRoleUsers(@Param("roleIds") List<String> ids);

}
