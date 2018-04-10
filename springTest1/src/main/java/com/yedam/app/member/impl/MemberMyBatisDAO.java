package com.yedam.app.member.impl;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.app.member.MemberVO;



@Repository
public class MemberMyBatisDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<MemberVO> getMemberList(MemberVO vo){
		System.out.println("mybatis getMemberList");
		return sqlSession.selectList("member.getMemberList",vo);
	}
	
	public int getCount(MemberVO vo) {
		return sqlSession.selectOne("member.getCount", vo);
	}
	
	public MemberVO getMember_id(MemberVO vo) {
		return sqlSession.selectOne("member.getMember_id",vo);
	}
}
