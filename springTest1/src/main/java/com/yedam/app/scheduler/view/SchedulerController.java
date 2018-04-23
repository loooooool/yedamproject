package com.yedam.app.scheduler.view;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.app.common.Paging;
import com.yedam.app.scheduler.SchedulerService;
import com.yedam.app.scheduler.SchedulerVO;

@Controller
public class SchedulerController {

	@Autowired
	SchedulerService schedulerService;

	//검색 처리
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap(){
		Map<String,String> conditionMap = new HashMap<String, String>();
		conditionMap.put("휴일명", "name");
		conditionMap.put("휴일구분", "type");
		return conditionMap;
	}
	
	// 스케줄러
	@RequestMapping("/Scheduler")
	public String getSchedulerList(Model model, SchedulerVO vo) {
		return "scheduler/scheduler";
	}
	
	
	//ajaxlist
	@RequestMapping("/getSchedulerList.ajax")
	@ResponseBody
	public  List<Map<String,Object>> getSchedulerListajax(SchedulerVO vo) {
		return schedulerService.getSchedulerListajax(vo);
	}
	
	//ajaxinsert
		@RequestMapping("/insertScheduler.ajax")
		@ResponseBody
		public SchedulerVO insertSchedulerajax(SchedulerVO vo) {
			/*System.out.println("호호호홓"+vo);*/
			schedulerService.insertSchedulerajax(vo);
			return vo;
		}
		
	
	

/*	// 상세 보기
	@RequestMapping("/getScheduler")
	public String getScheduler(Model model, SchedulerVO vo) {
		model.addAttribute("scheduler", schedulerService.getScheduler(vo));
		return "scheduler/getScheduler";
	}*/
	

	// 등록 폼으로 가는 컨트롤러
	@RequestMapping(value = "/insertScheduler", method = RequestMethod.GET)
	public String insertSchedulerForm() {
		return "scheduler/insertScheduler";
	}

	// 등록처리
	@RequestMapping(value = "/insertScheduler", method = RequestMethod.POST)
	public String insertScheduler(SchedulerVO vo,HttpServletRequest request, HttpServletResponse response) throws IllegalStateException, IOException {
		schedulerService.insertScheduler(vo);
		return "redirect:/getSchedulerList";
	}

	// 수정폼
	@RequestMapping("/updateSchedulerForm")
	public String updateSchedulerForm(Model model, SchedulerVO vo) {
		model.addAttribute("scheduler", schedulerService.getScheduler(vo));
		return "scheduler/updateScheduler";
	}

	// 수정처리
	@RequestMapping(value = "/updateScheduler", method = RequestMethod.POST)
	public String updateClass(SchedulerVO vo,HttpServletRequest request, HttpServletResponse response) throws IllegalStateException, IOException {
		schedulerService.updateScheduler(vo);
		return "redirect:/getSchedulerList";
	}

	// 삭제
	@RequestMapping("/deleteScheduler")
	public String deleteScheduler(SchedulerVO vo) {
		schedulerService.deleteScheduler(vo);
		return "redirect:/getSchedulerList";
	}
	
	
}
