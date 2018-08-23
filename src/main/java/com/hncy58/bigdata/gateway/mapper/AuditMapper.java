package com.hncy58.bigdata.gateway.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.type.JdbcType;

import com.github.pagehelper.Page;
import com.hncy58.bigdata.gateway.domain.AuditDomain;
import com.hncy58.bigdata.gateway.model.AuditInfo;

public interface AuditMapper {

	@Insert("INSERT INTO sys_user_opr_log (id, user_id, token, req_url, query_str, rmt_ip_addr, local_ip_addr, req_method, opr_time, mark) "
			+ " VALUES (#{id}, #{userId}, #{token}, #{reqUrl}, #{queryStr}, #{rmtIpAddr}, #{localIpAddr}, #{reqMethod}, #{oprTime,jdbcType=TIMESTAMP}, #{mark})")
	@Options(useGeneratedKeys = true, keyColumn = "id", keyProperty = "id")
	int save(AuditInfo audit);
	
	@Select("<script>"
			+ "select r.*, u.user_code, u.user_name from sys_user_opr_log r left join sys_user u on r.user_id = u.id "
			+ "<where>  "
			+ "	<if test='userName != null'> "
			+ "		and u.user_Name = #{userName} "
			+ "	</if> "
			+ "	<if test='userCode != null'> "
			+ "		and user_code = #{userCode} "
			+ "	</if> "
			+ "	<if test='reqMethod != null'> "
			+ "		and req_method = #{reqMethod} "
			+ "	</if> "
			+ "	<if test=\"rmtIpAddr != null and rmtIpAddr != ''\"> "
			+ "		and rmt_ip_addr like '%${rmtIpAddr}%' "
			+ "	</if> "
			+ "	<if test=\"localIpAddr != null and localIpAddr != ''\"> "
			+ "		and local_ip_addr like '%${localIpAddr}%' "
			+ "	</if> "
			+ "	<if test=\"oprTime != null\"> "
			+ "		and opr_time  &gt;= #{oprTime} "
			+ "	</if> "
			+ "	<if test=\"token != null and token != ''\"> "
			+ "		and token like '%${token}%' "
			+ "	</if> "
			+ "	<if test=\"reqUrl != null and reqUrl != ''\"> "
			+ "		and req_url like '%${reqUrl}%' "
			+ "	</if> "
			+ "	<if test=\"queryStr != null and queryStr != ''\"> "
			+ "		and query_str like '%${queryStr}%' "
			+ "	</if> "
			+ "	<if test=\"mark != null and mark != ''\"> "
			+ "		and mark like '%${mark}%' "
			+ "	</if> "
			+ "</where> "
			+ "	<if test=\"sortField != null and sortField != '' and sortType != null and sortType != ''\"> "
			+ "		order by ${sortField} ${sortType}"
			+ "	</if> "
			+ "</script>"
			)
	@Results(id="all_cols", value={
			@Result(column="id", property="id")
			,@Result(column="user_id", property="userId")
			,@Result(column="user_name", property="userName")
			,@Result(column="user_code", property="userCode")
			,@Result(column="token", property="token")
			,@Result(column="req_url", property="reqUrl")
			,@Result(column="query_str", property="queryStr")
			,@Result(column="rmt_ip_addr", property="rmtIpAddr")
			,@Result(column="local_ip_addr", property="localIpAddr")
			,@Result(column="req_method", property="reqMethod")
			,@Result(column="mark", property="mark")
			,@Result(column="opr_time", property="oprTime", jdbcType=JdbcType.TIMESTAMP)
		})
	Page<AuditInfo> select(AuditDomain queryAudit);

}
