package com.yedam.app.unit.view;


import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.yedam.app.classes.ClassService;
import com.yedam.app.classes.ClassVO;
import com.yedam.app.unit.UnitInsertVO;
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
	public String insertUnit(UnitInsertVO uvo){
		unitService.insertUnit(uvo);
		return "attendance/viewAttendance";
	}
	
	@RequestMapping("/getUnitList")
	public String getUnitList(Model model,  UnitVO vo, ClassVO cvo ) {
		model.addAttribute("unitList",unitService.getUnitList(vo));
		model.addAttribute("classList",classService.getClassListNP(cvo));
		return "attendance/viewAttendance";
	}
	
	@RequestMapping("/insertExcel")
	public String insertExcel(Model model, UnitVO vo,  HttpServletRequest request, HttpServletResponse response)  throws IOException{
		// 첨부파일이 있는지 확인
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		MultipartFile multipartFile = multipartRequest.getFile("attach_file");

		if (multipartFile != null && multipartFile.getSize() > 0) {
			// 파일을 업로드 위치에 저장
			multipartFile.transferTo(new File("d:/upload", multipartFile.getOriginalFilename()));
			vo.setExcelFile(multipartFile.getOriginalFilename());
		}
	
		return "attendance/viewAttendance";
	}
	

}
