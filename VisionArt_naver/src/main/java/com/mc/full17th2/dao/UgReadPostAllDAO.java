package com.mc.full17th2.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.mc.full17th2.dto.UgArtFieldDTO;
import com.mc.full17th2.dto.UgImageDTO;
import com.mc.full17th2.dto.UgLikeDTO;
import com.mc.full17th2.dto.UgMemberDTO;
import com.mc.full17th2.dto.UgPostDTO;

@Repository
@Mapper
public interface UgReadPostAllDAO {

	public List<UgPostDTO> selectUgPostsByPostField(int offset, int pageSize);
	public List<UgMemberDTO> selectUgMembers();
	public List<UgArtFieldDTO> getArtFieldName();
	public int getTotalPosts();
	public List<UgLikeDTO> getLikes(int memberId);
	public void updateLike(int memberId, int post_id);
	public long likeExists(int memberId, int post_id);
	public void deleteLike(int memberId, int post_id);
	public List<UgLikeDTO> likeTotal() ;
	public List<UgImageDTO> imageTotal();
	public List<UgPostDTO> getMyPost(int memberId, int postNumber);
	public List<UgPostDTO> getMyAllPost(int memberId);
	public int validatePw(int memberId, String password);
	
	


}
