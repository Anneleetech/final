package com.mc.full17th2.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mc.full17th2.dao.PostDAO;
import com.mc.full17th2.dto.PostDTO2;


@Service
public class PostService{

	@Autowired
	private PostDAO postDAO;

//게시글 작성 페이지
	//게시글 작성 
	public int insertPost(PostDTO2 postDTO) {
		int post_id = postDAO.insertPost(postDTO);
		return post_id;
	}

//게시글 이미지 작성 및 수정
	public void saveImageFilename1(int post_id, String newFilename) {
		postDAO.saveImageFilename1(post_id, newFilename);
			
	}
//게시글 수정 페이지
	// 게시글 하나 조회 
	public PostDTO2 getPostById(int post_id) {
		return postDAO.getPostById(post_id);
	}
	//게시글 이미지 리스트로 조회
	public List<String> getImageFilenames(int post_id) {
	    List<String> filenames = postDAO.getImageFilenames(post_id);

	    if (filenames == null || filenames.isEmpty()) {
	        // 결과가 없는 경우
	        return new ArrayList<>(); // 빈 리스트 반환
	    } else {
	        // 결과가 있는 경우 리스트 반환
	        return filenames;
	    }
	}
	//게시글 글 수정
	public void updatePost(PostDTO2 postDTO) {
		postDAO.updatePost(postDTO);

	}


//기존이미지 삭제
	public int deleteoldImages(int post_id) {
		return postDAO.deleteoldImages(post_id); 
	}
// 글 종류 조회
	public String getArtFieldName(int artFieldId) {
		return  postDAO.getArtFieldName(artFieldId);
	}
	
//	//게시글 이미지 수정
//	public int updateImage(int post_id, String newFilename) {
//		return postDAO.updateImage( post_id, newFilename);
//	}
}
