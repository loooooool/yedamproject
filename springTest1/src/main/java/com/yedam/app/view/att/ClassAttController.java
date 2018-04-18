package com.yedam.app.view.att;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yedam.app.att.ClassAttService;
import com.yedam.app.classes.ClassService;
import com.yedam.app.classes.ClassVO;

@Controller
public class ClassAttController {

	
	@Autowired
	ClassService classService;
	
	@Autowired
	ClassAttService classAttService;
	
	
	
	@RequestMapping("/getClassAtt")
	public String getClassAttList(Model model, ClassVO vo) {
		
		model.addAttribute("classAttList",classService.getClassAttList(vo));
		return "att/getClassAtt";
	}
	
	
	@RequestMapping("/getAttList")
	public String getClassAtt(Model model, Integer cl_no) {
		
		model.addAttribute("attList",classAttService.getAttList(cl_no));
		model.addAttribute("attSubjectList",classAttService.getAttSubjectList(cl_no));
		return "att/getAttList";
	}
}
