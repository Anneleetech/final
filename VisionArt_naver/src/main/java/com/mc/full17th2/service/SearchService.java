package com.mc.full17th2.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mc.full17th2.dao.SearchDAO;
import com.mc.full17th2.dto.ArtFieldDTO;
import com.mc.full17th2.dto.ImageDTO;
import com.mc.full17th2.dto.LikeDTO;
import com.mc.full17th2.dto.MemberDTO2;
import com.mc.full17th2.dto.PostDTO;
import com.mc.full17th2.dto.ReadSearchAllAuthorDTO;
import com.mc.full17th2.dto.ReadSearchAllCategoryDTO;
import com.mc.full17th2.dto.ReadSearchAllDTO;
import com.mc.full17th2.dto.ReadSearchAllFgDTO;
import com.mc.full17th2.dto.ReadSearchAllUgDTO;
import com.mc.full17th2.dto.SearchDTO;

@Service
public class SearchService {
	
	@Autowired
	SearchDAO dao;
	public List<SearchDTO> searchPosts(String query) {
		return  dao.searchPosts(query);
	}
	// part1
	public ReadSearchAllDTO searchAll(String query, int page, int pageSize) {
		int offset = page * pageSize;
		List<PostDTO> posts = dao.selectSearchPosts(query,offset, pageSize);
		List<MemberDTO2> members = dao.selectMembers();
		List<ArtFieldDTO> hitArts= dao.getArtFieldName();
		
		return new ReadSearchAllDTO(posts, members, hitArts);
	}
	// part2
	public ReadSearchAllUgDTO searchAllUg(String query, int page, int pageSize) {
		int offset = page * pageSize;
		List<PostDTO> posts = dao.selectSearchUgPosts(query,offset, pageSize);
		List<MemberDTO2> members = dao.selectMembers();
		List<ArtFieldDTO> arts= dao.getArtFieldName();
		
		return new ReadSearchAllUgDTO(posts, members, arts);
	}
	// part3
	public ReadSearchAllFgDTO searchAllFg(String query, int page, int pageSize) {
		int offset = page * pageSize;
		List<PostDTO> posts = dao.selectSearchFgPosts(query,offset, pageSize);
		List<MemberDTO2> members = dao.selectMembers();
		List<ArtFieldDTO> arts= dao.getArtFieldName();
		
		return new ReadSearchAllFgDTO(posts, members, arts);
	}
	// part4
	public ReadSearchAllCategoryDTO searchAllCategory(String query, int page, int pageSize) {
	    int offset = page * pageSize;

	    // arts 값이 없을 경우를 대비한 초기화
	    List<ArtFieldDTO> arts = dao.selectSearchCategary(query);
	    if (arts == null) {
	        arts = new ArrayList<>();
	    }

	    List<MemberDTO2> members = dao.selectMembers();

	    // posts 값이 없을 경우를 대비한 초기화
	    List<PostDTO> posts = dao.selectSearchGalleryPosts(arts,offset, pageSize);
	    if (posts == null) {
	        posts = new ArrayList<>();
	    }

	    return new ReadSearchAllCategoryDTO(posts, members, arts);
	}
	//part5
	public ReadSearchAllAuthorDTO searchAllAuthor(String query, int page, int pageSize) {
		 int offset = page * pageSize;

		    List<MemberDTO2> members = dao.selectMembersWithQuery(query);
		    if (members == null) {
		    	members = new ArrayList<>();
		    }
			List<ArtFieldDTO> arts= dao.getArtFieldName();
		    List<PostDTO> posts = dao.searchAllAuthor(members,offset, pageSize);
		    if (posts == null) {
		        posts = new ArrayList<>();
		    }
		    return new ReadSearchAllAuthorDTO(members,arts, posts);
	}
	
	//total
	
//	public int getTotalPosts() {
//		return dao.getTotalPosts();
//	}
//	
	public int getTotalQueryPosts(String query) {
		return dao.getTotalQueryPosts(query);
	}

	//likes
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
	
	//image
	public List<ImageDTO> imageTotal( ){
		return dao.imageTotal(); 
	}
	
	public String imageOne(int post_id) {
		return dao.imageOne(post_id);
	}
	
	
	

	
	
}
