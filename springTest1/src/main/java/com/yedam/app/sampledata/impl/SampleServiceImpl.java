package com.yedam.app.sampledata.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.app.sampledata.SampleService;

@Service("sampleService")
public class SampleServiceImpl implements SampleService {

	@Autowired
	SampleBybatisDAO dao;

	/* (non-Javadoc)
	 * @see com.yedam.app.sampledata.impl.SampleService#getSampleData(java.util.Map)
	 */
	@Override
	public List<Map<String,Object>> getSampleData(Map<String,Object> vo){
		
		return dao.getSampleData(vo);
	}
	
	@Override
	public Map<String,Object> getCodeName(Map<String,Object> vo){
		return dao.getCodeName(vo);
	}
	
	@Override
	public void updateAtt(Map<String,Object> vo){
		
		dao.updateAtt(vo);
	}
}
