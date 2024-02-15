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
<script src="${path}/js/weather.js"></script>
<link href="${path}/css/weather.css" rel="stylesheet" type="text/css">

</head>
<body>
<%@ include file="header.jsp" %>
	<br><br>
	<div class="contents">
	<div id="average"></div>

<br>
<div id="map" style="width: 48%; height: 400px; float: left;"></div>
<span style="width: 2%;"></span>


<div id="weatherTable" style="width: 50%; float: right;"></div>
<!-- <div id="additionalInfo">
<p>&nbsp;&nbsp;&nbsp; 기상청 단기예보(실시간)- 업데이트 하루8회</p>
<p>&nbsp;&nbsp;&nbsp; 새벽2시, 새벽5시, 오전8시, 오전11시,오후2시, 오후5시, 오후8시, 밤11시</p>
</div> -->


</div>
  <%@ include file="footer.jsp" %>  
</body>
</html>
