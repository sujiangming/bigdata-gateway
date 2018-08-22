package com.hncy58.bigdata.gateway.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;

import com.hncy58.bigdata.gateway.model.AuditInfo;

public interface AuditMapper {

	@Insert("INSERT INTO sys_user_opr_log (id, token, req_url, query_str, rmt_ip_addr, local_ip_addr, req_method, opr_time, mark) "
			+ " VALUES (#{id}, #{token}, #{reqUrl}, #{queryStr}, #{rmtIpAddr}, #{localIpAddr}, #{reqMethod}, #{oprTime,jdbcType=TIMESTAMP}, #{mark})")
	@Options(useGeneratedKeys = true, keyColumn = "id", keyProperty = "id")
	int save(AuditInfo audit);

}
