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
import org.springframework.web.bind.annotation.RequestParam;

import com.yedam.app.classes.ClassService;
import com.yedam.app.classes.ClassVO;
import com.yedam.app.classinfo.ClassInfoService;
import com.yedam.app.member.MemberVO;
import com.yedam.app.sampledata.SampleService;
import com.yedam.app.subject_timetable.SubjectTimeService;
import com.yedam.app.subject_timetable.SubjectTimeVO;
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
	
	@Autowired
	SubjectTimeService subjectTimeService;

	// 마이페이지 - 나의 시간표
	@RequestMapping("/getTimeTableList")
	public String myTimeTable(Model model, TimeTableVO tvo, HttpSession session) {
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
	
	// 과정별 시간표 보기
	@RequestMapping("/getClassTimeTable")
	public String getClassTimeTable(Model model, TimeTableVO tvo, HttpSession session) {
		
		model.addAttribute("timeTable", timeTableService.getClassTimeTable(tvo));
		return "class/getClassTimeTable";
	}
	
	
	
	
	//재용이가 짠거
	//insert 폼
	@RequestMapping("/insertTimeTableForm")
	public String insertViewTimeTableForm(Model model) {
		//List<ClassVO> list = ;
		model.addAttribute("classList", classService.getClassList2(null));
		return "timetable/timetableinsertview";
	}
	//insert 처리
	@RequestMapping("/insertTimeTableView")
	public String insertViewTimeTable(Model model, @RequestParam int sub_no) {
		/*List<Map<String,Object>> list = sampleService.getExcelTimeTable(null);
		Map<String,Object> input=null;
		Map<String,Object> value=null;
		
		for(int i=0;i<list.size();i++) {
			System.out.println("일자1 : "+list.get(i).get("day"));
			System.out.println("시간 1: "+list.get(i).get("time").toString().replaceAll(":", ""));
			System.out.println("과목 1: "+list.get(i).get("subject"));
			System.out.println("코드값 : "+sub_no);
			input = new HashMap<String,Object>();
			value = new HashMap<String,Object>();
			input.put("subject",list.get(i).get("subject"));
			input.put("cl_no",sub_no );
			
			String code_no= (String)sampleService.convertCode(list.get(i).get("time").toString().replaceAll(":", "")).get("code_no");
			BigDecimal su_no = (BigDecimal)(sampleService.convertSubject(input).get("su_no"));
			System.out.println(sampleService.getRowNum());
			System.out.println("코드 : "+code_no);
			System.out.println("코드2 : "+su_no);
			System.out.println("max : "+(((BigDecimal)(sampleService.getRowNum().get("rn"))).intValue()+1));
			if(sampleService.checkTimeTable().isEmpty()) {
				value.put("t_id", "s1");
				value.put("s_date", list.get(i).get("day"));
				value.put("classtime_cd", code_no);
				value.put("subject", su_no);
				value.put("temp", 1);
				sampleService.insertTimeTableAtt(value);
			}else {
				value.put("t_id", "s"+(((BigDecimal)(sampleService.getRowNum().get("rn"))).intValue()+1));
				value.put("s_date", list.get(i).get("day"));
				value.put("classtime_cd", code_no);
				value.put("subject", su_no);
				value.put("temp", (((BigDecimal)(sampleService.getRowNum().get("rn"))).intValue()+1));
				sampleService.insertTimeTableAtt(value);
			}
		}*/
		
		sampleService.insertViewTimeTable(model,sub_no);
		model.addAttribute("classList", classService.getClassList2(null));
		
		return "timetable/timetableinsertview";
	}
	
	
}
