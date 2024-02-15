package com.mc.full17th2.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mc.full17th2.dao.UgReadPostOneDAO;
import com.mc.full17th2.dto.PostDTO;
import com.mc.full17th2.dto.UgCommentDTO;
import com.mc.full17th2.dto.UgImageDTO;
import com.mc.full17th2.dto.UgPostDTO;
import com.mc.full17th2.dto.UgReadPostOneDTO;

@Service
public class UgReadPostOneService {
	
	@Autowired
	UgReadPostOneDAO dao;
		
	
	public UgReadPostOneDTO getUgReadPostOne(int post_id) {
		UgPostDTO ugPostDetail = dao.selectPostDetail(post_id);		
		String ugMemberName = dao.selectMemberName(ugPostDetail.getMember_id());
		int ugLikeCnt = dao.selectLikeAll(post_id);
		List<UgCommentDTO> ugComments = dao.selectComment(post_id);		
		
		return new UgReadPostOneDTO(ugMemberName, ugPostDetail, ugLikeCnt, ugComments);
	}
	
	
	public List<UgImageDTO> getImage(int post_id){
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
		UgPostDTO ugPost = dao.selectPostDetail(post_id);
		ugPost.setViews(ugPost.getViews() + 1);
        dao.updatePost(ugPost);
		
	}
	public List<UgPostDTO> getTop5PopularPosts(int member_id) {
	    return dao.getTop5PopularPosts(member_id);
	}


	public int getCommentWriterId(int comment_id) {
		return dao.getCommentWriterId(comment_id);
	}


	public boolean isAdmin(int memberId) {
		return dao.isAdmin(memberId);
	}
	// 댓글 삭제
    public HashMap<String,Object> deleteCommentOne(int comment_id,String memberIdString){
        HashMap<String,Object> result=new HashMap<>();

        if(memberIdString==null){
            result.put("result","error0");
        }else if(dao.deleteUGComment(comment_id,Integer.parseInt(memberIdString))==1){
            result.put("result","ok");
        }else{
            result.put("result","error1");
        }

        return result;
    }
}
