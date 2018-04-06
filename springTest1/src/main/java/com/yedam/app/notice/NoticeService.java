package com.yedam.app.notice;

import java.util.ArrayList;
import java.util.List;

public interface NoticeService {

	public void insertNotice(NoticeVO vo);
	public void updateNotice(NoticeVO vo);
	public void deleteNotice(NoticeVO vo);
	public void deleteNoticeList(ArrayList<String> seq);
	public NoticeVO getNotice(NoticeVO vo);
	public List<NoticeVO> getNoticeList(NoticeVO vo);
	public int getCount(NoticeVO vo);
}
