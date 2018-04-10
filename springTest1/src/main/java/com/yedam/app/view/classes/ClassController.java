package com.yedam.app.view.classes;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.yedam.app.classes.ClassService;
import com.yedam.app.classes.ClassVO;
import com.yedam.app.common.Paging;

@Controller
public class ClassController {

	@Autowired
	ClassService classService;
	
	// 목록
	@RequestMapping("/getClassList")
	public String getClassList(Model model, ClassVO vo, Paging paging) {
		// 전체 레코드 건수
		paging.setTotalRecord(classService.getCount(vo));
		
		// vo의 first, last setting
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());
		
		// 결과저장
		model.addAttribute("classList", classService.getClassList(vo));
		model.addAttribute("paging",paging);
		
		return "class/getClassList";
	}

	// 등록폼
	@RequestMapping(value = "/insertClass", method = RequestMethod.GET)
	public String insertClassForm() {
		return "class/insertClass";
	}

	// 등록처리
	@RequestMapping(value = "/insertClass", method = RequestMethod.POST)
	public String insertClass(ClassVO vo, HttpServletRequest request, HttpServletResponse response) throws IOException {

		// 첨부파일이 있는지 확인
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		MultipartFile multipartFile = multipartRequest.getFile("attach_file");

		if (multipartFile != null && multipartFile.getSize() > 0) {
			// 파일을 업로드 위치에 저장

			multipartFile.transferTo(new File("d:/upload", multipartFile.getOriginalFilename()));
			vo.setTimeTable(multipartFile.getOriginalFilename());
		}
		classService.insertClass(vo);
		return "redirect:/getClassList";
	}
	
	// 상세보기
	@RequestMapping("/getClass/{cl_no}")
	public ModelAndView getClass(@PathVariable Integer cl_no) {
		ClassVO vo = new ClassVO();
		vo.setCl_no(cl_no);
		ModelAndView mv = new ModelAndView();
		mv.addObject("cl", classService.getClass(vo));
		mv.setViewName("class/getClass");
		return mv;
	}

	// 수정폼
	@RequestMapping("/updateClassForm")
	public String updateClassForm(Model model, ClassVO vo) {
		model.addAttribute("cl", classService.getClass(vo));
		return "class/updateClass";
	}

	// 수정처리
	@RequestMapping("/updateClass")
	public String updateClass(ClassVO vo) {
		classService.updateClass(vo);
		return "redirect:/getClassList";
	}

	// 삭제
	@RequestMapping("/deleteClass")
	public String deleteClass(ClassVO vo) {
		classService.deleteClass(vo);
		return "redirect:/getClassList";
	}
}
