package com.mc.full17th2.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

import com.mc.full17th2.dto.DBCommentDTO;
import com.mc.full17th2.dto.FamousGallaryDTO;
import com.mc.full17th2.dto.FamousGallaryInsertDTO;

@Repository("famousGallaryDao")
@Mapper
public interface FamousGallaryDAO {
    int getAllFamousGallaryPostCount();
    List<FamousGallaryDTO> getListFamousGallaryPosts(int start,int limit);
    FamousGallaryDTO getFamousGallaryPost(int postId);
    int getFamousGallaryPostLikes(int postId);
    List<DBCommentDTO> getFamousGallaryComments(int postId);
    
    int insertFamousGallaryPost(FamousGallaryDTO data);
    int insertFamousGallaryInformation(FamousGallaryDTO data);
    int insertFamousGallaryFile(int postId, String postAttPath);

    int updateFamousGallaryPost(FamousGallaryDTO data);
    int updateFamousGallaryInformation(FamousGallaryDTO data);
    int updatePostView(int postId,int views);

    int deleteFamousGallaryAllComments(int postId);
    int deleteFamousGallaryInformation(int postId);
    int deleteFamousGallaryFile(int postId);
    int deleteFamousGallaryLikes(int postId);
    int deleteFamousGallaryPost(int postId,int memberId);

    int insertFamousGallaryComment(DBCommentDTO data);
    int deleteFamousGallaryComment(int commentId,int memberId);
    DBCommentDTO getFamousGallaryComment(int commentId);
    
    int getFamousGallaryMemberLike(int memberId,int postId);
    int insertFamousGallaryLike(int memberId, int postId);
    int deleteFamousGallaryLike(int memberId, int postId);
}
