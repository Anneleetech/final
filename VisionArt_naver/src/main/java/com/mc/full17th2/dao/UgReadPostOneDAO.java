package com.mc.full17th2.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.mc.full17th2.dto.UgCommentDTO;
import com.mc.full17th2.dto.UgImageDTO;
import com.mc.full17th2.dto.UgPostDTO;

@Repository
@Mapper
public interface UgReadPostOneDAO {
	
	
	public UgPostDTO selectPostDetail(int post_id);
	
	
	public String selectMemberName(int member_id);
	
	
	public List<UgCommentDTO> selectComment(int post_id);
	
	
	public List<UgImageDTO> getImage(int post_id);
	
	public int insertComment(String comment_content, int member_id, int post_id);
	
	
	public int deleteComment(int comment_id);
	
	
	public int selectLike(int post_id, int member_id);
	
	
	public int deleteLike(int post_id, int member_id);
	
	
	public int insertLike(int post_id, int member_id);
	
	
	public int selectLikeAll(int post_id);
	
	public int deletePost(int post_id);
	
    public int getArtFieldId(int post_id);

	public String getArtFieldName(int art_field_id);

	public void updatePost(UgPostDTO ugPost);

	public List<UgPostDTO> getTop5PopularPosts(int member_id);


	public int getCommentWriterId(int comment_id);


	public boolean isAdmin(int memberId);
	int deleteUGComment(int comment_id,int memberId);
}
