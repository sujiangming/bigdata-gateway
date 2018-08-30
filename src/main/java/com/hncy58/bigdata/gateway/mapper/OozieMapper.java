package com.hncy58.bigdata.gateway.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.hncy58.bigdata.gateway.model.OozieTask;

public interface OozieMapper {

	@Select("select * from oozie_task where id=#{id}")
	OozieTask selectByPrimaryKey(int id);
	
	@Select("select * from oozie_task where task_name=#{taskName}")
	OozieTask selectByTaskName(String taskName);

	@Select("select * from oozie_task ")
	List<OozieTask> selectAll();
	
	@Select("<script>"
			+ "select * from oozie_task "
			+ "<where>  "
			+ "	<if test=\"task_name != null and task_name != ''\"> "
			+ "		and task_name = #{task_name} "
			+ "	</if> "
			+ "	<if test=\"mark != null and mark != ''\"> "
			+ "		and mark like '%${mark}%' "
			+ "	</if> "
			+ "	<if test='task_status != null and task_status > -1 '> "
			+ "		and task_status = #{task_status} "
			+ "	</if> "
			+ "</where> "
			+ "</script>"
			)
	List<OozieTask> select(OozieTask task);

	@Update("update oozie_task set task_status = #{taskStatus}, update_time = now() where task_name = #{taskName} ")
	int updateTaskStatus(@Param("taskName") String taskName, @Param("taskStatus") int taskStatus);
}
