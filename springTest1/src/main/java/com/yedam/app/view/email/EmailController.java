package com.yedam.app.view.email;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yedam.app.member.MemberService;
import com.yedam.app.member.MemberVO;

@Controller
public class EmailController {

	@Autowired
	SendEmailService emailService;
	
	@Autowired
	MemberService memberService;
	
	//메일보내기 폼
	@RequestMapping("mailForm")
	public String mailForm() {
		return "email/mailForm";
	}
	
	//메일 발송 처리
	@RequestMapping("mailSend")
	public void mailSend(HttpServletRequest request, HttpServletResponse response, MemberVO vo) 
			throws IOException {
		PrintWriter out = response.getWriter();
		//아이디와 이메일 비교
		String member_id="";
		String email="";
		MemberVO dbVO = (MemberVO) memberService.getMember_id(vo);
		if(dbVO != null && dbVO.getEmail().equals(vo.getEmail())) {
			EmailVO emailVO = new EmailVO(); 
			//보내는사람,받는사람,제목,내용
			emailVO.setFrom("jhshose@gmail.com"); //보내는사람
			emailVO.setTo(vo.getEmail()); //받는사람
			emailVO.setSubject("메일 발송"); //제목
			emailVO.setContent("변경된 임시 비밀번호 " + dbVO.getPwd()); //내용
			
			emailService.send(emailVO);
			
			out.print("<script>");
			out.print("alert('메일을 성공적으로 발송했습니다.');");
			out.print("</script>");
		} else {
			out.print("<script>");
			out.print("alert('메일 발송 실패.');");
			out.print("history.go(-1);");
			out.print("</script>");
		}
		
		//이메일 조회


	}
	
}
