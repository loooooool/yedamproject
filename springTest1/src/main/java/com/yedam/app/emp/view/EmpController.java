package com.yedam.app.emp.view;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yedam.app.common.Paging;
import com.yedam.app.emp.EmpService;
import com.yedam.app.emp.EmployeeVO;

@Controller
public class EmpController {
	
	@Autowired
	EmpService empService;
	
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap(){
		Map<String,String> conditionMap = new HashMap<String, String>();
		conditionMap.put("이름", "last_name");
		conditionMap.put("연봉", "salary");
		return conditionMap;
	}

	@RequestMapping("/getEmpList")
	public String getEmpList(Model model, EmployeeVO vo, Paging paging){
	
		paging.setTotalRecord(empService.getCount(vo));
		
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());
		
		model.addAttribute("empList",empService.getEmpList(vo));
		model.addAttribute("paging",paging);	
		
		return "emp/getEmpList";
		
	}
	

	
}
