package com.yedam.app.holiday.view;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yedam.app.common.Paging;
import com.yedam.app.holiday.HolidayService;
import com.yedam.app.holiday.HolidayVO;

@Controller
public class HolidayController {

	@Autowired
	HolidayService holidayService;

	//검색 처리
	@ModelAttribute("conditionMapp")
	public Map<String, String> searchConditionMapp(){
		Map<String,String> conditionMapp = new HashMap<String, String>();
		conditionMapp.put("휴일명", "name");
		conditionMapp.put("휴일구분", "type");
		return conditionMapp;
	}
	
	// 목록,페이징 처리
	@RequestMapping("/getHolidayList")
	public String getHolidayList(Model model, HolidayVO vo, Paging paging) {
		// 전체 레코드 건수
		paging.setPageUnit(10);
		paging.setTotalRecord(holidayService.getCount(vo));
		// vo에 first와 last 셋팅
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());
		// 저장
		model.addAttribute("holidayList", holidayService.getHolidayList(vo));
		model.addAttribute("paging", paging);
		return "holiday/getHolidayList";
	}
	

	// 상세 보기
	@RequestMapping("/getHoliday")
	public String getHoliday(Model model, HolidayVO vo) {
		model.addAttribute("holiday", holidayService.getHoliday(vo));
		return "holiday/getHoliday";
	}
	

	// 등록 폼으로 가는 컨트롤러
	@RequestMapping(value = "/insertHoliday", method = RequestMethod.GET)
	public String insertHolidayForm() {
		return "holiday/insertHoliday";
	}

	// 등록처리
	@RequestMapping(value = "/insertHoliday", method = RequestMethod.POST)
	public String insertHoliday(HolidayVO vo,HttpServletRequest request, HttpServletResponse response) throws IllegalStateException, IOException {
		holidayService.insertHoliday(vo);
		return "redirect:/getHolidayList";
	}

	// 수정폼
	@RequestMapping("/updateHolidayForm")
	public String updateHolidayForm(Model model, HolidayVO vo) {
		model.addAttribute("holiday", holidayService.getHoliday(vo));
		return "holiday/updateHoliday";
	}

	// 수정처리
	@RequestMapping(value = "/updateHoliday", method = RequestMethod.POST)
	public String updateClass(HolidayVO vo,HttpServletRequest request, HttpServletResponse response) throws IllegalStateException, IOException {
		holidayService.updateHoliday(vo);
		return "redirect:/getHolidayList";
	}

	// 삭제
	@RequestMapping("/deleteHoliday")
	public String deleteHoliday(HolidayVO vo) {
		holidayService.deleteHoliday(vo);
		return "redirect:/getHolidayList";
	}

}
