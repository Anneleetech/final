package com.mc.full17th2.dto;

import java.util.List;

public class NoticeDTO {
	
	private List<MemberDTO2> members;
	private List<InformDTO> informs;
	
	public NoticeDTO() { }

	public NoticeDTO(List<MemberDTO2> members, List<InformDTO> informs) {
		this.members = members;
		this.informs = informs;
	}

	public List<MemberDTO2> getMembers() {
		return members;
	}

	public void setMembers(List<MemberDTO2> members) {
		this.members = members;
	}

	public List<InformDTO> getInforms() {
		return informs;
	}

	public void setInforms(List<InformDTO> informs) {
		this.informs = informs;
	}
	
	
}
