package com.mc.full17th2.dto;

import java.util.List;

public class UgReadPostAllDTO {
	private List<UgPostDTO> posts;
	private List<UgMemberDTO> members;
	private List<UgArtFieldDTO> arts;

	public UgReadPostAllDTO() {
		
	}


	public UgReadPostAllDTO(List<UgPostDTO> posts, List<UgMemberDTO> members, List<UgArtFieldDTO> arts) {
		this.posts = posts;
		this.members = members;
		this.arts= arts;
	}


	public List<UgPostDTO> getPosts() {
		return posts;
	}


	public void setPosts(List<UgPostDTO> posts) {
		this.posts = posts;
	}


	public List<UgMemberDTO> getMembers() {
		return members;
	}


	public void setMembers(List<UgMemberDTO> members) {
		this.members = members;
	}


	public List<UgArtFieldDTO> getArts() {
		return arts;
	}


	public void setArts(List<UgArtFieldDTO> arts) {
		this.arts = arts;
	}
	
	

	
	
}
