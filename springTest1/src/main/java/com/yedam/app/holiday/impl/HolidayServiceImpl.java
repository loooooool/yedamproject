package com.yedam.app.holiday.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.app.holiday.HolidayService;
import com.yedam.app.holiday.HolidayVO;




@Service("HolidayService")
public class HolidayServiceImpl implements HolidayService{
	
	@Autowired
	HolidayDAO dao;

	@Override
	public void insertHoliday(HolidayVO vo) {
		dao.insertHoliday(vo);
	}

	@Override
	public void updateHoliday(HolidayVO vo) {
		dao.updateHoliday(vo);
	}

	@Override
	public void deleteHoliday(HolidayVO vo) {
		dao.deleteHoliday(vo);
	}

	@Override
	public HolidayVO getHoliday(HolidayVO vo) {
		return dao.getHoliday(vo);
	}

	public List<HolidayVO> getHolidayList(HolidayVO vo) {
		return dao.getHolidayList(vo);
	}
	
	
	public int getCount(HolidayVO vo) {
		return dao.getCount(vo);
	}
}
