package com.yedam.app.consult.view;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yedam.app.common.Paging;
import com.yedam.app.consult.ConsultService;
import com.yedam.app.consult.ConsultVO;

@Controller
public class ConsultController {

	@Autowired 
	ConsultService consultService;
	
	//목록보기
	@RequestMapping("/getConsultList")
	public String getConsultList(Model model, ConsultVO vo, Paging paging) {
	
		//전체 레코드 건수
		paging.setTotalRecord(consultService.getCount(vo));
		//vo의 first, last 셋팅
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());
		//결과저장
		model.addAttribute("consultList",consultService.getConsultList(vo));
		model.addAttribute("paging",paging);	
		return "consult/getConsultList";
		
	}
	//상세보기
	@RequestMapping("/getConsult")
	public String getconsult(Model model, Integer c_no ) {
		ConsultVO vo = new ConsultVO();
		vo.setC_no(c_no);
		model.addAttribute("consult", consultService.getConsult(vo)); 
		return "consult/getConsult";
	}
	
	//수정폼
	@RequestMapping("/updateConsultForm")
	public String updateConsultForm(Model model, ConsultVO vo) {
		model.addAttribute("consult", consultService.getConsult(vo));
		return "consult/updateConsult";
	}
	
	//수정처리
	@RequestMapping("/updateConsult")
	public String updateConsult( ConsultVO vo) { 
		int c_no = vo.getC_no();
		consultService.updateConsult(vo);
		return "redirect:/getConsult?c_no="+c_no;
		}
	
	//삭제처리
	@RequestMapping("/deleteConsult")
	public String deleteConsult( ConsultVO vo) {
		consultService.deleteConsult(vo);
		return "redirect:/getConsultList";
		}
	
	@RequestMapping("/insertConsult")
	public String insertConsult(ConsultVO vo) {
		consultService.insertConsult(vo);
		return "redirect:/getConsultList";
	}
	
	@RequestMapping("/insertConsultForm")
	public String insertConsultForm(ConsultVO vo) {
		return "consult/insertConsult";
	}
	
}
