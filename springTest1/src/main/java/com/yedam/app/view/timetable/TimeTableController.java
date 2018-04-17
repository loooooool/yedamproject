package com.yedam.app.view.timetable;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yedam.app.classinfo.ClassInfoService;
import com.yedam.app.common.Paging;
import com.yedam.app.subject.SubjectVO;
import com.yedam.app.timetable.TimeTableService;
import com.yedam.app.timetable.TimeTableVO;

@Controller
public class TimeTableController {

	@Autowired
	TimeTableService timeTableService;

	@Autowired
	ClassInfoService classInfoService;

	@RequestMapping("/getTimeTableList")
	public String myTimeTable(Model model, Paging paging, Map<String, Object> cvo, TimeTableVO tvo) {
		paging.setTotalRecord(timeTableService.getCount(tvo));
		
		tvo.setFirst(paging.getFirst());
		tvo.setLast(paging.getLast());
		
		model.addAttribute("getCode");
		model.addAttribute("timeTable", timeTableService.getTimeTableList(tvo));
		model.addAttribute("paging", paging);
		
		return "member/getTimeTableList";
	}
}
