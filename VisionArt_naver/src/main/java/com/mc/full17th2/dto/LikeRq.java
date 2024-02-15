package com.mc.full17th2.dto;

public class LikeRq {
	private int post_id;
	private int member_id;
	
	public LikeRq() {
		super();
		
	}

	public LikeRq(int post_id, int member_id) {
		super();
		this.post_id = post_id;
		this.member_id = member_id;
	}

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
	
	
}
