package com.yedam.app.memberAdd.impl;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberAddDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	public void insertMember(Map<String,Object> vo) {
		sqlSession.insert("memberAdd.insertMember",vo);
	}
	
	public String getRn() {
		return sqlSession.selectOne("memberAdd.getRn");
	}
	
}
