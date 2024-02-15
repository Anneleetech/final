package com.mc.full17th2.dto;

public class DeletePostRq {
	private int post_id;

	public DeletePostRq() {
		super();
		
	}

	public DeletePostRq(int post_id) {
		super();
		this.post_id = post_id;
	}

	public int getPost_id() {
		return post_id;
	}

	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}
	
	
}
