package com.yedam.app.classinfo;

import java.util.Map;

public interface ClassInfoService {
	
	void getClassInfoList(Map<String, Object> vo);
	void insertClassInfo(Map<String, Object> vo);

}