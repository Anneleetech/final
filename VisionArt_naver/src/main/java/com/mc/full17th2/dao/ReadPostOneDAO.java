package com.mc.full17th2.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.mc.full17th2.dto.CommentDTO;
import com.mc.full17th2.dto.ImageDTO;
import com.mc.full17th2.dto.PostDTO;

@Repository
@Mapper
public interface ReadPostOneDAO {
	
	public PostDTO selectPostDetail(int post_id);
	public String selectMemberName(int member_id);
	public List<CommentDTO> selectComment(int post_id);
	public List<ImageDTO> getImage(int post_id);
	public int insertComment(String comment_content, int member_id, int post_id);
	public int deleteComment(int comment_id);
	public int selectLike(int post_id, int member_id);
	public int deleteLike(int post_id, int member_id);
	public int insertLike(int post_id, int member_id);
	public int selectLikeAll(int post_id);
	public int deletePost(int post_id);
	public int getArtFieldId(int post_id);
	public String getArtFieldName(int art_field_id);
	public void updatePost(PostDTO post);
	public List<PostDTO> getOtherPostsByAuthor(int member_id);
	public int getCommenterId(int comment_id);
	int deleteBoardComment(int comment_id,int memberId);
}
