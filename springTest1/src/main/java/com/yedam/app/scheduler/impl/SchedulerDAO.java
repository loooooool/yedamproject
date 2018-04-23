package com.yedam.app.scheduler.impl;


import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.app.scheduler.SchedulerVO;

@Repository
public class SchedulerDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession; //mybatis-context bean 등록되있음 //jdbc템플릿 대신
	
	public void insertScheduler(SchedulerVO vo) {
		sqlSession.insert("scheduler.insertScheduler",vo); // schedulerMapper 에 지정한 , (namespace id. 메소드 id)
	}

	public void updateScheduler(SchedulerVO vo){
		sqlSession.update("scheduler.updateScheduler",vo);
	}
	
	public void deleteScheduler(SchedulerVO vo){
		sqlSession.delete("scheduler.deleteScheduler",vo);
	}
	
	public SchedulerVO getScheduler(SchedulerVO vo){
		return sqlSession.selectOne("scheduler.getScheduler",vo);
	}

	public List<SchedulerVO> getSchedulerList(SchedulerVO vo){
		return sqlSession.selectList("scheduler.getSchedulerList",vo);
	}
	
	public List<Map<String,Object>> getSchedulerListajax(SchedulerVO vo){
		return  sqlSession.selectList("scheduler.getSchedulerListajax",vo);
	}
	
	public void insertSchedulerajax(SchedulerVO vo){
		sqlSession.insert("scheduler.insertSchedulerListajax",vo);
	}

	public int getCount(SchedulerVO vo) {
		return sqlSession.selectOne("scheduler.getCount",vo);
	}
}
