package com.mc.full17th2.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.mc.full17th2.dto.ArtFieldDTO;
import com.mc.full17th2.dto.ImageDTO;
import com.mc.full17th2.dto.LikeDTO;
import com.mc.full17th2.dto.MemberDTO2;
import com.mc.full17th2.dto.PostDTO;
import com.mc.full17th2.dto.SearchDTO;

@Repository
@Mapper
public interface SearchDAO {
	//search
	public List<SearchDTO>searchPosts(String query);

	public List<PostDTO> selectSearchPosts(String query, int offset, int pageSize);

	public List<PostDTO> selectSearchUgPosts(String query, int offset, int pageSize);

	public List<PostDTO> selectSearchFgPosts(String query, int offset, int pageSize);

	public List<ArtFieldDTO> selectSearchCategary(String query);

	public List<PostDTO> selectSearchGalleryPosts(List<ArtFieldDTO> arts, int offset, int pageSize);

	public List<PostDTO> searchAllAuthor(List<MemberDTO2> members, int offset, int pageSize);


	public List<MemberDTO2> selectMembers();
	
	public List<MemberDTO2> selectMembersWithQuery(String query);
	
	public List<ArtFieldDTO> getArtFieldName();
	
	//total
	/* public int getTotalPosts(); */
	
	public int getTotalQueryPosts(String query);
	
	//likes
	public List<LikeDTO> selectLikes(int memberId);
	
	public void updateLike(int member_id, int post_id);
	
	public boolean likeExists(int member_id, int post_id);
	
	public void deleteLike(int member_id, int post_id);
	
	public List<LikeDTO> likeTotal();
	
	//images
	public List<ImageDTO> imageTotal();
	
	public String imageOne(int post_id);
	

	


	



	

	

	

	
	
	
	
	

}
