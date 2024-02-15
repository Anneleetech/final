<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>VisionArt</title>
  <script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=247p8gcsuh"></script>
<script src="${path}/js/jquery-3.7.1.min.js"></script>
<script src="${path}/js/museum.js"></script>
<link href="${path}/css/museum.css" rel="stylesheet" type="text/css">

</head>
<body>
<%@ include file="header.jsp" %>
	<br><br><br>
<div class="contents">
		<div id="map"></div>
		<div class="content">
			<span id="search">
				<input type="text" id="searchInput" placeholder="주소를 입력하세요">
				<input type="submit" id="searchBtn" value="검색">
			</span>
			<div id="showInfo"></div>
		</div>
</div>

<%@ include file="footer.jsp" %>
</body>
</html>
