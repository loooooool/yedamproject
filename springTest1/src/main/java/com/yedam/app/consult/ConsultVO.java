package com.yedam.app.consult;

import java.util.Date;

public class ConsultVO {

	private Integer c_no;
	private Date cdate;
	private String s_detail;
	private String course_cd;
	private String title;
	private String content;
	private String writer;
	
	private Integer first;
	private Integer last;
	
	public Integer getC_no() {
		return c_no;
	}
	public void setC_no(Integer c_no) {
		this.c_no = c_no;
	}
	public Date getCdate() {
		return cdate;
	}
	public void setCdate(Date cdate) {
		this.cdate = cdate;
	}
	public String getS_detail() {
		return s_detail;
	}
	public void setS_detail(String s_detail) {
		this.s_detail = s_detail;
	}
	public String getCourse_cd() {
		return course_cd;
	}
	public void setCourse_cd(String course_cd) {
		this.course_cd = course_cd;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
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
	@Override
	public String toString() {
		return "ConsultVO [c_no=" + c_no + ", cdate=" + cdate + ", s_detail=" + s_detail + ", course_cd=" + course_cd
				+ ", title=" + title + ", content=" + content + ", writer=" + writer + "]";
	}

	
	
	
}
