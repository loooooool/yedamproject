package com.yedam.app.subject;

public class SubjectVO {
	private int su_no;
	private String status_yn;
	private String subject;
	private int totalTime;
	
	public int getSu_no() {
		return su_no;
	}
	public void setSu_no(int su_no) {
		this.su_no = su_no;
	}
	public String getStatus_yn() {
		return status_yn;
	}
	public void setStatus_yn(String status_yn) {
		this.status_yn = status_yn;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public int getTotalTime() {
		return totalTime;
	}
	public void setTotalTime(int totalTime) {
		this.totalTime = totalTime;
	}
	
	@Override
	public String toString() {
		return "SubjectVO [su_no=" + su_no + ", status_yn=" + status_yn + ", subject=" + subject + ", totalTime="
				+ totalTime + "]";
	}	
}
