package com.yedam.app.holiday;

public class HolidayVO {
	
	private Integer h_no;
	private String name;
	private String type;
	private String year;
	private String month;
	private String day;
	private String rotation_yn;
	
	private String searchCondition;
	private String searchKeyword;
	
	private Integer first;
	private Integer last;
	
	
	
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
	public Integer getFirst() {
		return first;
	}
	public void setFirst(Integer first) {
		this.first = first;
	}
	public Integer getLast() {
		return last;
	}
	public void setLast(Integer last) {
		this.last = last;
	}
	public Integer getH_no() {
		return h_no;
	}
	public void setH_no(Integer h_no) {
		this.h_no = h_no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getRotation_yn() {
		return rotation_yn;
	}
	public void setRotation_yn(String rotation_yn) {
		this.rotation_yn = rotation_yn;
	}
	
	@Override
	public String toString() {
		return "HolidayVO [h_no=" + h_no + ", name=" + name + ", type=" + type + ", year=" + year + ", month=" + month
				+ ", day=" + day + ", rotation_yn=" + rotation_yn + "]";
	}
}
