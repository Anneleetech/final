let sessionId = '<%= session.getAttribute("memberid") != null ? session.getAttribute("memberid") : "0" %>';

		/* 공통 */
function scrollToTop() {
  window.scrollTo({
    top: 0,
    behavior: 'smooth'
  });
}


		
		/* list */

document.addEventListener('DOMContentLoaded', function() {
	
    // post_id를 클릭한 postBox에서 가져와서 새로운 URL로 이동
    let postTitles = document.querySelectorAll('.writing-title');
    postTitles.forEach(function(postTitle) {
        postTitle.addEventListener('click', function() {
            let post_id = postTitle.dataset.postId; 
            location.href = 'http://localhost:9071/post/' + post_id; //To Read Post One
        });
    });
    /* 좋아요 */
    let likeImages = document.querySelectorAll('.icon icon-heart');
    likeImages.forEach(function(likeImage) {
        likeImage.addEventListener('click', function() {
            let post_id = likeImage.dataset.postId; 
            let member_id = likeImage.dataset.memberId; 
          console.log("post_id:", post_id, "member_id:", member_id); //값 확인
   
			// 값이 정의되어 있고 숫자로 변환 가능할 때에만 변환
			if (post_id && !isNaN(post_id)) {
			    post_id = parseInt(post_id);
			} else {
			    post_id = 0; // 값이 정의되어 있지 않거나 변환 불가능한 경우 기본값 0으로 설정
			}
			
			if (member_id && !isNaN(member_id)) {
			    member_id = parseInt(member_id);
			} else {
			    member_id = 0; // 값이 정의되어 있지 않거나 변환 불가능한 경우 기본값 0으로 설정
			}
			 // 값이 안전하게 변환된 후에 fetch 요청 보내기
            fetch('http://localhost:9071/post?post_id=' + post_id + '&member_id=' + member_id +
           '&page='+ page , {
           		method: 'GET',
	            headers: {
	                'Content-Type': 'application/json',
	            },
        	})
        	.then(() => {
           		location.reload();
        	})
        });
        
    });
    
    
    
    
    
});
