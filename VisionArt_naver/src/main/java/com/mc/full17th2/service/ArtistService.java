package com.mc.full17th2.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mc.full17th2.dao.ArtistDAO;
import com.mc.full17th2.dto.DBArtistDTO;

@Service("artistService")
public class ArtistService {
    @Autowired
    ArtistDAO dao;
    
    // 기성 작가(아티스트)들의 목록을 조회하는 메소드
    public HashMap<String,Object> getArtistList(int page, String keyword){
        int n=5, p=2;
        HashMap<String,Object> result=new HashMap<>();
        List<DBArtistDTO> list=null;
        int start=(page-1)*n;
        boolean status=false;
        int count=0;

        // 아티스트 전체 수 및 목록 조회
        if(keyword==null || keyword.trim().isEmpty()){
            count=dao.getAllArtistCount();
            list=dao.getArtistList(start, n);
        }else{
            count=dao.getKeywordArtistCount(keyword);
            list=dao.getArtistListNameSearch(start,n,keyword);
        }

        if(list!=null){
            status=true;

            result.put("startPage",page>p ? page-p : 1);
            result.put("endPage",(count/n)*1 > page+p ? page+p : (count%n==0 ? count/n : count/n*1+1));
            result.put("page",page);
            result.put("count",count);
        }
        
        // 조회한 결과를 반환
        result.put("status",status);
        result.put("artists",list);

        return result;
    }
}
