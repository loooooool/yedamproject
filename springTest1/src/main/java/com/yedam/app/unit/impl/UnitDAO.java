package com.yedam.app.unit.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.app.unit.UnitVO;

@Repository
public class UnitDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public void insertUnit(UnitVO vo) {
		sqlSession.insert("unit.insertUnit",vo);
	}
	
}
