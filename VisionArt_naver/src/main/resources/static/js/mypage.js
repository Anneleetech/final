document.addEventListener('DOMContentLoaded', function() {
  // 프로필 사진 클릭 이벤트
  var profilePicture = document.getElementById('profilePicture');
  if (profilePicture) {
    profilePicture.addEventListener('click', function() {
      // 페이지 이동 코드 (예: editMypage.html)
      window.location.href = '/mypage/edit';
    });
  }

  // 수정 버튼 클릭 이벤트
  var editProfileBtn = document.getElementById('editProfileBtn');
  if (editProfileBtn) {
    editProfileBtn.addEventListener('click', function() {
      // 페이지 이동 코드 (예: editMypage.html)
      window.location.href = '/mypage/edit';
    });
  }

  // 내가 쓴 글 목록 클릭 이벤트
  var myPostsHeader = document.getElementById('myPostsHeader');
  if (myPostsHeader) {
    myPostsHeader.addEventListener('click', function() {
      // 페이지 이동 코드 (예: mypost.html)
      window.location.href = '/mypage/post';
    });
  }

  // 내가 쓴 댓글 목록 클릭 이벤트
  var myRepliesHeader = document.getElementById('myRepliesHeader');
  if (myRepliesHeader) {
    myRepliesHeader.addEventListener('click', function() {
      // 페이지 이동 코드 (예: myreplies.html)
      window.location.href = '/mypage/comment';
    });
  }

  // TODO: 프로젝트 사양에 맞게 수정 필요
  // 각 글 목록 클릭 이벤트
  var postLinks = document.querySelectorAll('.postLink');
  if (postLinks) {
    postLinks.forEach(function(postLink) {
      postLink.addEventListener('click', function() {
        var postId = postLink.getAttribute('data-post-id');
        if (postId) {
          // 페이지 이동 코드 (예: postDetail.html?id=1)
          window.location.href = '/post/' + postId;
        }
      });
    });
  }
 

  // TODO: 프로젝트 사양에 맞게 수정 필요
  // 각 댓글 목록 클릭 이벤트
  var replyLinks = document.querySelectorAll('.replyLink');
  if (replyLinks) {
    replyLinks.forEach(function(replyLink) {
      replyLink.addEventListener('click', function() {
        var replyId = replyLink.getAttribute('data-reply-id');
        if (replyId) {
          // 페이지 이동 코드 (예: replyDetail.html?id=1)
          window.location.href = 'replyDetail.html?id=' + replyId;
        }
      });
    });
  }
});
//드롭다운 메뉴 등을 표시하거나 숨길 때 사용
function toggleMenu(element) {
  var frame = element.nextElementSibling;
  frame.style.visibility = frame.style.visibility === "visible" ? "hidden" : "visible";
}

//메뉴 외부를 클릭했을 때 메뉴가 자동으로 닫히는 사용자 인터페이스를 구현
window.onclick = function(event) {
  if (!event.target.matches('.dot')) {
    var frames = document.getElementsByClassName("frame1");
    for (var i = 0; i < frames.length; i++) {
      frames[i].style.visibility = "hidden";
    }
  }
}
 