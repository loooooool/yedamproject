package com.yedam.app.notice.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.app.notice.NoticeService;
import com.yedam.app.notice.NoticeVO;

@Service("NoticeService")
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	NoticeDAO dao;

	@Override
	public void insertNotice(NoticeVO vo) {
		dao.insertNotice(vo);
	}

	@Override
	public void updateNotice(NoticeVO vo) {
		dao.updateNotice(vo);
	}

	@Override
	public void deleteNotice(NoticeVO vo) {
		dao.deleteNotice(vo);
	}

	@Override
	public NoticeVO getNotice(NoticeVO vo) {
		return dao.getNotice(vo);
	}

	public List<NoticeVO> getNoticeList(NoticeVO vo) {
		return dao.getNoticeList(vo);
	}

	@Override
	public void deleteNoticeList(ArrayList<String> n_no) {
		dao.deleteNoticeList(n_no);
		
	}
	
	public int getCount(NoticeVO vo) {
		return dao.getCount(vo);
	}

	/*@Override
	public List<NoticeVO> getNoticeList(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return null;
	}*/
}
