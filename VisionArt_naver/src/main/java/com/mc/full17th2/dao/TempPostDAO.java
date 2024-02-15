package com.mc.full17th2.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.mc.full17th2.dto.TempMyPagePostDTO;
import com.mc.full17th2.dto.TempMyPageQueryDTO;

import org.apache.ibatis.annotations.Mapper;

@Repository("tempPost")
@Mapper
public interface TempPostDAO {
    List<TempMyPagePostDTO> getMyPostRecent5(int memberId);
    List<TempMyPagePostDTO> getMyAllPosts(TempMyPageQueryDTO dto);
    Integer getMyAllPostCount(int memberId);
}
