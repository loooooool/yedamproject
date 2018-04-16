package com.yedam.app.member.view;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.yedam.app.classes.ClassService;
import com.yedam.app.classes.ClassVO;
import com.yedam.app.classinfo.ClassInfoService;
import com.yedam.app.code.impl.CodeDAO;
import com.yedam.app.common.Paging;
import com.yedam.app.member.MemberService;
import com.yedam.app.member.MemberVO;

@Controller
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	ClassService classService;
	
	@Autowired
	ClassInfoService classInfoService;
	
	
	
	@RequestMapping("/getMemberList")
	public String getBoardList(Model model, MemberVO vo, Paging paging) {
		
		model.addAttribute("memberList", memberService.getMemberList(vo));
		return "member/getMemberList";
	}
	
	//수정폼
	@RequestMapping("/memberUpdateForm")
	public String memberUpdateForm(MemberVO vo) {
		return "member/memberUpdate";
	}
	
	//수정처리
	@RequestMapping(value="/memberUpdate", method=RequestMethod.POST)
	public void memberUpdate(MemberVO vo) {
		memberService.memberUpdate(vo);
	}
	
	
	
	
	//비밀번호 찾기(4.10 미완성)
	@RequestMapping(value="/find_pwd_form")
	public String find_pwd_form() throws Exception{
		return "/member/find_pwd_form";
	}
	
	
	

}
