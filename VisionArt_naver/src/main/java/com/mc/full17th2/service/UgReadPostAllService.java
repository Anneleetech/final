package com.mc.full17th2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mc.full17th2.dao.UgReadPostAllDAO;
import com.mc.full17th2.dto.UgArtFieldDTO;
import com.mc.full17th2.dto.UgImageDTO;
import com.mc.full17th2.dto.UgLikeDTO;
import com.mc.full17th2.dto.UgMemberDTO;
import com.mc.full17th2.dto.UgPostDTO;
import com.mc.full17th2.dto.UgReadPostAllDTO;

@Service
public class UgReadPostAllService {
	
	@Autowired
	UgReadPostAllDAO dao;
	
	public UgReadPostAllDTO selectUgReadPostAllByPostField(int page, int pageSize){
		int offset = page * pageSize;
		List<UgPostDTO> posts = dao.selectUgPostsByPostField(offset, pageSize);
		List<UgMemberDTO> members = dao.selectUgMembers();
		List<UgArtFieldDTO> arts = dao.getArtFieldName();
		return new UgReadPostAllDTO(posts, members, arts);
	}
	
	public int getTotalPosts() {
		return dao.getTotalPosts();
	}
	
	public List<UgLikeDTO> getLikes(int memberId){
		return dao.getLikes(memberId);
	}
	
	public void updateLike(int memberId, int post_id) {
		dao.updateLike(memberId, post_id);
	}
	
	public boolean likeExists(int memberId, int post_id) {
		  long count = dao.likeExists(memberId, post_id);
		  return count > 0;// count가 0보다 크면 true, 그렇지 않으면 false 반환
	}
	
	public void deleteLike(int memberId, int post_id) {
		dao.deleteLike(memberId, post_id);
	}
	
	public List<UgLikeDTO> likeTotal(){
		return dao.likeTotal();
	}
	
	public List<UgImageDTO> imageTotal(){
		return dao.imageTotal();
	}
	
	/* My Page      */
	public List<UgPostDTO> getMyPost(int memberId, int postNumber){
		return dao.getMyPost(memberId, postNumber);
	}
	
	public List<UgPostDTO> getMyAllPost(int member_id){
		return dao.getMyAllPost(member_id);
	}
	
	public List<UgMemberDTO> memberTotal(){
		return dao.selectUgMembers();
	}
	
	public int validatePw(int memberid, String password) {
		return dao.validatePw(memberid, password);
	}
	
	
}
