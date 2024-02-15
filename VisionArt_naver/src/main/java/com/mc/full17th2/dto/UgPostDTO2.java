package com.mc.full17th2.dto;

import org.springframework.stereotype.Component;

@Component
public class UgPostDTO2 {
	//유저갤러리 -post_field_id=1;
	int member_id;
	int post_id;
	int post_field_id=1;
	int art_field_id;
	int views;
	String title;
	String content;
	String post_att_path;
	String post_field_name;
	

	public int getPost_id() {
		return post_id;
	}

	public void setPost_id(int post_id) {
		this.post_id = post_id;
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

	public String getPost_att_path() {
		return post_att_path;
	}

	public void setPost_att_path(String post_att_path) {
		this.post_att_path = post_att_path;
	}

	public int getMember_id() {
		return member_id;
	}

	public void setMember_id(int member_id) {
		this.member_id = member_id;
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
