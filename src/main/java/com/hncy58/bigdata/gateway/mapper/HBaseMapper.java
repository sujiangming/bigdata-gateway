package com.hncy58.bigdata.gateway.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.type.JdbcType;

import com.github.pagehelper.Page;
import com.hncy58.bigdata.gateway.domain.datasync.HBaseAuditDomain;
import com.hncy58.bigdata.gateway.domain.datasync.HBaseConfDomain;
import com.hncy58.bigdata.gateway.model.datasync.HBaseAuditInfo;
import com.hncy58.bigdata.gateway.model.datasync.HBaseConfInfo;

/**
 * 
 * @author tdz
 * @company hncy58 长银五八
 * @website http://www.hncy58.com
 * @version 1.0
 * @date 2018年8月25日 下午4:42:07
 */
public interface HBaseMapper {

	@Select("<script>"
			+ "select * from hbase_tbl_batch_del_audit "
			+ "<where>  "
			+ "	<if test=\"db_name != null and db_name != ''\"> "
			+ "		and db_name = #{db_name} "
			+ "	</if> "
			+ "	<if test=\"table_name != null and table_name != ''\"> "
			+ "		and table_name = #{table_name} "
			+ "	</if> "
			+ "	<if test='status >= 0'> "
			+ "		and status = #{status} "
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
	@Results(id="all_audit_cols", value={
			@Result(column="id", property="id")
			,@Result(column="db_name", property="db_name")
			,@Result(column="table_name", property="table_name")
			,@Result(column="status", property="status")
			,@Result(column="start_time", property="start_time", jdbcType=JdbcType.TIMESTAMP)
			,@Result(column="end_time", property="end_time", jdbcType=JdbcType.TIMESTAMP)
			,@Result(column="del_size", property="del_size")
			,@Result(column="create_time", property="create_time", jdbcType=JdbcType.TIMESTAMP)
			,@Result(column="remark", property="remark")
		})
	Page<HBaseAuditInfo> selectAudit(HBaseAuditDomain queryDomain);
	
	@Select("<script>"
			+ "select * from hbase_tbl_batch_del_cfg "
			+ "<where>  "
			+ "	<if test=\"db_name != null and db_name != ''\"> "
			+ "		and db_name = #{db_name} "
			+ "	</if> "
			+ "	<if test=\"table_name != null and table_name != ''\"> "
			+ "		and table_name = #{table_name} "
			+ "	</if> "
			+ "	<if test='start_days_from_now >= 0'> "
			+ "		and start_days_from_now = #{start_days_from_now} "
			+ "	</if> "
			+ "	<if test='delete_days >= 0'> "
			+ "		and delete_days = #{delete_days} "
			+ "	</if> "
			+ "	<if test='status >= 0'> "
			+ "		and status = #{status} "
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
			,@Result(column="db_name", property="db_name")
			,@Result(column="table_name", property="table_name")
			,@Result(column="start_days_from_now", property="start_days_from_now")
			,@Result(column="delete_days", property="delete_days")
			,@Result(column="status", property="status")
			,@Result(column="remark", property="remark")
			,@Result(column="create_time", property="create_time", jdbcType=JdbcType.TIMESTAMP)
			,@Result(column="update_time", property="update_time", jdbcType=JdbcType.TIMESTAMP)
	})
	Page<HBaseConfInfo> selectConf(HBaseConfDomain queryDomain);

	@Update("update hbase_tbl_batch_del_cfg set db_name=#{db_name}, table_name=#{table_name}, start_days_from_now=#{start_days_from_now}, delete_days=#{delete_days}, status=#{status}, remark=#{remark}, update_time = #{update_time,jdbcType=TIMESTAMP} "
			+ "where id=#{id}")
	int modifyConf(HBaseConfInfo domain);

	@Insert("insert into hbase_tbl_batch_del_cfg values(#{id}, #{db_name}, #{table_name}, #{start_days_from_now}, #{delete_days}, #{status},#{create_time,jdbcType=TIMESTAMP},#{update_time,jdbcType=TIMESTAMP}, #{remark})")
	@Options(useGeneratedKeys = true, keyColumn = "id", keyProperty = "id")
	int addConf(HBaseConfInfo domain);

	@Update("update hbase_tbl_batch_del_cfg set status=9, remark='修改为删除状态', update_time = now() where id=#{id}")
	int deleteConf(String id);
}
