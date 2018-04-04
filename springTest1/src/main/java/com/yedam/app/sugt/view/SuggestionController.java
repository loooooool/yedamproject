package com.yedam.app.sugt.view;

import java.util.ArrayList;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.yedam.app.common.Paging;
import com.yedam.app.sugt.SuggestionService;
import com.yedam.app.sugt.SugtVO;

@Controller
public class SuggestionController {

	@Autowired
	SuggestionService sugtService;
	
	//목록보기
	@RequestMapping("/getSugtList")
	public String getSugtList(Model model, SugtVO vo, Paging paging) {
	
			//전체 레코드 건수
			paging.setTotalRecord(sugtService.getCount(vo));
			
			//vo의 first, last 셋팅
			vo.setFirst(paging.getFirst());
			vo.setLast(paging.getLast());
			//결과저장
			model.addAttribute("sugtList",sugtService.getSugtList(vo));
			model.addAttribute("paging",paging);	
			
			return "sugt/getSugtList";
			
		}
	//상세보기
	@RequestMapping("/getSugt")
	public String getsugt(Model model, Integer s_no ) {
		
		SugtVO vo = new SugtVO();
		vo.setS_no(s_no);
		
		model.addAttribute("sugt", sugtService.getSugt(vo)); 
		
		return "sugt/getSugt";
	}
	
	//수정폼
	@RequestMapping("/updateSugtForm")
	public String updateSugtForm(Model model, SugtVO vo) {
		model.addAttribute("sugt", sugtService.getSugt(vo));
		return "sugt/updateSugt";
	}
	
	//수정처리
	@RequestMapping("/updateSugt")
	public String updateSugt( SugtVO vo) { 
		int s_no = vo.getS_no();
		sugtService.updateSugt(vo);
		return "redirect:/getSugt?id="+s_no;
		}
	
	//삭제처리
	@RequestMapping("/deleteSugt")
	public String deleteSugt( SugtVO vo) {
		sugtService.deleteSugt(vo);
		return "redirect:/getSugtList";
		}
	

	
}
