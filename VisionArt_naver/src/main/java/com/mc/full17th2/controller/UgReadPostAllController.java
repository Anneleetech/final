package com.mc.full17th2.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mc.full17th2.dto.UgImageDTO;
import com.mc.full17th2.dto.UgLikeDTO;
import com.mc.full17th2.dto.UgReadPostAllDTO;
import com.mc.full17th2.service.UgReadPostAllService;

import jakarta.servlet.http.HttpSession;

@Controller
public class UgReadPostAllController {

	@Autowired
	UgReadPostAllService service;

	@GetMapping("/ug")
	public String ugReadPostAll(Model model, @RequestParam(defaultValue = "0") int page, HttpSession session,
			@RequestParam(required = false) Integer post_id, @RequestParam(required = false) Integer member_id){
		 String memberIdStr = (String) session.getAttribute("memberId");
    	 Integer memberId = (memberIdStr != null) ? Integer.parseInt(memberIdStr) : 0;
		//Integer memberIdObj = (Integer) session.getAttribute("memberId");
		// memberid가 null이면 0으로 기본값을 설정
		//int memberid = (memberIdObj != null) ? memberIdObj : 0; 

		//memberid가 0이 아닌 경우(사용자가 로그인 중인 경우)
		 // 좋아요 버튼 동작 여부
       boolean likeButtonEnabled = (memberId != 0 && post_id != null && member_id != null);

       // 좋아요 동작이 가능한 경우
       if (likeButtonEnabled) {
           boolean result = service.likeExists(member_id, post_id);

           if (result) {
               service.deleteLike(member_id, post_id);
           } else {
               service.updateLike(member_id, post_id);
           }
       }

			List<UgLikeDTO> likes = service.getLikes(memberId);
			List<UgLikeDTO> likeTotal = service.likeTotal();
			List<UgImageDTO> images = service.imageTotal();
			int pageSize = 8; //페이지 당 표시되는 게시물 수
	 
			int totalPosts = service.getTotalPosts(); //전체 게시물의 수
			UgReadPostAllDTO all = service.selectUgReadPostAllByPostField(page, pageSize);
			
			model.addAttribute("images", images);
			model.addAttribute("likes", likes);
			model.addAttribute("likeTotal", likeTotal);
			model.addAttribute("all", all);
			model.addAttribute("session", session);
			model.addAttribute("currentPage", page); //currentPage: 현재 페이지 번호
			model.addAttribute("totalPages", Math.ceil(totalPosts / (double) pageSize)); 
			//totalPages: 전체 페이지 수. Math.ceil 함수를 사용하여 올림하여 정수 값으로 계산
		
		return "UgReadPostAll";
	}

}
