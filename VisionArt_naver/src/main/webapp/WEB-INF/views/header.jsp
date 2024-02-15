<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

<div id="header">
    <img id="logo" src="${path}/icon/logo.png" onclick="location.href = '/'">

    <!-- CSS 연결 -->
	 <link rel="stylesheet" href="${path}/css/menu.css">  
	<link rel="stylesheet" href="${path}/css/header.css">
	
    <!-- JavaScript 연결 -->
    <script type="text/javascript" src="${path}/js/header.js"></script>

<div class="weather">
 <a href="/weather">
	<img src="${path}/icon/weather.png" width="65" height="70" alt="weather">
		</a>
			</div>

    <!-- 검색 -->
    <form id="searchForm" action="/search" method="get" onsubmit="return validateSearchForm()">
        <input type="text" name="query" id="searchQuery" placeholder="검색...">
        <button type="submit">검색</button>
    </form>
<%-- <div class="chat">

	<img src="${path}/icon/chat.png" width="60" height="60" alt="chat" 
	id="chatBtn" onclick="handleChatBtn()">

			</div> --%>
	<div class="user_button">
		<a href="/mypage" id="UserBtn">
<img src="${path}/icon/user.png" width="50" height="50" alt="mypage"
 onclick="handleUserBtn()">
	</a>

</div>  
	<button type="button" class="headerBtn" id="loginBtn"
	 data-session-value="<%= session.getAttribute("memberId")%>" 
	 onclick="location.href = '/login'">로그인</button>
    <button type="button" class="headerBtn" id="registerBtn" 
    data-session-value="<%= session.getAttribute("memberId")%>" 
    onclick="location.href = '/join'">회원가입</button>
  </div>


	<div id="menu">
		<menu>
			<li><a href="/post">자유게시글</a></li>
			<li><a href="/ug">유저갤러리</a></li>
			<li><a href="/fg">명화갤러리</a></li>
			<li><a href="/notice">공지사항</a></li>
			<li><a href="/ex">전시회 정보</a>
		
		</menu>
	</div>
