package com.yedam.app.member.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.app.member.MemberService;
import com.yedam.app.member.MemberVO;


@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberMyBatisDAO dao;
	
	public boolean login(MemberVO vo) {
		//id 조회
		MemberVO memberVO = (MemberVO) dao.getMember_id(vo);
						
		//입력 패스워드 db 패스워드 비교
		if(memberVO != null && vo.getPwd().equals(memberVO.getPwd())) {
			return true;
		}
		return false;
	}

	public MemberVO getMember_id(MemberVO vo) {
		// TODO Auto-generated method stub
		return dao.getMember_id(vo);
	}

	/*@Override
	public boolean loginCheck(MemberVO vo, HttpSession session) {
		return false;
	}*/

	public List<MemberVO> getMemberList(MemberVO vo) {
		return dao.getMemberList(vo);
	}

	@Override
	public void memberUpdate(MemberVO vo) {
		// TODO Auto-generated method stub
		
	}

	
}
