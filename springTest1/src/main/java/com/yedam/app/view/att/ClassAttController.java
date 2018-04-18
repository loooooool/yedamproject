package com.yedam.app.view.att;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		//해당과정의 학생목록
		List<Map<String,Object>> membername = classAttService.getAttList(cl_no);
		//해당과정의 과목 목록
		List<Map<String,Object>> subject = classAttService.getAttSubjectList(cl_no);
		//출석률 퍼센테이지 구하는거
		List<Map<String,Object>> percent = new ArrayList<Map<String,Object>>();
		//최총출석률 \
		List<Map<String,Object>> atttrans= new ArrayList<Map<String,Object>>();
		Map<String,Object> subjecttime;
		//시간 초기화
		for(Map<String,Object> mname : membername) {
			List<Map<String,Object>> attend= classAttService.getAttTimeList((String)mname.get("name"));
			 
			//보낼 출석률 시간 초기화 for문
			for(Map<String,Object> trans : subject) {
				subjecttime= new HashMap<String,Object>();
				
				subjecttime.put("name",mname.get("name"));
				System.out.println("과목명 : "+trans.get("subject"));
				subjecttime.put("subject_no",trans.get("su_no"));
				subjecttime.put("totaltime",0);
				atttrans.add(subjecttime);
				
			}
			System.out.println(atttrans);
			
			//출석률 구하는 for문
			for(Map<String,Object> atten : attend) {
				//
				//&& atttrans.get(i).get("subject_no") == classAttService.getAttSubjectOne((String)atten.get("t_id"))
				if(((BigDecimal)atten.get("attendance")).intValue()==1) {
					Map<String,Object> s_id = classAttService.getAttSubjectOne((String)atten.get("t_id"));
					for(int i=0;i<atttrans.size();i++) {
						
						if(((String)atten.get("name")).equals((String)atttrans.get(i).get("name")) && ((BigDecimal)atttrans.get(i).get("subject_no")).intValue()==((BigDecimal)s_id.get("s_id")).intValue()) {
							int totalt = (Integer)atttrans.get(i).get("totaltime");
							atttrans.get(i).put("totaltime", totalt+1);
						}
					}
					
				}
				
			}
			
			
		}
		
		//출석률 퍼센테이지 구하는 for문
		int cnt=0;
		for(int i=0;i<atttrans.size();i++) {
			Map<String,Object> per = new HashMap<String,Object>();
			int subtime = ((Integer)atttrans.get(i).get("totaltime"));
			int totoalsubtime = ((BigDecimal)subject.get(cnt).get("totaltime")).intValue();
			//일부값 / 전체값 * 100
			System.out.println("s :"+subtime);
			System.out.println("d :"+totoalsubtime);
			double percentage = ((double)subtime/(double)totoalsubtime)*100.0;
			percentage = Math.round(percentage*100d)/100d;
			System.out.println(percentage+"%");
			per.put("percentage", percentage);
			percent.add(per);
			cnt++;
			if(cnt>7) cnt=0;
		}
		
		
		
		System.out.println(atttrans);
		System.out.println(subject);
		
		
		
		
		
		
		model.addAttribute("attList",classAttService.getAttList(cl_no));
		model.addAttribute("attSubjectList",classAttService.getAttSubjectList(cl_no));
		return "att/getAttList";
	}
}
