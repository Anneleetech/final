package com.mc.full17th2.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.mc.full17th2.dto.MuseumDTO;
import com.mc.full17th2.dto.MuseumDTOList;
@Mapper
@Repository
public interface MuseumDAO {
	public int selectAllCnt();
	public void insertMuseumInfo(MuseumDTOList MuseumDTOList);
	public List<MuseumDTO> selectByAddr(String address) ;

	 // 추가: 예외 처리를 위한 메서드
    default void handleInsertException(Exception e, MuseumDTO item) {
        // 예외 발생 시 로그 출력
        System.err.println("Error inserting museum data for item: " + item);
        e.printStackTrace();
    }
    
}