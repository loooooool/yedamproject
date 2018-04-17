package com.yedam.app.classinfo.impl;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ClassInfoDAO {

	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public void getClassInfoList(Map<String, Object> vo) {
		sqlSession.selectList("classInfo.getClassInfoList", vo);
	}
	
	public void insertClassInfo(Map<String,Object> vo) {
		sqlSession.insert("classInfo.insertClassInfo",vo);
	}
}
