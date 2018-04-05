package com.yedam.app.subject.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.app.subject.SubjectVO;

@Repository
public class SubjectDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public void insertSubject(SubjectVO vo) {
		sqlSession.insert("subject.insertSubject", vo);
	}
	
	public void updateSubject(SubjectVO vo) {
		sqlSession.update("subject.updateSubject", vo);
	}
	
	public void deleteSubject(SubjectVO vo) {
		sqlSession.delete("subject.deleteSubject", vo);
	}
	
	public List<SubjectVO> getSubjectList(SubjectVO vo) {
		return sqlSession.selectList("subject.getSubjectList", vo);
	}

}
