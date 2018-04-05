package com.yedam.app.classes.impl;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.app.classes.ClassVO;

@Repository
public class ClassDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public void insertClass(ClassVO vo) {
		sqlSession.insert("class.insertClass",vo);
	}
	
	public void updateClass(ClassVO vo) {
		sqlSession.update("class.updateClass",vo);
	}
	
	public void deleteClass(ClassVO vo) {
		sqlSession.delete("class.deleteClass",vo);
	}
	
	public List<ClassVO> getClassList(ClassVO vo) {
		return sqlSession.selectList("class.getClassList", vo);
	}
	
	public void deleteClassList(ArrayList<String> cl_no) {
		sqlSession.delete("class.getClassList", cl_no);
	}
}
