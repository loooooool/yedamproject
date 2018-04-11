package com.yedam.app.member.view;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import com.yedam.app.common.Paging;
import com.yedam.app.member.MemberService;
import com.yedam.app.member.MemberVO;

@Controller
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping("/getMemberList")
	public String getMemberList(Model model, MemberVO vo, Paging paging) {
		
		model.addAttribute("memberList", memberService.getMemberList(vo));
		return "member/getMemberList";
	}
	
	/*//수정폼
	@RequestMapping("/memberUpdateForm")
	public String memberUpdateForm(Model model, MemberVO vo) {
		model.addAttribute("member", memberService.getMember_id(vo));
		return "member/memberUpdate";
	}*/
	
	// 마이페이지 - [회원정보수정]
	@RequestMapping("/memberUpdate")
	public void memberUpdate(@ModelAttribute MemberVO vo) {
		memberService.memberUpdate(vo);
	}
	
	//비밀번호 찾기(4.10 미완성)
	@RequestMapping(value="/find_pwd_form")
	public String find_pwd_form() throws Exception{
		return "/member/find_pwd_form";
	}
}
