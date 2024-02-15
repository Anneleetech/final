package com.mc.full17th2.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.mc.full17th2.dto.TempMyPageCommentDTO;
import com.mc.full17th2.dto.TempMyPageQueryDTO;

@Repository("commentDao")
@Mapper
public interface TempCommentDAO {
    List<TempMyPageCommentDTO> getMyAllComments(TempMyPageQueryDTO query);
    Integer getMyAllCommentCount(int memberId);
}
