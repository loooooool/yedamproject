package com.yedam.app.holiday;

import java.util.List;



public interface HolidayService {

	public void insertHoliday(HolidayVO vo);
	public void updateHoliday(HolidayVO vo);
	public void deleteHoliday(HolidayVO vo);
	public HolidayVO getHoliday(HolidayVO vo);
	public List<HolidayVO> getHolidayList(HolidayVO vo);
	public int getCount(HolidayVO vo);
}
