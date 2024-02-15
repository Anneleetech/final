package com.mc.full17th2.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mc.full17th2.dto.CommentRq;
import com.mc.full17th2.dto.DeletePostRq;
import com.mc.full17th2.dto.LikeRq;
import com.mc.full17th2.dto.UgImageDTO;
import com.mc.full17th2.dto.UgPostDTO;
import com.mc.full17th2.dto.UgReadPostOneDTO;
import com.mc.full17th2.service.UgReadPostOneService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class UgReadPostOneController {

	@Autowired
	UgReadPostOneService service;

	
	@GetMapping("/ug/{post_id}")
	@ResponseBody
	public ModelAndView readPostOne(@PathVariable int post_id) {
		UgReadPostOneDTO ugReadPostOne = service.getUgReadPostOne(post_id);
  		List<UgImageDTO> post_attachment = service.getImage(post_id);
  		int art_field_id = service.getArtFieldId(post_id); 
  		String art_field_name = service.getArtFieldName(art_field_id);
  		
  	    //작성자의 다른 게시글 중 조회수가 높은 5개 가져오기
  	    List<UgPostDTO> top5PopularPosts = service.getTop5PopularPosts(ugReadPostOne.getUgPostInfo().getMember_id());
  		
		ModelAndView mv = new ModelAndView();
		mv.addObject("ugReadPostOne", ugReadPostOne);
		//mv.addObject("art_field_id", art_field_id); // art_field_id를 뷰에 추가	
		mv.addObject("art_field_name", art_field_name); 
		mv.addObject("top5PopularPosts", top5PopularPosts); 
		if(!post_attachment.isEmpty()) {
			mv.addObject("post_attachment", post_attachment);
		}		
		
		mv.setViewName("UgReadPostOne");
		
		return mv;
	}
	
	@PostMapping("/ug/comment")
	@ResponseBody
	public CommentRq saveComment(@RequestBody CommentRq request) {

		System.out.println("request.getComment_content()"+request.getComment_content());
		service.insertComment(request.getComment_content(), request.getMember_id(), request.getPost_id());				
		
		return request;
	}
	@PostMapping("/ug/comment/delete/{comment_id}")
	@ResponseBody
	public HashMap<String, Object> deleteComment(@PathVariable Integer comment_id, HttpServletRequest request) {
	    return service.deleteCommentOne(comment_id, (String) request.getSession().getAttribute("memberId"));
	}


	@PostMapping("/ug/like")
	@ResponseBody
	public int clickLike(@RequestBody LikeRq request) {
		int isClick = service.selectLike(request.getPost_id(), request.getMember_id());
		
		if(isClick > 0) {
			service.deleteLike(request.getPost_id(), request.getMember_id());
		} else {
			service.insertLike(request.getPost_id(), request.getMember_id());
		}
				
		return service.selectLikeAll(request.getPost_id());
	}
	
	
	
	@PostMapping("/ug/delete")
	@ResponseBody
	public int deletePost(@RequestBody DeletePostRq request) {
		return service.deletePost(request.getPost_id());
	}
	
	
	@PostMapping("/ug/increaseViews/{post_id}")
    @ResponseBody
    public ResponseEntity<String> increaseViews(@PathVariable int post_id) {
        try {
            // postId를 기반으로 해당 게시글의 조회수를 증가시키는 로직 추가
            service.increaseViews(post_id);

            // 이 예제에서는 단순히 성공 상태 메시지만 반환합니다.
            return ResponseEntity.ok("조회수 증가 성공");
        } catch (Exception e) {
            // 예외 발생 시 에러 상태 메시지 반환
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("조회수 증가 실패");
        }
    }
}
