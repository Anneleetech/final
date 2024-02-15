package com.mc.full17th2.dto;

import java.util.List;

public class HomeDTO {
	private List<PostDTO> posts;
	private List<MemberDTO2> members;
	private List<ArtFieldDTO> arts;
	
	public HomeDTO() {}

	public HomeDTO(List<PostDTO> posts, List<MemberDTO2> members, List<ArtFieldDTO> arts) {
		this.posts = posts;
		this.members = members;
		this.arts = arts;
	}

	public List<PostDTO> getPosts() {
		return posts;
	}

	public void setPosts(List<PostDTO> posts) {
		this.posts = posts;
	}

	public List<MemberDTO2> getMembers() {
		return members;
	}

	public void setMembers(List<MemberDTO2> members) {
		this.members = members;
	}

	public List<ArtFieldDTO> getArts() {
		return arts;
	}

	public void setArts(List<ArtFieldDTO> arts) {
		this.arts = arts;
	}

	
}
