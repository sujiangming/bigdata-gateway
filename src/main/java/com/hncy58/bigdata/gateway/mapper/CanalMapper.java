package com.hncy58.bigdata.gateway.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.type.JdbcType;

import com.github.pagehelper.Page;
import com.hncy58.bigdata.gateway.domain.datasync.CanalConfDomain;
import com.hncy58.bigdata.gateway.domain.datasync.CanalMonitorDomain;
import com.hncy58.bigdata.gateway.model.datasync.CanalConfInfo;
import com.hncy58.bigdata.gateway.model.datasync.CanalMonitorInfo;

/**
 * 
 * @author tdz
 * @company hncy58 长银五八
 * @website http://www.hncy58.com
 * @version 1.0
 * @date 2018年8月25日 下午4:42:07
 */
public interface CanalMapper {

	@Select("<script>"
			+ "select * from canal_extract_tbl_monitor "
			+ "<where>  "
			+ "	<if test=\"canal_id != null and canal_id != ''\"> "
			+ "		and canal_id = #{canal_id} "
			+ "	</if> "
			+ "	<if test=\"db_id != null and db_id != ''\"> "
			+ "		and db_id = #{db_id} "
			+ "	</if> "
			+ "	<if test=\"tbl_id != null and tbl_id != ''\"> "
			+ "		and tbl_id = #{tbl_id} "
			+ "	</if> "
			+ "	<if test='date_id >= 0'> "
			+ "		and date_id = #{date_id} "
			+ "	</if> "
			+ "	<if test=\"remark != null and remark != ''\"> "
			+ "		and remark like '%${remark}%' "
			+ "	</if> "
			+ "<choose>"
			+ "	<when test=\"start_time != null and end_time != null\"> "
			+ "		and update_time  between #{start_time} and #{end_time} "
			+ "	</when> "
			+ "	<when test=\"start_time != null\"> "
			+ "		and create_time  &gt;= #{start_time} "
			+ "	</when> "
			+ "	<when test=\"end_time != null\"> "
			+ "		and create_time  &lt;= #{end_time} "
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
			,@Result(column="canal_id", property="canal_id")
			,@Result(column="db_id", property="db_id")
			,@Result(column="tbl_id", property="tbl_id")
			,@Result(column="start_time", property="start_time", jdbcType=JdbcType.TIMESTAMP)
			,@Result(column="start_bin_file", property="start_bin_file")
			,@Result(column="start_offset", property="start_offset")
			,@Result(column="remark", property="remark")
			,@Result(column="create_time", property="create_time", jdbcType=JdbcType.TIMESTAMP)
			,@Result(column="update_time", property="update_time", jdbcType=JdbcType.TIMESTAMP)
			,@Result(column="cur_time", property="cur_time", jdbcType=JdbcType.TIMESTAMP)
			,@Result(column="cur_bin_file", property="cur_bin_file")
			,@Result(column="cur_offset", property="cur_offset")
		})
	Page<CanalMonitorInfo> selectMonitor(CanalMonitorDomain queryDomain);
	

	@Select("<script>"
			+ "select * from canal_extract_tbl_cfg "
			+ "<where>  "
			+ "	<if test=\"server_grp != null and server_grp != ''\"> "
			+ "		and server_grp = #{server_grp} "
			+ "	</if> "
			+ "	<if test=\"canal_id != null and canal_id != ''\"> "
			+ "		and canal_id = #{canal_id} "
			+ "	</if> "
			+ "	<if test=\"db_id != null and db_id != ''\"> "
			+ "		and db_id = #{db_id} "
			+ "	</if> "
			+ "	<if test=\"tbl_id != null and tbl_id != ''\"> "
			+ "		and tbl_id = #{tbl_id} "
			+ "	</if> "
			+ "	<if test='status >= 0'> "
			+ "		and status = #{status} "
			+ "	</if> "
			+ "	<if test='node_id >= 0'> "
			+ "		and node_id = #{node_id} "
			+ "	</if> "
			+ "	<if test=\"remark != null and remark != ''\"> "
			+ "		and remark like '%${remark}%' "
			+ "	</if> "
			+ "<choose>"
			+ "	<when test=\"start_time != null and end_time != null\"> "
			+ "		and update_time  between #{start_time} and #{end_time} "
			+ "	</when> "
			+ "	<when test=\"start_time != null\"> "
			+ "		and update_time  &gt;= #{start_time} "
			+ "	</when> "
			+ "	<when test=\"end_time != null\"> "
			+ "		and update_time  &lt;= #{end_time} "
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
			,@Result(column="server_grp", property="server_grp")
			,@Result(column="canal_id", property="canal_id")
			,@Result(column="db_id", property="db_id")
			,@Result(column="tbl_id", property="tbl_id")
			,@Result(column="node_id", property="node_id")
			,@Result(column="status", property="status")
			,@Result(column="remark", property="remark")
			,@Result(column="create_time", property="create_time", jdbcType=JdbcType.TIMESTAMP)
			,@Result(column="update_time", property="update_time", jdbcType=JdbcType.TIMESTAMP)
	})
	Page<CanalConfInfo> selectConf(CanalConfDomain queryDomain);

	@Update("update canal_extract_tbl_cfg set db_id=#{db_id}, tbl_id=#{tbl_id}, server_grp=#{server_grp}, canal_id=#{canal_id}, node_id=#{node_id}, status=#{status}, remark=#{remark}, update_time = #{update_time,jdbcType=TIMESTAMP} "
			+ "where id=#{id}")
	int modifyConf(CanalConfInfo domain);

	@Insert("insert into canal_extract_tbl_cfg(id,db_id,tbl_id,server_grp,canal_id,node_id,status,create_time,update_time,remark) "
			+ "values(#{id}, #{db_id}, #{tbl_id}, #{server_grp}, #{canal_id}, #{node_id}, #{status},#{create_time,jdbcType=TIMESTAMP},#{update_time,jdbcType=TIMESTAMP}, #{remark})")
	@Options(useGeneratedKeys = true, keyColumn = "id", keyProperty = "id")
	int addConf(CanalConfInfo domain);

	@Update("update canal_extract_tbl_cfg set status=9, remark='修改为删除状态', update_time = now() where id=#{id}")
	int deleteConf(String id);
}
