package com.hncy58.bigdata.gateway.controller.oozie;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hncy58.bigdata.gateway.mapper.OozieMapper;
import com.hncy58.bigdata.gateway.model.OozieTask;

@RestController
@RequestMapping("api/oozie")
public class OozieController {

	@Autowired
	private OozieMapper oozieMapper;
	
	@RequestMapping("/get/{taskName}")
	public int getTaskStatus(@PathVariable("taskName") String taskName) {
		OozieTask task = oozieMapper.selectByTaskName(taskName);
		if(task != null)
			return task.getTask_status();
		return -1;
	}
	
	@RequestMapping("/update/{taskName}")
	public int updateTaskStatus(@PathVariable("taskName") String taskName, int taskStatus) {
		int rows = oozieMapper.updateTaskStatus(taskName, taskStatus);
		return rows;
	}
}
