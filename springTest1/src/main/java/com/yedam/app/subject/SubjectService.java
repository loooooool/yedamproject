package com.yedam.app.subject;

import java.util.List;

public interface SubjectService {

	public void insertSubject(SubjectVO vo);
	public void updateSubject(SubjectVO vo);
	public void deleteSubject(SubjectVO vo);
	public List<SubjectVO> getSubjectList(SubjectVO vo);
}