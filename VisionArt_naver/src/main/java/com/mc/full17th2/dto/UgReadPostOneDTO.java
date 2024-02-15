package com.mc.full17th2.dto;

import java.util.List;

public class UgReadPostOneDTO {
	private String ugName;
	private UgPostDTO ugPostInfo;
	private int uglikeCnt;
	private List<UgCommentDTO> ugcomments;
	
	public UgReadPostOneDTO(String ugName, UgPostDTO ugPostInfo, int uglikeCnt, List<UgCommentDTO> ugcomments) {
		super();
		this.ugName = ugName;
		this.ugPostInfo = ugPostInfo;
		this.uglikeCnt = uglikeCnt;
		this.ugcomments = ugcomments;
	}

	public String getUgName() {
		return ugName;
	}

	public void setUgName(String ugName) {
		this.ugName = ugName;
	}

	public UgPostDTO getUgPostInfo() {
		return ugPostInfo;
	}

	public void setUgPostInfo(UgPostDTO ugPostInfo) {
		this.ugPostInfo = ugPostInfo;
	}

	public int getUglikeCnt() {
		return uglikeCnt;
	}

	public void setUglikeCnt(int uglikeCnt) {
		this.uglikeCnt = uglikeCnt;
	}

	public List<UgCommentDTO> getUgcomments() {
		return ugcomments;
	}

	public void setUgcomments(List<UgCommentDTO> ugcomments) {
		this.ugcomments = ugcomments;
	}

	

}
