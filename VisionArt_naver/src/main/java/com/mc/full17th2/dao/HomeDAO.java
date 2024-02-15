package com.mc.full17th2.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.mc.full17th2.dto.ArtFieldDTO;
import com.mc.full17th2.dto.ImageDTO;
import com.mc.full17th2.dto.LikeDTO;
import com.mc.full17th2.dto.MemberDTO2;
import com.mc.full17th2.dto.PostDTO;

@Repository
@Mapper
public interface HomeDAO {
	
	//part1,2,3
	public List<PostDTO> hitSelectPostsHome(int offset, int limit);
	
	public List<PostDTO> selectPostsHome(int offset, int limit);
	
	public List<PostDTO> selectPostsForGalleryHome(int offset, int limit);
	
	public List<Integer> selectPopPosts();
	
	public List<PostDTO> selectPopPosts2(List<Integer> id);
	
//sub	
	public List<MemberDTO2> selectMembers();
	
	public List<ArtFieldDTO> getArtFieldName();
	
//total	
	public int getTotalPosts();
	
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
