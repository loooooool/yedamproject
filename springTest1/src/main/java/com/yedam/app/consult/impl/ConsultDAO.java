package com.yedam.app.consult.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.app.consult.ConsultVO;

@Repository
public class ConsultDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public void insertConsult(ConsultVO vo) {
		sqlSession.insert("consult.insertConsult",vo);
	}
	
	public void updateConsult(ConsultVO vo){
		sqlSession.update("consult.updateConsult",vo);
	}

	public void deleteConsult(ConsultVO vo){
		sqlSession.delete("consult.deleteConsult",vo);
	}

	public ConsultVO getConsult(ConsultVO vo){
		return sqlSession.selectOne("consult.getConsult",vo); 
	}
	
	public List<ConsultVO> getConsultList(ConsultVO vo){
		return sqlSession.selectList("consult.getConsultList", vo);
	}

	public int getCount(ConsultVO vo) {
		return sqlSession.selectOne("consult.getCount", vo);

	}

	
}
