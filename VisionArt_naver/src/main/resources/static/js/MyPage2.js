document.addEventListener('DOMContentLoaded', function() {
	//모달과 관련된 HTML 요소들을 선택
    let modal = document.querySelector('#my_modal');
	let resignSuccess = document.querySelector('#resignSuccess');
	let modalBackground = document.querySelector('.modalBackground');
	//취소 버튼, 확인 버튼, 예 버튼, 아니오 버튼, 수정 버튼
	let cancelBtn = document.querySelector('#cancel-btn');
	let check = document.querySelector('#check');
	let yes = document.querySelector('.yes');
	let no = document.querySelector('.no');
	let fix = document.querySelector('#fix');
	
	let btn1 = document.querySelector('#btn1');
	//btn1 버튼 클릭 시, 주어진 URL로 페이지 이동 //더보기
	btn1.addEventListener('click', function() {
		location.href = "http://localhost:9071/myall";
	});
	//fix 버튼 클릭 시, 비밀번호를 검증하고 유효한 경우 회원 정보 수정 페이지로 이동
	fix.addEventListener('click', function() {
		let password = document.querySelector('#password').value;
		if (password === "") {
        	alert("비밀번호를 입력해주세요");
        	return; 
    	}
		
		fetch('http://localhost:9071/validate?password=' + password, {
        	method: 'GET',
       		headers: {
            	'Content-Type': 'application/json',
        	},
    	})
    	
    	 .then(response => {
        if (response.ok) {
            return response.text();
        } else {
            console.error('Validation request failed:', response.status, response.statusText);
        }
    })
	.then(data => {
        console.log('Validation response:', data);
        if (data === "Validation successful") {
            location.href = 'http://localhost:9071/updateMyInfo';
        } else {
            alert("비밀번호가 틀렸습니다");
        }
    })
    .catch(error => {
        console.error('Error during validation request:', error);
    });
});
	//cancelBtn 버튼 클릭 시, 비밀번호를 검증하고 유효한 경우 모달을 띄움
	cancelBtn.addEventListener('click', function() {
		let password = document.querySelector('#password').value;
		if (password === "") {
        	alert("비밀번호를 입력해주세요");
        	return; 
    	}
		
		fetch('http://localhost:9071/validate?password=' + password, {
        	method: 'GET',
       		headers: {
            	'Content-Type': 'application/json',
        	},
    	})
    	
    	.then(response => {
	        if (response.ok) {
	            return response.text(); 
	        }
    	})
		
		.then(data => {
        	if (data === "Validation successful") { 
            	modal.style.display = 'block';
				modalBackground.style.display = 'block';
        	} else {
            	alert("비밀번호가 틀렸습니다");
        	}
    	})
	});
	//yes 버튼 클릭 시, 모달을 닫고 회원 삭제를 서버에 요청
	yes.addEventListener('click', function() {
		modal.style.display = 'none';
		resignSuccess.style.display = 'block';
		let memberid = yes.dataset.memberId; 
		
        fetch('http://localhost:9071/delete?memberid=' + memberid, {
       		method: 'GET',
            headers: {
                'Content-Type': 'application/json',
                // You can add more headers if needed
            },
    	})

	});
	//check 버튼 클릭 시, 확인 모달을 닫고 메인 페이지로 이동
	check.addEventListener('click', function() {
		resignSuccess.style.display = 'none';
		modalBackground.style.display = 'none';
		location.href = "http://localhost:9071/"; //To Main Page
	});
	//no 버튼 클릭 시, 모달을 닫음
	no.addEventListener('click', function() {
		modal.style.display = 'none';
		modalBackground.style.display = 'none';
	});
});

