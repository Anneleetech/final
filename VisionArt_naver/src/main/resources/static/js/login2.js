  window.onload = function() {
        	var messageFromModel = "${loginMessage}";

            try {
                // 가져온 값이 null이 아닌 경우 처리
                if (messageFromModel !== null ) {
                	checkInfo(messageFromModel);
                    console.log("세션에서 가져온 값: " + messageFromModel);
                } else {
                    // 값이 null인 경우 처리
                    console.log("세션에서 가져온 값이 null입니다.");
                }
            } catch (error) {
                // HttpSession이 null인 경우 또는 속성이 존재하지 않는 경우 처리
                console.error("아직 로그인 한 적이 없습니다. " + error.message);
            }
            
            var logId = document.getElementById("inputId");
            var logPass = document.getElementById("inputPass");// 로그인 창에서 각각 아이디, 비밀번호 입력을 담은 객체

            logId.onclick = function() { logId.value = ''; };
            logPass.onclick = function() { logPass.value = ''; };// 클릭하면 내용 자동 삭제 기능
        } // window.onload 종료
        
        function checkInfo(message) {
            if (message === "존재하지 않는 아이디입니다.") {
                alert(message);
            }else if (message === "비밀번호를 확인해주세요.") {
                alert(message);
            }
        }