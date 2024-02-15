<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mc.full17th2.dto.MemberDTO" %>
<%
if(session.getAttribute("memberId")==null){
  %>
  <script>
    alert("로그인 먼저 해주세요.");
    location.href="/login";
  </script>
  <%
}else{
  MemberDTO data=(MemberDTO)request.getAttribute("memberData");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Edit Profile</title>
  <link rel="stylesheet" href="/css/editMypage.css">
  <script src="/js/jquery-3.7.1.min.js"></script>
  <script>
    $('#searchAuthor').click(function(){
        window.name="parentForm";
        openWin=window.open("/fg/artistSearch","searchForm","width=500, height=600, resizable=no, scrollbars=yes");
    });
  </script>
</head>
 
 <body>  
  <%@ include file="header.jsp" %>
  <div class="rectangle">
    <div class="Picture">
  <div class="profile-section">
        <!-- 프로필 사진 표시 영역 -->
    <div class="profile-picture" id="currentProfilePicture">
        <!-- 기본 이미지 표시 -->
      <img src="/media/blackpink.webp" alt="Profile Picture">
    </div>
     <!-- 업로드 파일 입력 필드 -->
    <input type="file" id="profilePictureUpload" accept="image/*" style="display: none;">
  </div>
</div>
  <div class="container"> 
  <table>
    <tr>
      <th>닉네임</th>
      <td><input type="text" id="nickname" name="nickname" value="<%= data.getNickname() %>"> 
       <!-- <button type="button" onclick="checkNickname()">중복 확인</button> -->
       <span id="nicknameMessage" style="color: red;"></span><br>
      </td>
    </tr>

<!-- 아이디 -->
<tr>
  <th>아이디</th>
  <td><input type="text" id="username" required value="<%= data.getId() %>"> 
 <button type="button" onclick="checkUsername()">중복 확인</button>
 <span id="usernameMessage" style="color: red;"></span><br> 
 </td>
</tr>

<!-- 이메일 -->
<tr>
  <th>이메일</th>
  <td><input type="email" id="email" required value="<%= data.getEmail() %>"> 
<button type="button" onclick="checkEmail()">중복 확인</button>
<span id="emailMessage" style="color: red;"></span><br>
</td>
</tr>

<!-- 현재 비밀번호 -->
<tr>
  <th> 비밀번호</th>
  <td>
    <input type="password" id="currentPassword" required>
    <button type="button" onclick="checkCurrentPassword()">확인</button>
    <span id="currentPasswordMessage" style="color: red;"></span><br>
  </td>
</tr>

<!-- 새 비밀번호 -->
<tr>
  <th>새 비밀번호</th>
  <td><input type="password" id="newPassword" required></td>
</tr>

<!-- 새 비밀번호 확인 -->
<tr>
  <th>새 비밀번호 확인</th>
  <td>
    <input type="password" id="confirmNewPassword" required>
    <button type="button" onclick="checkPassword()">확인</button>
    <span id="passwordMessage"></span>
  </td>
</tr>

<!-- 이름 -->
<!-- <tr>
  <th>이름</th>
  <td><input type="text" id="name" name="name" value=""></td>
</tr> -->

<!-- 생년월일 -->
<!-- <tr>
  <th>생년월일</th>
  <td><input type="text" id="birthdate" name="birthdate" value=" "></td>
</tr> -->

<!-- 좋아하는 작가 -->
<tr>
  <th> 작가</th>
  <td>
    <input type="text" id="artistSearchName" name="artistSearchName" value="${memberData.artistName}" required disabled>
    <input type="hidden" id="artistSearchId" name="artistSearchId" value="${memberData.artistId}" required>
    <button id="artistSearch">검색</button>
</tr>

<!-- 좋아하는 미술 분야 -->
<tr>
  <th> 미술 분야</th>
  <td>
    <select id="favoriteArtField" name="favoriteArtField" required>
      <option value="1">유화</option>
      <option value="2">수채화</option>
      <option value="3">아크릴화</option>
      <option value="4">채색 연필</option>
      <option value="5">붓글씨</option>
      <option value="6">디지털 그림</option>
      <option value="7">실사</option>
      <option value="8">동양화</option>
      <option value="9">기타</option>
    </select>
  </td>
</tr>

<!-- ... Your existing form elements ... -->

  </table>

  <div class="button-container">
    <!-- 저장 버튼 -->
    <button type="button" id="saveButton" onclick="updateUserInfo()">저장</button>
  
    <!-- 취소 버튼 -->
    <button id="cancelButton">취소</button>
  </div>
  
</div> 
  </form>
 
</div>
  <script src="/js/editMypage.js"></script>
  <script>
    $(document).ready(function(){
      let items=$('#favoriteArtField>option').get();

      $.each(items,function(index,item){
          if($(item).val()==${memberData.artFieldId}){
              $(item).attr('selected',true);
          }
      });
    });

    $('#artistSearch').click(function(){
        window.name="parentForm";
        openWin=window.open("/fg/artistSearch","searchForm","width=500, height=600, resizable=no, scrollbars=yes");
    });
  </script>

</body>
</html>
<% } %>