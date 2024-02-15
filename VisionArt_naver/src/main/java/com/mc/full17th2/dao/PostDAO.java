package com.mc.full17th2.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.mc.full17th2.dto.PostDTO2;

@Repository
@Mapper
public interface PostDAO {
	
//게시글 작성 페이지
	//게시글 작성 
	int insertPost(PostDTO2 postDTO);

//게시글 이미지 작성 및 수정	
	int saveImageFilename1(int post_id, String newFilename);
	
//게시글 수정 페이지
	// 게시글 하나 조회
	PostDTO2 getPostById(int post_id);
	//게시글 이미지 리스트로 조회
	List<String> getImageFilenames(int post_id);
//게시글 글 수정
	int updatePost(PostDTO2 postDTO);


//기존이미지 삭제
	int deleteoldImages(int post_id);
//글종류  
	String getArtFieldName(int artFieldId);

	//int updateImage(int post_id, String newFilename);
}
