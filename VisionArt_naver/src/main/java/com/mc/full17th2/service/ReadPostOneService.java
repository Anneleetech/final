package com.mc.full17th2.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mc.full17th2.dao.ReadPostOneDAO;
import com.mc.full17th2.dto.CommentDTO;
import com.mc.full17th2.dto.ImageDTO;
import com.mc.full17th2.dto.PostDTO;
import com.mc.full17th2.dto.ReadPostOneDTO;

@Service
public class ReadPostOneService {
	
	@Autowired
	ReadPostOneDAO dao;
		

	public ReadPostOneDTO getReadPostOne(int post_id) {
		PostDTO postDetail = dao.selectPostDetail(post_id);		
		String memberName = dao.selectMemberName(postDetail.getMember_id());
		int likeCnt = dao.selectLikeAll(post_id);
		List<CommentDTO> comments = dao.selectComment(post_id);		
		
		return new ReadPostOneDTO(memberName, postDetail, likeCnt, comments);
	}
	

	public List<ImageDTO> getImage(int post_id){
		return dao.getImage(post_id);
	}
	

	public int insertComment(String comment_content, int member_id, int post_id) {
		return dao.insertComment(comment_content, member_id, post_id);
	}

	public int deleteComment(int comment_id) {
		return dao.deleteComment(comment_id);
	}
	
	
	public int selectLike(int post_id, int member_id) {
		return dao.selectLike(post_id, member_id);
	}
	
	
	public int deleteLike(int post_id, int member_id) {
		return dao.deleteLike(post_id, member_id);
	}
	
	
	public int insertLike(int post_id, int member_id) {
		return dao.insertLike(post_id, member_id);
	}

	public int selectLikeAll(int post_id) {
		return dao.selectLikeAll(post_id);
	}
	

	public int deletePost(int post_id) {
		return dao.deletePost(post_id);
	}
	public int getArtFieldId(int post_id) {
	    return dao.getArtFieldId(post_id);
	}

	public String getArtFieldName(int art_field_id) {
		return  dao.getArtFieldName(art_field_id);
	}
	@Transactional
	public void increaseViews(int post_id) {
		PostDTO post = dao.selectPostDetail(post_id);
        post.setViews(post.getViews() + 1);
        dao.updatePost(post);
		
	}

	public List<PostDTO> getOtherPostsByAuthor(int member_id) {
		 return dao.getOtherPostsByAuthor(member_id);
	}


	public int getCommenterId(int comment_id) {
	    return dao.getCommenterId(comment_id);
	}
	// 댓글 삭제
    public HashMap<String,Object> deleteCommentOne(int comment_id,String memberIdString){
        HashMap<String,Object> result=new HashMap<>();

        if(memberIdString==null){
            result.put("result","error0");
        }else if(dao.deleteBoardComment(comment_id,Integer.parseInt(memberIdString))==1){
            result.put("result","ok");
        }else{
            result.put("result","error1");
        }

        return result;
    }
}
