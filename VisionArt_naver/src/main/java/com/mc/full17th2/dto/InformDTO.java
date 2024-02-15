package com.mc.full17th2.dto;

import java.util.Date;

public class InformDTO {
	
	private int notice_id;
	private String notice_title;
	private String notice_content;
	private Date notice_datetime;
	public InformDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public InformDTO(int notice_id, String notice_title, String notice_content, Date notice_datetime) {
		this.notice_id = notice_id;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_datetime = notice_datetime;
	}
	public int getNotice_id() {
		return notice_id;
	}
	public void setNotice_id(int notice_id) {
		this.notice_id = notice_id;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public Date getNotice_datetime() {
		return notice_datetime;
	}
	public void setNotice_datetime(Date notice_datetime) {
		this.notice_datetime = notice_datetime;
	}
	
	
	
	
}
