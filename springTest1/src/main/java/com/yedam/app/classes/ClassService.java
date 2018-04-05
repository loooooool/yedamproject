package com.yedam.app.classes;

import java.util.ArrayList;
import java.util.List;

public interface ClassService {

	public void insertClass(ClassVO vo);
	public void updateClass(ClassVO vo);
	public void deleteClass(ClassVO vo);
	public List<ClassVO> getClassList(ClassVO vo);
	public void deleteClassList(ArrayList<String> cl_no);
}
