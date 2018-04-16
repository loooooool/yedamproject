package com.yedam.app.unit.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.app.unit.UnitService;
import com.yedam.app.unit.UnitVO;

@Service("unitService")
public class UnitServiceImpl implements UnitService{

	@Autowired
	UnitDAO dao;
	
	@Override
	public void insertUnit(UnitVO vo) {
		dao.insertUnit(vo);
		
	}

	
	
}
