package com.yedam.app.view.timetable;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yedam.app.classinfo.ClassInfoService;
import com.yedam.app.member.MemberVO;
import com.yedam.app.timetable.TimeTableService;
import com.yedam.app.timetable.TimeTableVO;

@Controller
public class TimeTableController {

	@Autowired
	TimeTableService timeTableService;

	@Autowired
	ClassInfoService classInfoService;

	@RequestMapping("/getTimeTableList")
	public String myTimeTable(Model model,  TimeTableVO tvo,  HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", "921003-02");/* ((MemberVO)session.getAttribute("memberVO")).getMember_id()*/
		model.addAttribute("courseType", classInfoService.getClassInfo(map));
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
}
