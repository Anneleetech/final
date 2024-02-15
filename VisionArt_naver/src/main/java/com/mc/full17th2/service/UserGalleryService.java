package com.mc.full17th2.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mc.full17th2.dao.UserGalleryDAO;
import com.mc.full17th2.dto.UgPostDTO2;

@Service
public class UserGalleryService {

	@Autowired
	UserGalleryDAO ugDAO;

//유저갤러리 게시글 작성 페이지
	//유저갤러리 게시글 작성 	
	public int insertPost(UgPostDTO2 ugPostDTO) {
		int post_id = ugDAO.insertPost(ugPostDTO);
		return post_id;
	}
	//유저갤러리 게시글 이미지 작성 및 수정	
	public void saveImageFilename1(int post_id, String newFilename) {
		 ugDAO.saveImageFilename1(post_id, newFilename);
		
	}
//유저갤러리 게시글 수정 페이지
	// 유저갤러리 게시글 하나 조회 
	public UgPostDTO2 getPostById(int post_id) {
		return ugDAO.getPostById(post_id);
	}
	
	//유저갤러리 게시글 이미지 리스트로 조회
	public List<String> getImageFilenames(int post_id) {
	    List<String> filenames = ugDAO.getImageFilenames(post_id);

	    if (filenames == null || filenames.isEmpty()) {
	        // 결과가 없는 경우
	        return new ArrayList<>(); // 빈 리스트 반환
	    } else {
	        // 결과가 있는 경우 리스트 반환
	        return filenames;
	    }
	}
	//유저갤러리 게시글 글 수정
	public void updatePost(UgPostDTO2 ugPostDTO) {
		ugDAO.updatePost(ugPostDTO);

	}
	//기존이미지 삭제
	public int deleteoldImages(int post_id) {
		return ugDAO.deleteoldImages(post_id); 
	}
	// 미술분류 조회
	public String getArtFieldName(int artFieldId) {
		return  ugDAO.getArtFieldName(artFieldId);
	}
	/*
	 * public int updateImage(int post_id, String newFilename) { return
	 * ugDAO.updateImage( post_id, newFilename); }
	 */
}
