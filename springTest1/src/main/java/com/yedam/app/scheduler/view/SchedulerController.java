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
	
	// 목록,페이징 처리
	@RequestMapping("/getSchedulerList")
	public String getSchedulerList(Model model, SchedulerVO vo, Paging paging) {
		// 전체 레코드 건수
		paging.setPageUnit(10);
		paging.setTotalRecord(schedulerService.getCount(vo));
		// vo에 first와 last 셋팅
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());
		// 저장
		model.addAttribute("schedulerList", schedulerService.getSchedulerList(vo));
		model.addAttribute("paging", paging);
		return "scheduler/getSchedulerList";
	}
	
	
	//ajax요청
	@RequestMapping("/getSchedulerList.ajax")
	@ResponseBody
	public  List<Map<String,Object>> getSchedulerListajax(SchedulerVO vo) {
		/*Calendar cal = Calendar.getInstance();
		if(vo.getYear() == null || vo.getYear().equals("")) {
			vo.setYear(Integer.toString(cal.get(Calendar.YEAR)));
		}else if(vo.getMonth() == null || vo.getMonth().equals("")) {
			vo.setMonth(Integer.toString(cal.get(Calendar.MONTH)+1));
		}*/
		return schedulerService.getSchedulerListajax(vo);
	}
	
	
	

	// 상세 보기
	@RequestMapping("/getScheduler")
	public String getScheduler(Model model, SchedulerVO vo) {
		model.addAttribute("scheduler", schedulerService.getScheduler(vo));
		return "scheduler/getScheduler";
	}
	

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
