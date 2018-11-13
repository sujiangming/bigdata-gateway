package com.hncy58.bigdata.gateway.mapper;

import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.type.JdbcType;

import com.github.pagehelper.Page;
import com.hncy58.bigdata.gateway.domain.datasync.AgentAlarmDomain;
import com.hncy58.bigdata.gateway.domain.datasync.AgentDomain;
import com.hncy58.bigdata.gateway.model.datasync.AgentAlarmInfo;
import com.hncy58.bigdata.gateway.model.datasync.AgentInfo;

/**
 * 
 * @author tdz
 * @company hncy58 长银五八
 * @website http://www.hncy58.com
 * @version 1.0
 * @date 2018年8月25日 下午4:42:07
 */
public interface AgentMapper {

	/**
	 * 根据过滤条件查询
	 * @param queryAudit
	 * @return
	 */
	@Select("<script>"
			+ "select * from agent_svr_info "
			+ "<where>  "
			+ "	<if test=\"svr_name != null and svr_name != ''\"> "
			+ "		and svr_name = #{svr_name} "
			+ "	</if> "
			+ "	<if test=\"svr_group != null and svr_group != ''\"> "
			+ "		and svr_group = #{svr_group} "
			+ "	</if> "
			+ "	<if test='svr_type >= 0'> "
			+ "		and svr_type = #{svr_type} "
			+ "	</if> "
			+ "	<if test='source_type >= 0'> "
			+ "		and source_type = #{source_type} "
			+ "	</if> "
			+ "	<if test='dest_type >= 0'> "
			+ "		and dest_type = #{dest_type} "
			+ "	</if> "
			+ "	<if test='status >= 0'> "
			+ "		and status = #{status} "
			+ "	</if> "
			+ "	<if test='heartbeat_interval >= 0'> "
			+ "		and heartbeat_interval = #{heartbeat_interval} "
			+ "	</if> "
			+ "	<if test='max_heartbeat_fail_cnt >= 0'> "
			+ "		and max_heartbeat_fail_cnt = #{max_heartbeat_fail_cnt} "
			+ "	</if> "
			+ "	<if test=\"remark != null and remark != ''\"> "
			+ "		and remark like '%${remark}%' "
			+ "	</if> "
			+ "<choose>"
			+ "	<when test=\"startTime != null and endTime != null\"> "
			+ "		and update_time  between #{startTime} and #{endTime} "
			+ "	</when> "
			+ "	<when test=\"startTime != null\"> "
			+ "		and update_time  &gt;= #{startTime} "
			+ "	</when> "
			+ "	<when test=\"endTime != null\"> "
			+ "		and update_time  &lt;= #{endTime} "
			+ "	</when> "
			+ "</choose>"
			+ "</where> "
			+ "	<if test=\"sortField != null and sortField != '' and sortType != null and sortType != ''\"> "
			+ "		order by ${sortField} ${sortType}"
			+ "	</if> "
			+ "</script>"
			)
	@Results(id="all_cols", value={
			@Result(column="id", property="id")
			,@Result(column="svr_name", property="svr_name")
			,@Result(column="svr_group", property="svr_group")
			,@Result(column="svr_type", property="svr_type")
			,@Result(column="source_type", property="source_type")
			,@Result(column="dest_type", property="dest_type")
			,@Result(column="status", property="status")
			,@Result(column="heartbeat_interval", property="heartbeat_interval")
			,@Result(column="max_heartbeat_fail_cnt", property="max_heartbeat_fail_cnt")
			,@Result(column="remark", property="remark")
			,@Result(column="create_time", property="create_time", jdbcType=JdbcType.TIMESTAMP)
			,@Result(column="update_time", property="update_time", jdbcType=JdbcType.TIMESTAMP)
		})
	Page<AgentInfo> select(AgentDomain queryDomain);


	@Select("<script>"
			+ "select * from agent_svr_alarm "
			+ "<where>  "
			+ "	<if test=\"svr_name != null and svr_name != ''\"> "
			+ "		and svr_name = #{svr_name} "
			+ "	</if> "
			+ "	<if test=\"svr_group != null and svr_group != ''\"> "
			+ "		and svr_group = #{svr_group} "
			+ "	</if> "
			+ "	<if test='svr_type >= 0'> "
			+ "		and svr_type = #{svr_type} "
			+ "	</if> "
			+ "	<if test='alarm_type >= 0'> "
			+ "		and alarm_type = #{alarm_type} "
			+ "	</if> "
			+ "	<if test='alarm_level >= 0'> "
			+ "		and alarm_level = #{alarm_level} "
			+ "	</if> "
			+ "	<if test='status >= 0'> "
			+ "		and status = #{status} "
			+ "	</if> "
			+ "	<if test=\"remark != null and remark != ''\"> "
			+ "		and remark like '%${remark}%' "
			+ "	</if> "
			+ "<choose>"
			+ "	<when test=\"startTime != null and endTime != null\"> "
			+ "		and update_time  between #{startTime} and #{endTime} "
			+ "	</when> "
			+ "	<when test=\"startTime != null\"> "
			+ "		and update_time  &gt;= #{startTime} "
			+ "	</when> "
			+ "	<when test=\"endTime != null\"> "
			+ "		and update_time  &lt;= #{endTime} "
			+ "	</when> "
			+ "</choose>"
			+ "</where> "
			+ "	<if test=\"sortField != null and sortField != '' and sortType != null and sortType != ''\"> "
			+ "		order by ${sortField} ${sortType}"
			+ "	</if> "
			+ "</script>"
			)
	@Results(id="all_alarm_cols", value={
			@Result(column="id", property="id")
			,@Result(column="svr_name", property="svr_name")
			,@Result(column="svr_group", property="svr_group")
			,@Result(column="svr_type", property="svr_type")
			,@Result(column="alarm_type", property="alarm_type")
			,@Result(column="alarm_level", property="alarm_level")
			,@Result(column="status", property="status")
			,@Result(column="remark", property="remark")
			,@Result(column="create_time", property="create_time", jdbcType=JdbcType.TIMESTAMP)
			,@Result(column="update_time", property="update_time", jdbcType=JdbcType.TIMESTAMP)
		})
	Page<AgentAlarmInfo> selectAlarm(AgentAlarmDomain domain);

}
