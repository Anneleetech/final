
//드롭다운 메뉴 등을 표시하거나 숨길 때 사용

function toggleMenu(element) {
  var frame = element.nextElementSibling;
  frame.style.visibility = frame.style.visibility === "visible" ? "hidden" : "visible";
}

// 프로필 사진 클릭 이벤트
document.addEventListener('DOMContentLoaded', function() {
  var profilePicture = document.getElementById('profilePicture');
  if (profilePicture) {
    profilePicture.addEventListener('click', function() {
      window.location.href = '/mypage/edit';
    });
  }

  // 수정 버튼 클릭 이벤트
  var editProfileBtn = document.getElementById('editProfileBtn');
  if (editProfileBtn) {
    editProfileBtn.addEventListener('click', function() {
      window.location.href = '/mypage/edit';
    });
  }

  window.onclick = function(event) {
    if (!event.target.matches('.dot')) {
      var frames = document.getElementsByClassName("frame1");
      for (var i = 0; i < frames.length; i++) {
        frames[i].style.visibility = "hidden";
      }
    }
  }
});