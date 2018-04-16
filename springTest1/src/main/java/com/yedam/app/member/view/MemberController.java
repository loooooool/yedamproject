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
	
	@Autowired
	CodeDAO dao;
	
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
	
	//비밀번호 변경 폼
		@RequestMapping("/changePwdForm")
		public String changePwdForm(MemberVO vo) {
			return "member/changePwd";
		}
		
	//비밀번호 변경 처리
		@RequestMapping(value="/changePwd", method=RequestMethod.POST)
		public String changePwd(MemberVO vo) {
			int pwd2 = 0;
			int checkPwd2 = 0;
			if(pwd2 == checkPwd2) {
				memberService.changePwd(vo);
				return "redirect:/";
			} else {
				return "redirect:/changePwdForm";
			}
		}
	
	//비밀번호 찾기 폼
	@RequestMapping("/find_pwd_Form")
	public String find_pwd_form(MemberVO vo) {
		return "member/find_pwd";
	}
	
	//비밀번호 찾기 처리
		@RequestMapping(value="/find_pwd", method=RequestMethod.GET)
		public String find_pwd(MemberVO vo) {
			return "member/find_pwd";
		}
	
	

}
