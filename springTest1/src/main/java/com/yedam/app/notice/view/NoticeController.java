package com.yedam.app.notice.view;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.yedam.app.common.Paging;
import com.yedam.app.notice.NoticeService;
import com.yedam.app.notice.NoticeVO;

@Controller
public class NoticeController {
	
	@Autowired
	NoticeService noticeService;

	
	//목록을 조회하는 컨트롤러
	/*@RequestMapping("/getNoticeList")
	public String getNoticeList(Model model) {
		model.addAttribute("noticeList",NoticeService.getNoticeList(null));
		return "notice/getNoticeList";
	}*/

	@RequestMapping("/getNoticeList") //페이징 처리
	public String getNotice(Model model, NoticeVO vo,Paging paging, Locale locale) {
		System.out.println(locale.getCountry()+":"+locale.getLanguage());
		//전체 레코드 건수
		paging.setPageUnit(5);
		paging.setTotalRecord(noticeService.getCount(vo));
		//vo에 first와 last 셋팅
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());
		model.addAttribute("noticeList", noticeService.getNoticeList(vo));
		return "notice/getNoticeList";
	}

	// 상세 보기
	@RequestMapping("/getNotice")
	public String getNotice(Model model, NoticeVO vo) {
		model.addAttribute("notice", noticeService.getNotice(vo));
		return "notice/getNotice";
	}

	// 등록 폼으로 가는 컨트롤러
	@RequestMapping(value = "/insertNotice", method = RequestMethod.GET)
	public String insertNoticeForm() {
		return "notice/insertNotice";
	}

	// 등록처리
	@RequestMapping(value = "/insertNotice", method = RequestMethod.POST)
	public String insertNotice(@ModelAttribute("notice") NoticeVO vo) throws IllegalStateException, IOException {
		// 첨부파일이 있는 지 체크
		MultipartFile file = vo.getUploadFile();
		if (file != null && file.getSize() > 0) {
			// 업로드된 파일 이름 읽기
			String filename = file.getOriginalFilename();
			// 중복 파일이 있느면 rename

			// 파일을 업로드위치에 저장
			file.transferTo(new File("d:/upload", filename));
			vo.setFilename(filename);
		}
		noticeService.insertNotice(vo);
		return "redirect:/getNoticeList";

	}

	// 수정폼
	@RequestMapping("/updateNoticeForm")
	public String updateNoticeForm(Model model, NoticeVO vo) {
		model.addAttribute("notice", noticeService.getNotice(vo));
		return "notice/updateNotice";
	}

	// 수정처리
	@RequestMapping("/updateNotice")
	public String updateNotice(NoticeVO vo) {
		noticeService.updateNotice(vo);
		return "redirect:/getNoticeList";
	}

	// 단건삭제
	@RequestMapping("/deleteNotice")
	public String deleteNotice(NoticeVO vo) {
		noticeService.deleteNotice(vo);
		return "redirect:/getNoticeList";
	}
    
	// 선택삭제
	@RequestMapping("/deleteNoticeList")
	public String deleteNoticeList(@RequestParam ArrayList<String> n_no) {
		noticeService.deleteNoticeList(n_no);
		return "redirect:/getNoticeList";
	}
}
