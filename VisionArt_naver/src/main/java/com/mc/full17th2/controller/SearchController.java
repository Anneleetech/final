package com.mc.full17th2.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mc.full17th2.dto.ImageDTO;
import com.mc.full17th2.dto.LikeDTO;
import com.mc.full17th2.dto.ReadSearchAllAuthorDTO;
import com.mc.full17th2.dto.ReadSearchAllCategoryDTO;
import com.mc.full17th2.dto.ReadSearchAllDTO;
import com.mc.full17th2.dto.ReadSearchAllFgDTO;
import com.mc.full17th2.dto.ReadSearchAllUgDTO;
import com.mc.full17th2.service.SearchService;

import jakarta.servlet.http.HttpSession;

@Controller
public class SearchController {

    @Autowired
    SearchService service;

   
    // 검색
    @GetMapping("/search")
    public String searchPosts(Model model,@RequestParam(defaultValue = "0") int page,
    		@RequestParam String query, HttpSession session,
            @RequestParam(required = false) Integer post_id, 
            @RequestParam(required = false) Integer member_id)  {
    	//Integer memberIdObj = (Integer) session.getAttribute("memberId");
        //int memberId = (memberIdObj != null) ? memberIdObj : 0;
    	 String memberIdStr = (String) session.getAttribute("memberId");
    	 Integer memberId = (memberIdStr != null) ? Integer.parseInt(memberIdStr) : 0;
    	// Integer memberId = (memberIdStr != null && !memberIdStr.isEmpty()) ? Integer.parseInt(memberIdStr) : 0;
        // 좋아요 버튼 동작 부분
        if (memberId != 0 && post_id != null && member_id != null) {
            boolean result = service.likeExists(member_id, post_id);

            if (result) {
                service.deleteLike(member_id, post_id);
            } else {
                service.updateLike(member_id, post_id);
            }
        }
        List<LikeDTO> likes = service.getLikes(memberId);
        List<LikeDTO> likeTotal = service.likeTotal();
        List<ImageDTO> images = service.imageTotal();
        int pageSize = 20;
    	int totalPosts = service.getTotalQueryPosts(query); //전체 게시물의 수
      ReadSearchAllDTO searchAll = service.searchAll(query, page, pageSize);
      ReadSearchAllUgDTO searchAllUg =service.searchAllUg(query, page, pageSize);
      ReadSearchAllFgDTO searchAllFg =service.searchAllFg(query, page, pageSize);
      ReadSearchAllCategoryDTO searchAllCategory =service.searchAllCategory(query, page, pageSize);
      ReadSearchAllAuthorDTO searchAllAuthor =service.searchAllAuthor(query, page, pageSize);
      
        model.addAttribute("images", images);
        model.addAttribute("likes", likes);
        model.addAttribute("likeTotal", likeTotal);
        model.addAttribute("searchAll", searchAll);
        model.addAttribute("searchAllUg", searchAllUg);
        model.addAttribute("searchAllFg", searchAllFg);
        model.addAttribute("searchAllCategory", searchAllCategory);
        model.addAttribute("searchAllAuthor", searchAllAuthor);
        model.addAttribute("session", session);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", Math.ceil(totalPosts / (double) pageSize));
        return "SearchResults";
    }

}
