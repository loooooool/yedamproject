package com.yedam.app.classes;

import org.springframework.web.multipart.MultipartFile;

public class ClassVO {
	private int cl_no;
	private String className;
	private String address;
	private String timeTable;
	private int totalTime;
	private String class_cd;
	
	public int getCl_no() {
		return cl_no;
	}
	public void setCl_no(int cl_no) {
		this.cl_no = cl_no;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
		public int getTotalTime() {
		return totalTime;
	}
	public void setTotalTime(int totalTime) {
		this.totalTime = totalTime;
	}
	public String getClass_cd() {
		return class_cd;
	}
	public void setClass_cd(String class_cd) {
		this.class_cd = class_cd;
	}
	public String getTimeTable() {
		return timeTable;
	}
	public void setTimeTable(String timeTable) {
		this.timeTable = timeTable;
	}
	@Override
	public String toString() {
		return "ClassVO [cl_no=" + cl_no + ", className=" + className + ", address=" + address + ", timeTable="
				+ timeTable + ", totalTime=" + totalTime + ", class_cd=" + class_cd + "]";
	}
	
	
	
	
	
	
}
