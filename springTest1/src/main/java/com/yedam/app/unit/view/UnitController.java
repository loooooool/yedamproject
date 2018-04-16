package com.yedam.app.unit.view;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yedam.app.classes.ClassService;
import com.yedam.app.classes.ClassVO;
import com.yedam.app.unit.UnitService;
import com.yedam.app.unit.UnitVO;

@Controller
public class UnitController {

	@Autowired
	ClassService classService;

	@Autowired
	UnitService unitService;
	
	@RequestMapping("/insertAttendanceForm")
	public String insertAttendanceForm(Model model, ClassVO cvo) {
		model.addAttribute("classList",classService.getClassListNP(cvo));
		return "attendance/insertAttendance";
	}
	
	@RequestMapping("/insertUnit")
	public String insertUnit(@RequestParam String[] class_no,@RequestParam String[] unit,
							@RequestParam String[] unitdays, @RequestParam String[] sdate,
							@RequestParam String[] edate, HttpServletRequest request ,UnitVO vo){
		
		Map<String,Object> map = new HashMap<String,Object>();
		String[] id= new String[unit.length];
		
		for(int i=0;i<unit.length;i++) {
			map.put("class_no", class_no[i]);
			map.put("unit", unit[i]);
			map.put("unitdays", unitdays[i]);
			map.put("sdate", sdate[i]);
			map.put("edate", edate[i]);
		}
		
		unitService.insertUnit(vo);
		return "attendance/viewAttendance";
	}
	

}
