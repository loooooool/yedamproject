package com.yedam.app.timetable;

import java.util.Date;

public class TimeTableVO {
	private String t_id;
	private String s_date;
	private String classtime_cd;
	private String subject;
	private String ctypecd;
	private String searchCondition;
	private String searchKeyword;
	
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public String getCtypecd() {
		return ctypecd;
	}
	public void setCtypecd(String ctypecd) {
		this.ctypecd = ctypecd;
	}
	public String getT_id() {
		return t_id;
	}
	public void setT_id(String t_id) {
		this.t_id = t_id;
	}
	public String getS_date() {
		return s_date;
	}
	public void setS_date(String s_date) {
		this.s_date = s_date;
	}
	public String getClasstime_cd() {
		return classtime_cd;
	}
	public void setClasstime_cd(String classtime_cd) {
		this.classtime_cd = classtime_cd;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	
	@Override
	public String toString() {
		return "TimeTableVO [t_id=" + t_id + ", s_date=" + s_date + ", classtime_cd=" + classtime_cd + ", subject="
				+ subject + ", ctypecd=" + ctypecd + ", searchCondition=" + searchCondition + ", searchKeyword="
				+ searchKeyword + "]";
	}
	
	
	
	
	

	
	
	
}
