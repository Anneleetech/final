package com.mc.full17th2.dto;

public class UgPostDTO {
	private int post_id;
	private int member_id;
	private String post_datetime;
	int post_field_id=1; // 여기를 항상 1로 고정
	int art_field_id;
	String post_field_name;
	private String title;
	private String content;
	int views;
	
	public int getPost_id() {
		return post_id;
	}
	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public int getPost_field_id() {
		return post_field_id;
	}
	public void setPost_field_id(int post_field_id) {
		this.post_field_id = post_field_id;
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
	public String getPost_datetime() {
		return post_datetime;
	}
	public void setPost_datetime(String post_datetime) {
		this.post_datetime = post_datetime;
	}
	public int getArt_field_id() {
		return art_field_id;
	}
	public void setArt_field_id(int art_field_id) {
		this.art_field_id = art_field_id;
	}
	public String getPost_field_name() {
		return post_field_name;
	}
	public void setPost_field_name(String post_field_name) {
		this.post_field_name = post_field_name;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	
	
	
}
