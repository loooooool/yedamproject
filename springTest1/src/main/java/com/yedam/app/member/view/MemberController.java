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
			memberService.changePwd(vo);
			return "redirect:/changePwdForm";
		}
	
	
	//비밀번호 찾기(4.10 미완성)------------------------------------------------------------
	@RequestMapping(value="/find_pwd_form")
	public String find_pwd_form() throws Exception{
		return "/member/find_pwd_form";
	}
	
	//학생 등록 폼
	@RequestMapping("/insertMemberForm")
	public String insertMemberForm(Model model, ClassVO vo, Map<String,Object> vo2){
		model.addAttribute("classList", classService.getClassList(vo));
		model.addAttribute("CodeList", dao.getCodeList(vo2));
		return "member/insertMember";
}	
	//학생등록 처리
	@RequestMapping(value="/memberTestView", method=RequestMethod.POST)
	public String memberTestView(@RequestParam String[] name,@RequestParam String[] social_number,HttpServletRequest request){
		
		/*System.out.println(request.getParameter("subject"));
		System.out.println(request.getParameter("subjectType"));
		
		for(int i=0;i<name.length;i++) {
			System.out.println(name[i]);
			System.out.println(social_number[i]);
		}*/
		//List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		Map<String,Object> map = new HashMap<String,Object>();
		//Map<String,Object> infomap = new HashMap<String,Object>();
		
		String[] id= new String[social_number.length];
		for(int i=0;i<social_number.length;i++) {
			id[i]=social_number[i];
			id[i]+="-"+memberService.getRn();
			map.put("id", id[i]);
			map.put("name", name[i]);
			map.put("social_number", social_number[i]);
			map.put("cl_no", request.getParameter("subject"));
			map.put("course_type_cd", request.getParameter("subjectType"));
			
			memberService.insertMember(map);
			classInfoService.insertClassInfo(map);
		}
		
		//
		
		return "redirect:/insertMemberForm";
	}
	

}
