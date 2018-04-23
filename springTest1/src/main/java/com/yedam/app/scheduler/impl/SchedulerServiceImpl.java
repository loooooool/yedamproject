package com.yedam.app.scheduler.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.app.scheduler.SchedulerService;
import com.yedam.app.scheduler.SchedulerVO;




@Service("SchedulerService")
public class SchedulerServiceImpl implements SchedulerService{
	
	@Autowired
	SchedulerDAO dao;

	@Override
	public void insertScheduler(SchedulerVO vo) {
		dao.insertScheduler(vo);
	}

	@Override
	public void updateScheduler(SchedulerVO vo) {
		dao.updateScheduler(vo);
	}

	@Override
	public void deleteScheduler(SchedulerVO vo) {
		dao.deleteScheduler(vo);
	}

	@Override
	public SchedulerVO getScheduler(SchedulerVO vo) {
		return dao.getScheduler(vo);
	}

	public List<SchedulerVO> getSchedulerList(SchedulerVO vo) {
		return dao.getSchedulerList(vo);
	}
	
	public List<Map<String,Object>> getSchedulerListajax(SchedulerVO vo) {
		return dao.getSchedulerListajax(vo);
	}
	
	public void insertSchedulerajax(SchedulerVO vo) {
		dao.insertSchedulerajax(vo);
	}
	
	
	public int getCount(SchedulerVO vo) {
		return dao.getCount(vo);
	}
}
