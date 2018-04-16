package com.yedam.app.unit;

public class UnitVO { 				//단위기간 출석부
	private Integer c_no; 			//출석부 번호(primary 아님)
	private String student_name;	//학생이름
	private Integer class_no;		//과정번호 (foreign)
	private Integer unit;			//단위
	private Integer late;			//지각
	private Integer leave;			//조퇴
	private Integer absence;		//결석
	private Integer goout;			//외출
	
	private String sdate; 			//단위시작일
	private String edate;			//단위마지막일
	
	
	
	
	
	
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public String getEdate() {
		return edate;
	}
	public void setEdate(String edate) {
		this.edate = edate;
	}
	public Integer getC_no() {
		return c_no;
	}
	public void setC_no(Integer c_no) {
		this.c_no = c_no;
	}
	public String getStudent_name() {
		return student_name;
	}
	public void setStudent_name(String student_name) {
		this.student_name = student_name;
	}
	public Integer getClass_no() {
		return class_no;
	}
	public void setClass_no(Integer class_no) {
		this.class_no = class_no;
	}
	public Integer getUnit() {
		return unit;
	}
	public void setUnit(Integer unit) {
		this.unit = unit;
	}
	public Integer getLate() {
		return late;
	}
	public void setLate(Integer late) {
		this.late = late;
	}
	public Integer getLeave() {
		return leave;
	}
	public void setLeave(Integer leave) {
		this.leave = leave;
	}
	public Integer getAbsence() {
		return absence;
	}
	public void setAbsence(Integer absence) {
		this.absence = absence;
	}
	public Integer getGoout() {
		return goout;
	}
	public void setGoout(Integer goout) {
		this.goout = goout;
	}
	
	
	@Override
	public String toString() {
		return "UnitVO [c_no=" + c_no + ", student_name=" + student_name + ", class_no=" + class_no + ", unit=" + unit
				+ ", late=" + late + ", leave=" + leave + ", absence=" + absence + ", goout=" + goout + "]";
	}
	
	
	
	

	
}
