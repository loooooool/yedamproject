package com.yedam.app.holiday.impl;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.app.holiday.HolidayVO;

@Repository
public class HolidayDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession; //mybatis-context bean 등록되있음 //jdbc템플릿 대신
	
	public void insertHoliday(HolidayVO vo) {
		sqlSession.insert("holiday.insertHoliday",vo); // holidayMapper 에 지정한 , (namespace id. 메소드 id)
	}

	public void updateHoliday(HolidayVO vo){
		sqlSession.update("holiday.updateHoliday",vo);
	}
	
	public void deleteHoliday(HolidayVO vo){
		sqlSession.delete("holiday.deleteHoliday",vo);
	}
	
	public HolidayVO getHoliday(HolidayVO vo){
		return sqlSession.selectOne("holiday.getHoliday",vo);
	}

	public List<HolidayVO> getHolidayList(HolidayVO vo){
		return sqlSession.selectList("holiday.getHolidayList",vo);
	}

	public int getCount(HolidayVO vo) {
		return sqlSession.selectOne("holiday.getCount",vo);
	}
}
