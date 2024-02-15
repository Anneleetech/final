<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<title>VisionArt</title>
	<link rel="stylesheet" href="${path}/css/notice.css">
</head>

<body>
<%@ include file="header.jsp" %>

   <div id="noticeBody">
		<h2 id="title">공지사항</h2>
		<c:if test="${authority == true}">
			<button id="noticeWrite" type="button">작성</button>
		</c:if>
		
		<div id="maintext">
			<c:forEach var="notice" items="${noticeAll}">
				<div id="container">
					<div class="point">공지</div>
					<p class="headline">
						&nbsp;&nbsp;${notice.notice_title}
						<c:if test="${authority == true}">
			
		<button class="deletebtn" type="button" data-notice-id="${notice.notice_id}">삭제</button>
						</c:if>
					</p>
					<div class="notice_content">&nbsp;${notice.notice_content}
						<div class="notice_datetime">
				<fmt:formatDate value="${notice.notice_datetime}" pattern="yyyy-MM-dd" /></div>
					
					</div> 
				</div>
			</c:forEach>
		</div>
	</div>
	
	<div id="modal">
		<div id="modalbody">
			<input type="button" id="write" value="등록">
			<span id="closebtn">&times;</span>
			<textarea id="notice_title" placeholder="제목을 입력해주세요"></textarea>
			<textarea id="notice_content" placeholder="공지사항 내용을 입력하세요"></textarea>
		</div>
	</div>
	<script src="${path}/js/notice.js"></script>
	<%@ include file="footer.jsp" %>
</body>
</html>