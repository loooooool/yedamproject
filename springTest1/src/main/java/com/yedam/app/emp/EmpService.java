package com.yedam.app.emp;

import java.util.List;
import java.util.Map;



public interface EmpService {
	
	public List<EmployeeVO> getEmpList(EmployeeVO vo);
	public int getCount(EmployeeVO vo);
	public List<Map<String, Object>> getDeptEmpStatistic();
}
