package com.mc.full17th2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mc.full17th2.dao.ReadPostAllDAO;
import com.mc.full17th2.dto.ArtFieldDTO;
import com.mc.full17th2.dto.ImageDTO;
import com.mc.full17th2.dto.InformDTO;
import com.mc.full17th2.dto.LikeDTO;
import com.mc.full17th2.dto.MemberDTO2;
import com.mc.full17th2.dto.NoticeDTO;
import com.mc.full17th2.dto.PostDTO;
import com.mc.full17th2.dto.ReadPostAllDTO;
import com.mc.full17th2.dto.UgArtFieldDTO;
import com.mc.full17th2.dto.UgMemberDTO;
import com.mc.full17th2.dto.UgPostDTO;
import com.mc.full17th2.dto.UgReadPostAllDTO;

@Service
public class ReadPostAllService {
	
	@Autowired
	ReadPostAllDAO dao;
	
	public ReadPostAllDTO getReadPostAll(int page, int pageSize){
		int offset = page * pageSize;
		List<PostDTO> posts = dao.selectPosts(offset, pageSize);
		List<MemberDTO2> members = dao.selectMembers();
		List<ArtFieldDTO> arts = dao.getArtFieldName();
		
		return new ReadPostAllDTO(posts, members, arts);
	}
	public UgReadPostAllDTO selectUgReadPostAllByPostField(int page, int pageSize){
		int offset = page * pageSize;
		List<UgPostDTO> posts = dao.selectUgPostsByPostField(offset, pageSize);
		List<UgMemberDTO> members = dao.selectUgMembers();
		//List<UgMemberDTO> members = dao.selectUgMembersButMe(member_id);
		List<UgArtFieldDTO> arts = dao.getUgArtFieldName();
		return new UgReadPostAllDTO(posts, members, arts);
	}
	public int getUgTotalPosts() {
		return dao.getUgTotalPosts();
	}
	public int getTotalPosts() {
		return dao.getTotalPosts();
	}
	
	public List<LikeDTO> getLikes(int memberId){
		return dao.getLikes(memberId);
	}
	
	public void updateLike(int memberid, int post_id) {
		dao.updateLike(memberid, post_id);
	}
	
	public boolean likeExists(int memberid, int post_id) {
		  long count = dao.likeExists(memberid, post_id);
		  return count > 0;// count가 0보다 크면 true, 그렇지 않으면 false 반환
	}
	
	public void deleteLike(int memberid, int post_id) {
		dao.deleteLike(memberid, post_id);
	}
	
	public List<LikeDTO> likeTotal(){
		return dao.likeTotal();
	}
	
	public List<ImageDTO> imageTotal(){
		return dao.imageTotal();
	}
	


	public List<ArtFieldDTO>  getArtFieldName(){
		return dao.getArtFieldName();
	}


}
