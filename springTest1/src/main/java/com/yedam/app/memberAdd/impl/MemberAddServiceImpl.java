package com.yedam.app.memberAdd.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.app.memberAdd.MemberAddService;


@Service("memberAddService")
public class MemberAddServiceImpl implements MemberAddService {

	@Autowired
	MemberAddDAO dao;
	
	
	//학생추가
		/* (non-Javadoc)
		 * @see com.yedam.app.memberAdd.impl.MemberAddService#insertMember(java.util.Map)
		 */
		@Override
		public void insertMember(Map<String,Object> vo) {
			dao.insertMember(vo);
		}
		
		/* (non-Javadoc)
		 * @see com.yedam.app.memberAdd.impl.MemberAddService#getRn()
		 */
		@Override
		public String getRn() {
			return dao.getRn();
		}
}
