package com.yedam.app.view.subject;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yedam.app.classes.ClassService;
import com.yedam.app.classes.ClassVO;
import com.yedam.app.common.Paging;
import com.yedam.app.consult.ConsultVO;
import com.yedam.app.member.MemberVO;
import com.yedam.app.subject.SubjectService;
import com.yedam.app.subject.SubjectVO;

@Controller
public class SubjectController {

	@Autowired
	SubjectService subjectService;

	@Autowired
	ClassService classService;

	// 목록
	@RequestMapping("/getSubjectList")
	public String getSubjectList(Model model, SubjectVO vo, ClassVO cvo, Paging paging) {
		// 전체 레코드 건수
		paging.setTotalRecord(subjectService.getCount(vo));

		// vo의 first, last setting
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());

		// 결과저장
		model.addAttribute("classList", classService.getClassList(cvo));
		model.addAttribute("SubjectList", subjectService.getSubjectList(vo));
		model.addAttribute("paging", paging);

		return "subject/getSubjectList";
	}

	// 등록폼
	@RequestMapping(value = "insertSubject", method = RequestMethod.GET)
	public String insertSubjectForm(Model model, ClassVO vo) {
		model.addAttribute("ClassList", classService.getClassList(vo));
		return "subject/insertSubject";
	}

	// 등록처리
	@RequestMapping(value = "insertSubject", method = RequestMethod.POST)
	public String insertSubject(SubjectVO vo) {
		subjectService.insertSubject(vo);
		return "redirect:/getSubjectList";
	}

	// 상세보기
	@RequestMapping("/getSubject/{su_no}")
	public ModelAndView getSubject(@PathVariable Integer su_no) {
		SubjectVO vo = new SubjectVO();
		vo.setSu_no(su_no);
		ModelAndView mv = new ModelAndView();
		mv.addObject("su", subjectService.getSubject(vo));
		mv.setViewName("subject/getSubject");
		return mv;
	}

	// 수정폼
	@RequestMapping("/updateSubjectForm")
	public String updateSubjectForm(Model model, SubjectVO vo, ClassVO vo2) {
		model.addAttribute("su", subjectService.getSubject(vo));
		model.addAttribute("ClassList", classService.getClassList(vo2));
		return "subject/updateSubject";
	}

	// 수정처리
	@RequestMapping("/updateSubject")
	public String updateSubject(SubjectVO vo) {
		subjectService.updateSubject(vo);
		return "redirect:/getSubjectList";
	}

	// 삭제
	@RequestMapping("/deleteSubject")
	public String deleteSubject(SubjectVO vo) {
		subjectService.deleteSubject(vo);
		return "redirect:/getSubjectList";
	}
	
	@RequestMapping("/getSubjectListAjax")
	@ResponseBody
	public List<SubjectVO> getSubjectListAjax( SubjectVO vo) {
		return subjectService.getSubjectListAjax(vo);
	}

}
