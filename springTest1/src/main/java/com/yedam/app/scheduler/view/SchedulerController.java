package com.yedam.app.scheduler.view;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.app.common.CustomDateEditor2;
import com.yedam.app.scheduler.SchedulerService;
import com.yedam.app.scheduler.SchedulerVO;

@Controller
public class SchedulerController {

	@Autowired
	SchedulerService schedulerService;

	// 스케줄러
	@RequestMapping("/Scheduler")
	public String getSchedulerList(Model model, SchedulerVO vo) {
		return "scheduler/scheduler";
	}

	//scheduler page 호출
	@RequestMapping("/getSchedulerajax")
	@ResponseBody
	public List<Map<String, Object>> getSchedulerajax(SchedulerVO vo) {
		return schedulerService.getSchedulerajax(vo);
	}

	//event,holiday 등록
	@RequestMapping("/insertSchedulerajax")
	@ResponseBody
	public SchedulerVO insertSchedulerajax(@RequestBody SchedulerVO vo) {
		schedulerService.insertSchedulerajax(vo);
		return vo;
	}
	
	//event,holiday 등록
		@RequestMapping("updateSchedulerajax")
		@ResponseBody
		public SchedulerVO updateSchedulerajax(@RequestBody SchedulerVO vo) {
			schedulerService.updateSchedulerajax(vo);
			return vo;
		}

	/*@InitBinder
	public void initBinder(WebDataBinder binder) {
		System.out.println("sdfsd==========================");
		DateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor2(formatter, true));
	}*/

}
