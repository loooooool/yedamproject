package com.yedam.app.att.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.app.att.ClassAttService;

@Service("classAttService")
public class ClassAttServiceImpl implements ClassAttService {

	
	@Autowired
	ClassAttDAO dao;
	
	/* (non-Javadoc)
	 * @see com.yedam.app.att.impl.ClassAttService#getClassAttList()
	 */
	@Override
	public List<Map<String,Object>> getAttList(Integer cl_no){
		return dao.getAttList(cl_no);
	}
}
