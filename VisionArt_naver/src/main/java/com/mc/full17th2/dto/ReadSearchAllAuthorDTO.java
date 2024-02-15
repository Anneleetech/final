package com.mc.full17th2.dto;

import java.util.List;

public class ReadSearchAllAuthorDTO {

	 private List<MemberDTO2> members;
	 private List<ArtFieldDTO> arts;
	 private List<PostDTO> posts;
	 
	public ReadSearchAllAuthorDTO() {
		super();
	
	}

	public ReadSearchAllAuthorDTO(List<MemberDTO2> members, List<ArtFieldDTO> arts, List<PostDTO> posts) {
		this.members = members;
		this.arts = arts;
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

	public List<PostDTO> getPosts() {
		return posts;
	}

	public void setPosts(List<PostDTO> posts) {
		this.posts = posts;
	}
	 
	 

}
