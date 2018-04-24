package com.yedam.app.scheduler.view;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.app.scheduler.SchedulerService;
import com.yedam.app.scheduler.SchedulerVO;

@Controller
public class SchedulerController {

	@Autowired
	SchedulerService schedulerService;

	// 스케줄러
	@RequestMapping("/getSchedulers")
	public String getSchedulerList(Model model, SchedulerVO vo) {
		return "scheduler/getscheduler";
	}

	//scheduler page 호출
	@RequestMapping("/getSchedulerajax")
	@ResponseBody
	public List<Map<String, Object>> getSchedulerajax(SchedulerVO vo) {
		System.out.println(vo);
		return schedulerService.getSchedulerajax(vo);
	}

	//event,holiday 등록
	@RequestMapping("/insertSchedulerajax")
	@ResponseBody
	public SchedulerVO insertSchedulerajax(@RequestBody SchedulerVO vo) {
		schedulerService.insertSchedulerajax(vo);
		return vo;
	}
	
	//event,holiday 수정
	@RequestMapping("updateSchedulerajax")
	@ResponseBody
	public SchedulerVO updateSchedulerajax(@RequestBody SchedulerVO vo) {
		schedulerService.updateSchedulerajax(vo);
		return vo;
		}
	
	//event,holiday 삭제
	@RequestMapping("deleteSchedulerajax")
	@ResponseBody
	public SchedulerVO deleteSchedulerajax(@RequestBody SchedulerVO vo) {
		schedulerService.deleteSchedulerajax(vo);
		return vo;
		}
	
}
