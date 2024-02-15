package com.mc.full17th2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mc.full17th2.dao.HomeDAO;
import com.mc.full17th2.dto.ArtFieldDTO;
import com.mc.full17th2.dto.HitHomeDTO;
import com.mc.full17th2.dto.HomeDTO;
import com.mc.full17th2.dto.HomeForGalleryDTO;
import com.mc.full17th2.dto.ImageDTO;
import com.mc.full17th2.dto.LikeDTO;
import com.mc.full17th2.dto.MemberDTO2;
import com.mc.full17th2.dto.PostDTO;

@Service
public class HomeService {
	
	@Autowired
	HomeDAO dao;
	
	// part1
	public HitHomeDTO getHitHome(int page, int pageSize) {
		int offset = page * pageSize;
		// 수정된 부분: 자유게시판 데이터만 가져오도록 변경 (post_field_id = 0)
		List<PostDTO> hitPosts = dao.hitSelectPostsHome(offset, pageSize);
		List<MemberDTO2> members = dao.selectMembers();
		List<ArtFieldDTO> hitArts= dao.getArtFieldName();
		return new HitHomeDTO(hitPosts, members,hitArts);
	}
	
	// part2
	public HomeForGalleryDTO getHome(int page, int pageSize) {
		int offset = page * pageSize;
		List<PostDTO> postsForGallery = dao.selectPostsForGalleryHome(offset, pageSize);
		List<MemberDTO2> members = dao.selectMembers();
		List<ArtFieldDTO> arts= dao.getArtFieldName();
		return new HomeForGalleryDTO(postsForGallery, members, arts);
	}
	// part3
	public HomeDTO getPopPosts(List<Integer> id) { 
		List<PostDTO> posts = dao.selectPopPosts2(id); 
		List<MemberDTO2> members = dao.selectMembers();
		List<ArtFieldDTO> arts= dao.getArtFieldName();
		
		return new HomeDTO(posts, members, arts);
	}
	
	
	public List<Integer> getid() {
		return dao.selectPopPosts();
	}
	
	public int getTotalPosts() {
		return dao.getTotalPosts();
	}
	
	
	public List<LikeDTO> getLikes(int memberId){
		return dao.selectLikes(memberId);
	}
	
	public void updateLike(int member_id, int post_id) {
		dao.updateLike(member_id, post_id);
	}
	
	public boolean likeExists(int member_id, int post_id) {
		boolean result = dao.likeExists(member_id, post_id);
		return result;
	}
	
	public void deleteLike(int member_id, int post_id) {
		dao.deleteLike(member_id, post_id);
	}
	
	public List<LikeDTO> likeTotal(){
		return dao.likeTotal();
	}
	
	public List<ImageDTO> imageTotal( ){
		return dao.imageTotal(); 
	}
	
	public String imageOne(int post_id) {
		return dao.imageOne(post_id);
	}
	
	
	

	
	
}
