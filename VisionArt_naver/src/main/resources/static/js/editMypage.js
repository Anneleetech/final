let isCheckCurrentPassword=false;
let isCheckNewPassword=false;

document.getElementById('saveButton').addEventListener('click', function () {
  // 현재 비밀번호 일치 여부 확인
  if(!isCheckCurrentPassword){
    alert("현재 비밀번호가 확인되지 않았습니다.");
    return;
  }

  // 수정된 정보 저장 (실제로는 백엔드와 통신하여 업데이트해야 함)
  var nickname = document.getElementById('nickname').value;
  // var name = document.getElementById('name').value;
  // var birthdate = document.getElementById('birthdate').value;
  var email = document.getElementById('email').value;
  let id=$('#username').val();
  let pw="";
  if($('#newPassword').val()==""){
    pw=$('#currentPassword').val();
  }else if(isCheckNewPassword){
    pw=$('#newPassword').val();
  }else{
    alert("새 비밀번호가 확인용 새 비밀번호와 일치하지 않습니다.");
    return;
  }
  let favoriteArtist=$("#artistSearchId").val();
  let favoriteArtField=$("#favoriteArtField").val();
 
  // 백엔드와 통신
  $.ajax({
    url:"/mypage/editApply",
    data:{
      'nickname':nickname,
      'name':"",
      // 'birthdate':birthdate,
      'id':id,
      'email':email,
      'password':pw,
      'artistId':favoriteArtist,
      'artFieldId':favoriteArtField
    },
    type:'post',
    dataType:'json',
    success:function(response){
      if(response.status==="ok"){
        // 변경 사항이 저장되었습니다. 알림 띄우기
        alert('변경 사항이 저장되었습니다.');
  
        // 확인 버튼을 누르면 mypage로 이동
        window.location.href = '/mypage';
      }else{
        alert('정보를 수정하는 중 오류가 발생했습니다. 잠시 후 다시 시도해주세요.');
      }
    },
    error:function(request,e){
      alert('정보를 수정하는 중 오류가 발생했습니다. 잠시 후 다시 시도해주세요.');
      console.error(request.status+" / "+request.responseText+" / "+e);
      return;
    }
  });

  // 이후에 서버에 업데이트 요청 등을 수행해야 함
  console.log('Nickname:', nickname);
  // console.log('Name:', name);
  // console.log('Birthdate:', birthdate);
  console.log('Email:', email);

  
});

// 파일 업로드 필드 변경 시 이벤트
document.getElementById('profilePictureUpload').addEventListener('change', function () {
  // 선택한 파일을 프로필 사진으로 표시
  displaySelectedProfilePicture();
});

// 기존 프로필 사진 클릭 시 파일 업로드 창 열림
document.getElementById('currentProfilePicture').addEventListener('click', function () {
  document.getElementById('profilePictureUpload').click();
});

// 기존 프로필 사진을 선택한 파일로 교체 및 변경된 사진으로 표시하는 함수
function displaySelectedProfilePicture() {
  var fileInput = document.getElementById('profilePictureUpload');
  var profilePicture = document.getElementById('currentProfilePicture');

  if (fileInput.files.length > 0) {
    // 파일이 선택되었을 경우, 선택한 파일을 읽어와서 프로필 사진으로 표시
    var selectedFile = fileInput.files[0];
    var reader = new FileReader();

    reader.onload = function (e) {
      // 이미지를 직접 변경
      profilePicture.innerHTML = ''; // 이미지를 덮어씌우기 전에 이전 내용을 지웁니다.

      var img = document.createElement('img');
      img.src = e.target.result;
      img.alt = 'Profile Picture';
      profilePicture.appendChild(img);
    };

    reader.readAsDataURL(selectedFile);
  }
}

// 취소 버튼 클릭 이벤트
document.getElementById('cancelButton').addEventListener('click', function () {
  // 변경이 취소되었습니다. 알림 띄우기
  alert('변경이 취소되었습니다. 마이페이지로 돌아갑니다.');

  // 확인 버튼을 누르면 mypage로 이동
  window.location.href = '/mypage';
});

async function checkNickname() {
  const nickname = document.getElementById("nickname").value;
  const nicknameMessage = document.getElementById("nicknameMessage");

  const response = await fetch(`/api/checkNickname?nickname=${nickname}`);
  const result = await response.json();

  if (result.exists) {
    nicknameMessage.textContent = "중복된 닉네임입니다.";
    nicknameMessage.style.color = "red";
  } else {
    nicknameMessage.textContent = "사용 가능한 닉네임입니다.";
    nicknameMessage.style.color = "blue";
  }
}

async function checkEmail() {
  const email = document.getElementById("email").value;
  const emailMessage = document.getElementById("emailMessage");

  const response = await fetch(`/api/checkEmail?email=${email}`);
  const result = await response.json();

  if (result.exists) {
    emailMessage.textContent = "중복된 이메일입니다.";
    emailMessage.style.color = "red";
  } else {
    emailMessage.textContent = "사용 가능한 이메일입니다.";
    emailMessage.style.color = "blue";
  }
}

async function checkUsername() {
  const username = document.getElementById("username").value;
  const usernameMessage = document.getElementById("usernameMessage");

  const response = await fetch(`/api/checkUsername?username=${username}`);
  const result = await response.json();

  if (result.exists) {
    usernameMessage.textContent = "중복된 아이디입니다.";
    usernameMessage.style.color = "red";
  } else {
    usernameMessage.textContent = "사용 가능한 아이디입니다.";
    usernameMessage.style.color = "blue";
  }
}
 


function checkCurrentPasswordMessage(result){
  const currentPasswordMessage= document.getElementById("currentPasswordMessage");

  if (result) {
    currentPasswordMessage.textContent = "현재 사용하는 비밀번호와 일치합니다.";
    currentPasswordMessage.style.color = "blue";
    isCheckCurrentPassword=true;
  } else {
    currentPasswordMessage.textContent = "비밀번호가 틀립니다.";
    currentPasswordMessage.style.color = "red";
    isCheckCurrentPassword=false;
  }
}

async function checkCurrentPassword() {
  const currentPassword = document.getElementById("currentPassword").value;
  
  $.ajax({
    url:"/mypage/checkCurrentPassword",
    type:"post",
    dataType:"json",
    data:{'password':currentPassword},
    success:function(response){
      let result=response.exists;
      checkCurrentPasswordMessage(result==="true");
    },
    error:function(request,e){
      alert("오류가 발생했습니다. 잠시 후 다시 시도해주세요.");
      console.log("오류 발생 : "+request.status+"\n메시지 : "+request.responseText+"\n오류 : "+e);
    }
  });
}


function checkPassword() {
  const password = document.getElementById("newPassword").value;
  const confirmPassword = document.getElementById("confirmNewPassword").value;
  const passwordMessage = document.getElementById("passwordMessage");

  if (password === confirmPassword) {
    if(password===""){
      passwordMessage.innerHTML="";
      isCheckNewPassword=false;
    }else{
      passwordMessage.textContent = "일치합니다.";
      passwordMessage.style.color = "blue";
      isCheckNewPassword=true;
    }
  } else {
    passwordMessage.textContent = "일치하지 않습니다.";
    passwordMessage.style.color = "red";
    isCheckNewPassword=false;
  }
}

  