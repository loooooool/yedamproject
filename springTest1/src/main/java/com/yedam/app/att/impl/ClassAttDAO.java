package com.yedam.app.att.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ClassAttDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<Map<String,Object>> getAttList(Integer cl_no){
		
		return sqlSession.selectList("classAtt.getAttList",cl_no);
		
	}
	
	public List<Map<String,Object>> getAttSubjectList(Integer cl_no){
		
		return sqlSession.selectList("classAtt.getAttSubjectList",cl_no);
		
	}
}
