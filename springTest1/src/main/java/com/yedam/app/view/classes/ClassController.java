package com.yedam.app.view.classes;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.yedam.app.classes.ClassService;
import com.yedam.app.classes.ClassVO;

@Controller
@SessionAttributes("class")
public class ClassController {

	@Autowired
	ClassService classService;

	// 목록
	@RequestMapping("getClassList")
	public String getClassList(Model model, ClassVO vo) {
		model.addAttribute("classList", classService.getClassList(vo));
		return "class/getClassList";
	}

	// 등록폼
	@RequestMapping(value = "insertClass", method = RequestMethod.GET)
	public String insertClassForm() {
		return "class/insertClass";
	}

	// 등록처리
	@RequestMapping(value = "insertClass", method = RequestMethod.POST)
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

	// 수정폼
	@RequestMapping("updateClassForm")
	public String updateClassForm(Model model, ClassVO vo) {
		model.addAttribute("class", classService.getClassList(vo));
		return "class/updateClass";
	}

	// 수정처리
	@RequestMapping("updateClass")
	public String updateClass(ClassVO vo, SessionStatus sessionStatus) {
		classService.updateClass(vo);
		sessionStatus.setComplete();
		return "redirect:/getClassList";
	}

	// 삭제
	@RequestMapping("deleteClass")
	public String deleteClass(ClassVO vo) {
		classService.deleteClass(vo);
		return "redirect:/getClassList";
	}

	// 단건 삭제 처리
	@RequestMapping("deleteClassList")
	private String deleteClassList(@RequestParam ArrayList<String> cl_no) {
		classService.deleteClassList(cl_no);
		return "redirect:/getClassList";

	}
}
