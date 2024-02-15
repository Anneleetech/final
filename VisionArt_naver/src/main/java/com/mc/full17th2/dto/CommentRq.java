package com.mc.full17th2.dto;


public class CommentRq {
	private String comment_content;
    private int member_id;
    private int post_id;
    private int comment_id;
	public CommentRq() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CommentRq(String comment_content, int member_id, int post_id, int comment_id) {
		this.comment_content = comment_content;
		this.member_id = member_id;
		this.post_id = post_id;
		this.comment_id = comment_id;
	}
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public int getPost_id() {
		return post_id;
	}
	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}
	public int getComment_id() {
		return comment_id;
	}
	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
	}
	
}
