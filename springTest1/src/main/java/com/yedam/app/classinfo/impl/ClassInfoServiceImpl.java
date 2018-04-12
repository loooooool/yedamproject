package com.yedam.app.classinfo.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.app.classinfo.ClassInfoService;

@Service("classInfoService")
public class ClassInfoServiceImpl implements ClassInfoService {

	@Autowired
	ClassInfoDAO dao;
	
	
	/* (non-Javadoc)
	 * @see com.yedam.app.classinfo.ClassInfoService#insertClassInfo(java.util.Map)
	 */
	@Override
	public void insertClassInfo(Map<String,Object> vo) {
		dao.insertClassInfo(vo);
	}
	
}
