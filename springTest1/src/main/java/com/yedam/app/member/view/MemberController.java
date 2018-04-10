package com.yedam.app.member.view;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import com.yedam.app.common.Paging;
import com.yedam.app.member.MemberVO;
import com.yedam.app.member.impl.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping("/getMemberList")
	public String getBoardList(Model model, MemberVO vo, Paging paging) {
		
		model.addAttribute("memberList", memberService.getMemberList(vo));
		return "member/getMemberList";
	}
	
	@RequestMapping(value="/find_pwd_form")
	public String find_pwd_form() throws Exception{
		return "/member/find_pwd_form";
	}
	
	
	
	

}
