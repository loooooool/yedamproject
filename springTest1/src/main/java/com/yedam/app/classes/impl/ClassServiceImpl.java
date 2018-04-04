package com.yedam.app.classes.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.app.classes.ClassService;
import com.yedam.app.classes.ClassVO;

@Service("classService")
public class ClassServiceImpl implements ClassService{
	
	@Autowired
	ClassDAO dao;
	
	@Override
	public void insertClass(ClassVO vo) {
		dao.insertClass(vo);
	}
	
	@Override
	public void updateClass(ClassVO vo) {
		dao.updateClass(vo);
	}
	
	@Override
	public void deleteClass(ClassVO vo) {
		dao.deleteClass(vo);
	}

	@Override
	public List<ClassVO> getClassList(ClassVO vo) {
		return dao.getClassList(vo);
	}

	@Override
	public void deleteClassList(ArrayList<String> cl_no) {
		dao.deleteClassList(cl_no);
	}
	

}
