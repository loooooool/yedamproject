package com.yedam.app.view.timetable;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yedam.app.classes.ClassService;
import com.yedam.app.classinfo.ClassInfoService;
import com.yedam.app.member.MemberVO;
import com.yedam.app.sampledata.SampleService;
import com.yedam.app.timetable.TimeTableService;
import com.yedam.app.timetable.TimeTableVO;

@Controller
public class TimeTableController {

	@Autowired
	TimeTableService timeTableService;

	@Autowired
	ClassInfoService classInfoService;
	
	@Autowired
	ClassService classService;
	
	@Autowired
	SampleService sampleService;

	@RequestMapping("/getTimeTableList")
	public String myTimeTable(Model model, 	TimeTableVO tvo,  HttpSession session) {
		// 1. 그 학생의 과정정보
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", ((MemberVO)session.getAttribute("memberVO")).getMember_id());
		
		List<Map<String, Object>> list = classInfoService.getClassInfo(map);
		model.addAttribute("courseType", list );
		
		// 2. 해당 과정의 시간표
		tvo.setCl_no(((BigDecimal)list.get(0).get("CL_NO")).intValue());
		model.addAttribute("timeTable", timeTableService.getTimeTableList(tvo));

		return "member/getTimeTableList";
	}

	// 검색 처리
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("날짜", "s_date");
		conditionMap.put("과목", "subject");
		return conditionMap;
	}
	
	
	//재용이가 짠거
	//insert 폼
	@RequestMapping("/insertTimeTableForm")
	public String insertViewTimeTableForm() {
		return "timetable/timetableinsertview";
	}
	//insert 처리
	@RequestMapping("/insertTimeTableView")
	public String insertViewTimeTable() {
		List<Map<String,Object>> list = sampleService.getExcelTimeTable(null);
		Map<String,Object> input;
		
		for(int i=0;i<list.size();i++) {
			
		}
		if(sampleService.checkTimeTable().isEmpty()) {
			System.out.println("데이터가 없습니다.");
			
		}
		
		
		
		return "timetable/timetableinsertview";
	}
	
	
}
