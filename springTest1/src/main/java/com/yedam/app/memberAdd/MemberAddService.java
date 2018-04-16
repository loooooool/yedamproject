package com.yedam.app.memberAdd;

import java.util.Map;

public interface MemberAddService {

	//학생추가
	public void insertMember(Map<String, Object> vo);

	public String getRn();

}