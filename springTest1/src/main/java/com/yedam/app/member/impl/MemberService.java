package com.yedam.app.member.impl;

import com.yedam.app.member.MemberVO;

public interface MemberService {

	public MemberVO getMember_id(MemberVO vo);
	public boolean login(MemberVO vo);
}
