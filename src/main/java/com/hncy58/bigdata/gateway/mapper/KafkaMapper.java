package com.hncy58.bigdata.gateway.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.type.JdbcType;

import com.github.pagehelper.Page;
import com.hncy58.bigdata.gateway.domain.datasync.KafkaConfDomain;
import com.hncy58.bigdata.gateway.domain.datasync.KafkaMonitorDomain;
import com.hncy58.bigdata.gateway.model.datasync.KafkaConfInfo;
import com.hncy58.bigdata.gateway.model.datasync.KafkaMonitorInfo;

/**
 * 
 * @author tdz
 * @company hncy58 长银五八
 * @website http://www.hncy58.com
 * @version 1.0
 * @date 2018年8月25日 下午4:42:07
 */
public interface KafkaMapper {

	@Select("<script>"
			+ "select * from kafka_topic_grp_monitor "
			+ "<where>  "
			+ "	<if test=\"date_id >= 0\"> "
			+ "		and date_id = #{date_id} "
			+ "	</if> "
			+ "	<if test=\"topic_name != null and topic_name != ''\"> "
			+ "		and topic_name = #{topic_name} "
			+ "	</if> "
			+ "	<if test=\"grp_name != null and grp_name != ''\"> "
			+ "		and grp_name = #{grp_name} "
			+ "	</if> "
			+ "	<if test='partition_id >= 0'> "
			+ "		and partition_id = #{partition_id} "
			+ "	</if> "
			+ "	<if test='start_offset >= 0'> "
			+ "		and start_offset = #{start_offset} "
			+ "	</if> "
			+ "	<if test='curr_offset >= 0'> "
			+ "		and curr_offset = #{curr_offset} "
			+ "	</if> "
			+ "	<if test='latest_offset >= 0'> "
			+ "		and latest_offset = #{latest_offset} "
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
	@Results(id="all_monitor_cols", value={
			@Result(column="id", property="id")
			,@Result(column="date_id", property="date_id")
			,@Result(column="topic_name", property="topic_name")
			,@Result(column="partition_id", property="partition_id")
			,@Result(column="grp_name", property="grp_name")
			,@Result(column="start_offset", property="start_offset")
			,@Result(column="curr_offset", property="curr_offset")
			,@Result(column="latest_offset", property="latest_offset")
			,@Result(column="remark", property="remark")
			,@Result(column="create_time", property="create_time", jdbcType=JdbcType.TIMESTAMP)
			,@Result(column="update_time", property="update_time", jdbcType=JdbcType.TIMESTAMP)
		})
	Page<KafkaMonitorInfo> selectMonitor(KafkaMonitorDomain queryDomain);
	
	@Select("<script>"
			+ "select * from kafka_topic_grp_cfg "
			+ "<where>  "
			+ "	<if test=\"topic_name != null and topic_name != ''\"> "
			+ "		and topic_name = #{topic_name} "
			+ "	</if> "
			+ "	<if test=\"grp_name != null and grp_name != ''\"> "
			+ "		and grp_name = #{grp_name} "
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
	@Results(id="all_conf_cols", value={
			@Result(column="id", property="id")
			,@Result(column="topic_name", property="topic_name")
			,@Result(column="grp_name", property="grp_name")
			,@Result(column="status", property="status")
			,@Result(column="remark", property="remark")
			,@Result(column="create_time", property="create_time", jdbcType=JdbcType.TIMESTAMP)
			,@Result(column="update_time", property="update_time", jdbcType=JdbcType.TIMESTAMP)
	})
	Page<KafkaConfInfo> selectConf(KafkaConfDomain queryDomain);

	@Update("update kafka_topic_grp_cfg set topic_name=#{topic_name}, grp_name=#{grp_name}, status=#{status}, remark=#{remark}, update_time = #{update_time,jdbcType=TIMESTAMP} "
			+ "where id=#{id}")
	int modifyConf(KafkaConfInfo domain);

	@Insert("insert into kafka_topic_grp_cfg values(#{id}, #{topic_name}, #{grp_name}, #{status},#{create_time,jdbcType=TIMESTAMP},#{update_time,jdbcType=TIMESTAMP}, #{remark})")
	@Options(useGeneratedKeys = true, keyColumn = "id", keyProperty = "id")
	int addConf(KafkaConfInfo domain);
}
