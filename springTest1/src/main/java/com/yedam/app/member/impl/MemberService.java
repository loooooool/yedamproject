package com.yedam.app.member.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.yedam.app.member.MemberVO;

public interface MemberService {

	public MemberVO getMember_id(MemberVO vo);
	//public MemberVO getName(MemberVO vo);
	public boolean login(MemberVO vo);
	//public boolean loginCheck(MemberVO vo, HttpSession session);
	public List<MemberVO> getMemberList(MemberVO vo);
}
