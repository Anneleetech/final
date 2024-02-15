package com.mc.full17th2.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.mc.full17th2.dto.DBArtistDTO;

@Repository("artistDao")
@Mapper
public interface ArtistDAO {
    int getAllArtistCount();
    int getKeywordArtistCount(String keyword);
    List<DBArtistDTO> getArtistList(int start,int limit);
    List<DBArtistDTO> getArtistListNameSearch(int start,int limit,String keyword);
}
