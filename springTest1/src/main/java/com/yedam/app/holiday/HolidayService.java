package com.yedam.app.holiday;

import java.util.List;

public interface HolidayService {

	public void insertNotice(HolidayVO vo);
	public void updateNotice(HolidayVO vo);
	public void deleteNotice(HolidayVO vo);
	public HolidayVO getNotice(HolidayVO vo,boolean cntYn);
	public List<HolidayVO> getNoticeList(HolidayVO vo);
	public int getCount(HolidayVO vo);
}
