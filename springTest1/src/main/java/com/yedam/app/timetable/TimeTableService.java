package com.yedam.app.timetable;

import java.util.List;

public interface TimeTableService {

	public List<TimeTableVO> getTimeTableList(TimeTableVO vo);
	public int getCount(TimeTableVO vo);
}
