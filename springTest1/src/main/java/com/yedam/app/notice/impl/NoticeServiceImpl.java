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
	
	public void updateView(NoticeVO vo) {
		dao.updateView(vo);
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
	
	
	public int getCount(NoticeVO vo) {
		return dao.getCount(vo);
	}

	
	
}
