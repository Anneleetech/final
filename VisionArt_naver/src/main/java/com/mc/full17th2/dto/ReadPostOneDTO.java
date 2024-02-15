package com.mc.full17th2.dto;

import java.util.List;

public class ReadPostOneDTO {
	private String name;
	private PostDTO postInfo;
	private int likeCnt;
	private List<CommentDTO> comments;
	
	

	public ReadPostOneDTO(String name, PostDTO postInfo, int likeCnt, List<CommentDTO> comments) {
		super();
		this.name = name;
		this.postInfo = postInfo;
		this.likeCnt = likeCnt;
		this.comments = comments;
		
	}

	public String getname() {
		return name;
	}

	public void setname(String name) {
		this.name = name;
	}

	public PostDTO getPostInfo() {
		return postInfo;
	}

	public void setPostInfo(PostDTO postInfo) {
		this.postInfo = postInfo;
	}

	public int getLikeCnt() {
		return likeCnt;
	}

	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}

	public List<CommentDTO> getComments() {
		return comments;
	}

	public void setComments(List<CommentDTO> comments) {
		this.comments = comments;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	
	
}
