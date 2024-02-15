 var memberId = "${sessionScope.memberId}";

if (memberId && memberId !== "null" && memberId !== "0") {
    // 로그인된 사용자에 대한 작업 수행
} else {
    // 로그인되지 않은 사용자에 대한 작업 수행
}
 function validateSearchForm() {
        var searchQuery = document.getElementById("searchQuery").value.trim();

        if (searchQuery === "") {
            alert("검색어를 입력하세요.");
            return false; // 검색어가 비어 있으면 폼을 제출하지 않음
        }

        // 다음 페이지로 넘어가도록 폼을 제출
        return true;
    }
  function handleChatBtn() {
        var memberId = loginBtn.getAttribute("data-session-value");
        if (memberId && memberId !== "null" && memberId !== "0") {
            // 로그인된 상태이면 채팅 페이지를 새 창으로 열기
              window.open('/chat', 'ChatWindow', 'width=600,height=400');
        } else {
            // 로그인되지 않은 상태이면 알림
            alert("채팅에 참여하시려면 로그인이 필요합니다.");
        }
    }
function handleUserBtn(event) {
        var memberId = loginBtn.getAttribute("data-session-value");
        if (memberId && memberId !== "null" && memberId !== "0") {
            // 로그인된 상태이면 마이페이지로 이동하기
             location.href = '/mypage';
        } else {
            // 로그인되지 않은 상태이면 알림
            alert("마이페이지로 이동하시려면 로그인이 필요합니다.");
           event.preventDefault(); 
        }
    }

 
 
document.addEventListener('DOMContentLoaded', function() {
    // 세션 값에 따라 로그인/로그아웃 버튼 텍스트 변경
    var loginBtn = document.getElementById("loginBtn");
    var registerBtn = document.getElementById("registerBtn");
    var userBtn = document.getElementById("UserBtn");
    
    var sessionValue = loginBtn.getAttribute("data-session-value");
    

    // 세션 값이 있으면(true), "로그아웃"으로 설정
    // 세션 값이 없으면(false), "로그인"으로 설정
    loginBtn.textContent = sessionValue !== "null" ? "로그아웃" : "로그인";

    // 회원가입 버튼 숨기기
    if (registerBtn && sessionValue !== "null" && sessionValue !== "0") {
        registerBtn.style.display = "none";
    }
     // 세션 값이 있으면(true), 로그아웃 버튼의 클릭 이벤트에 로그아웃 링크 추가
    if (sessionValue !== "null") {
        loginBtn.onclick = function() {
            location.href = '/logout'; // 로그아웃 링크로 변경
        };
     }
      // 마이페이지로 이동하는 이벤트 핸들러 등록
 	if (userBtn) {
            userBtn.onclick = handleUserBtn;
        }
    
});