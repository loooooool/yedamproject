package com.yedam.app.scheduler;

import java.util.List;
import java.util.Map;



public interface SchedulerService {

	public void insertScheduler(SchedulerVO vo);
	public void updateScheduler(SchedulerVO vo);
	public void deleteScheduler(SchedulerVO vo);
	public SchedulerVO getScheduler(SchedulerVO vo);
	public List<SchedulerVO> getSchedulerList(SchedulerVO vo);
	public List<Map<String,Object>> getSchedulerListajax(SchedulerVO vo);
	public void insertSchedulerajax(SchedulerVO vo);
	public int getCount(SchedulerVO vo);
}
