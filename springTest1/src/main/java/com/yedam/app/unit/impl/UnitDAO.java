package com.yedam.app.unit.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.app.unit.ExcelVO;
import com.yedam.app.unit.UnitVO;


@Repository
public class UnitDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public void insertUnit(UnitVO vo) {
		sqlSession.insert("unit.insertUnit",vo);
	}
	
	public void updateUnit(UnitVO vo){
		sqlSession.update("unit.updateUnit",vo);
	}

	public void deleteUnit(UnitVO vo){
		sqlSession.delete("unit.deleteUnit",vo);
	}
	
	public List<UnitVO> getUnitList(UnitVO vo){
		return sqlSession.selectList("unit.getUnitList", vo);
	}
	
	public void lateUpdate(UnitVO vo){
		sqlSession.update("unit.lateUpdate",vo);
	}

	public void leaveUpdate(UnitVO vo){
		sqlSession.update("unit.leaveUpdate",vo);
	}
	
	public void absenceUpdate(UnitVO vo){
		sqlSession.update("unit.absenceUpdate",vo);
	}
	
	public void gooutUpdate(UnitVO vo){
		sqlSession.update("unit.gooutUpdate",vo);
	}
	
	public void insertExcel(ExcelVO vo) {
		sqlSession.insert("unit.insertExcel",vo);
	}
}

