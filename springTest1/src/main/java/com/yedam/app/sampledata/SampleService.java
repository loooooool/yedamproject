package com.yedam.app.sampledata;

import java.util.List;
import java.util.Map;

public interface SampleService {

	List<Map<String, Object>> getSampleData(Map<String, Object> vo);
	public Map<String,Object> getCodeName(Map<String,Object> vo);
	public void updateAtt(Map<String,Object> vo);
}