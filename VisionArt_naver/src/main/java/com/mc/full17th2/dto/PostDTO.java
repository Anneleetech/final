package com.mc.full17th2.dto;

public class PostDTO {
	private int post_id;
	private int member_id;
	private String post_datetime;
	int post_field_id;
	int art_field_id;
	int views;
	private String title;
	private String content;
	
	
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
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	
	
	
	
}
