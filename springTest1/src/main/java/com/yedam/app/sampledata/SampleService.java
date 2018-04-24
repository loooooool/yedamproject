package com.yedam.app.sampledata;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

public interface SampleService {

	List<Map<String, Object>> getSampleData(Map<String, Object> vo);
	public Map<String,Object> getCodeName(Map<String,Object> vo);
	public void updateAtt(Map<String,Object> vo);
	public void insertTimeTableAtt(Map<String,Object> vo);
	public void getSubjectTimeList(String filepath);
	public List<Map<String,Object>> checkTimeTable();
	public List<Map<String,Object>> getExcelTimeTable(String filepath);
	public Map<String,Object> convertCode(String code_name);
	public Map<String,Object> convertSubject(Map<String,Object> vo);
	public Map<String,Object> getRowNum();
	public void insertViewTimeTable(Model model, @RequestParam int sub_no);
	void insertViewTimeTable(Model model, int sub_no, String string);
	void getClassMemberList(int sub_no);
}