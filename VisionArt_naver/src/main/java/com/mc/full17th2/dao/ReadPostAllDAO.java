package com.mc.full17th2.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.mc.full17th2.dto.ArtFieldDTO;
import com.mc.full17th2.dto.ImageDTO;
import com.mc.full17th2.dto.InformDTO;
import com.mc.full17th2.dto.LikeDTO;
import com.mc.full17th2.dto.MemberDTO2;
import com.mc.full17th2.dto.PostDTO;
import com.mc.full17th2.dto.UgArtFieldDTO;
import com.mc.full17th2.dto.UgMemberDTO;
import com.mc.full17th2.dto.UgPostDTO;

@Repository
@Mapper
public interface ReadPostAllDAO {

	public List<PostDTO> selectPosts(int offset, int pageSize);
	public List<MemberDTO2> selectMembers();
	public List<ArtFieldDTO> getArtFieldName();
	public int getTotalPosts();
	public List<LikeDTO> getLikes(int memberid);
	public void updateLike(int memberid, int post_id);
	public long likeExists(int memberid, int post_id);
	public void deleteLike(int memberid, int post_id);
	public List<LikeDTO> likeTotal() ;
	public List<ImageDTO> imageTotal();
	
	public List<UgPostDTO> selectUgPostsByPostField(int offset, int pageSize);
	public List<UgMemberDTO> selectUgMembers();
	public List<UgArtFieldDTO> getUgArtFieldName();
	public int getUgTotalPosts();
	public List<UgPostDTO> getMyAllUgPost(int memberid);
	public List<UgMemberDTO> selectUgMembersButMe(int memberid);
	
	

}
