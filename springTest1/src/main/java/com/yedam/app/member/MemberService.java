package com.yedam.app.member;

import java.util.List;

import javax.servlet.http.HttpSession;

public interface MemberService {

	public MemberVO getMember_id(MemberVO vo);
	//public MemberVO getName(MemberVO vo);
	public boolean login(MemberVO vo);
	//public boolean loginCheck(MemberVO vo, HttpSession session);
	public List<MemberVO> getMemberList(MemberVO vo);
	public void memberUpdate(MemberVO vo);
	//public void changeForm(MemberVO vo);
	public void changePwd(MemberVO vo);
}
