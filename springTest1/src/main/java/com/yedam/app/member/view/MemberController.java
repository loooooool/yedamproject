package com.yedam.app.member.view;

import java.io.OutputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.yedam.app.classes.ClassService;
import com.yedam.app.classes.ClassVO;
import com.yedam.app.classinfo.ClassInfoService;
import com.yedam.app.code.impl.CodeDAO;
import com.yedam.app.common.CustomDateEditor2;
import com.yedam.app.common.CustomNumberEditor2;
import com.yedam.app.common.Paging;
import com.yedam.app.member.MemberService;
import com.yedam.app.member.MemberVO;

/*import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRExporter;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.export.JRPdfExporter;*/

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

	// 수정폼
	@RequestMapping("/memberUpdateForm")
	public String memberUpdateForm(MemberVO vo, Model model, HttpSession session) {
		vo.setMember_id(((MemberVO) session.getAttribute("memberVO")).getMember_id());
		model.addAttribute("memberVO", memberService.getMember_id(vo));
		return "member/memberUpdate";
	}
	
	//관리자 정보수정
	// 수정폼
		@RequestMapping("/adminUpdateForm")
		public String adminUpdateForm(MemberVO vo,String member_id, Model model, HttpSession session) {
			//MemberVO vo = new MemberVO();
			vo.setMember_id(member_id);
			model.addAttribute("memberVO", memberService.getMember_id(vo));
			return "member/memberUpdate";
		}

	// 수정처리
	@RequestMapping(value = "/memberUpdate", method = RequestMethod.POST)
	public String memberUpdate(MemberVO vo) {
		memberService.memberUpdate(vo);
		return "redirect:/";
	}

	// 관리자 수정(조회)폼
	@RequestMapping("/adminMemberUpdateForm")
	public String adminMemberUpdateForm(MemberVO vo, Model model, HttpSession session, ClassVO cvo) {
		vo.setMember_id(((MemberVO) session.getAttribute("memberVO")).getMember_id());
		model.addAttribute("memberVO", memberService.getMember_id(vo));
		model.addAttribute("classList", classService.getClassListNP(cvo));
		return "member/adminMemberUpdateForm";
	}

	// 관리자 수정처리
	@RequestMapping(value = "/adminMemberUpdate", method = RequestMethod.GET)
	public String adminMemberUpdate(MemberVO vo) {
		memberService.memberUpdate(vo);
		return "member/adminMemberUpdate";
	}

	//pdf 
/*	@RequestMapping("report.do")
	public void report(HttpServletRequest request, HttpServletResponse response) throws Exception {
		try {
			HashMap<String, Object> map = new HashMap<String, Object>();
			JasperReport report = JasperCompileManager
					.compileReport(request.getSession().getServletContext().getRealPath("report/getMember.jrxml"));
			JRDataSource JRdataSource = new JRBeanCollectionDataSource(memberService.getEmployeeAll());
			JasperPrint print = JasperFillManager.fillReport(report, map, JRdataSource);
			JRExporter exporter = new JRPdfExporter();
			OutputStream out;
			response.reset();
			out = response.getOutputStream();
			exporter.setParameter(JRExporterParameter.OUTPUT_FILE_NAME, "report3.pdf");
			exporter.setParameter(JRExporterParameter.JASPER_PRINT, print);
			exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, out);
			exporter.exportReport();
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}*/
	// 비밀번호 변경 폼
	@RequestMapping("/changePwdForm")
	public String changePwdForm(MemberVO vo) {
		return "member/changePwd";
	}

	// 비밀번호 변경 처리
	@RequestMapping(value = "/changePwd", method = RequestMethod.POST)
	public String changePwd(MemberVO vo) {
		int pwd2 = 0;
		int checkPwd2 = 0;

		if (pwd2 == checkPwd2) {
			memberService.changePwd(vo);
			return "redirect:/";
		} else {
			return "redirect:/changePwdForm";
		}
	}

	// 비밀번호 찾기 폼
	@RequestMapping("/find_pwd_Form")
	public String find_pwd_form(MemberVO vo) {
		return "member/find_pwd";
	}

	// 비밀번호 찾기 처리
	@RequestMapping(value = "/find_pwd", method = RequestMethod.GET)
	public String find_pwd(MemberVO vo) {
		return "member/find_pwd";
	}

	// 바인딩 (Date->String)
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor2(formatter, true));// null값 허용 여부
		binder.registerCustomEditor(int.class, new CustomNumberEditor2(Integer.class, null, true));// null값 허용 여부
	}

}
