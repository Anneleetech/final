<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비전아트 게시판</title>
<!-- 공유하기 -->
<script src="${path}/resources/js/jquery-3.7.1.min.js"></script>
<script src="${path}/resources/js/board.js"></script>
<link rel="stylesheet" href="${path}/resources/css/fontello-dede59aa/css/fontello-embedded.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/board.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/menu.css">
<script>
</script>
</head>

<body>
	<%@ include file="header.jsp"%>
	<div class="pageClass" id="board-containor">
		<header class="navi">
			<nav class="content-nav">
				<!-- 사방 패딩, 스크롤 고정,  -->
				<div class="location">
					<!-- 왼쪽 -->
					<strong>자유 게시판</strong>

					<div class="contents-util">
						<!-- 오른쪽, 아이콘  -->
						<div class="contents-share">
							<!-- 왼쪽으로 아코디언 -->
							<div class="shareList">
							</div>
						</div>
						<button type="button" class="icon icon-edit-2" onclick="location.href = '${path}/post/write'" title="글쓰기"></button>
						<button type="button" class="icon icon-up-2" onclick="scrollToTop()" title="맨위로" ></button>
					</div>

				</div>

			</nav>
		</header>
		<main>
			<section class="section-title">
				<h1 class="title-h1">"감상과 정보를 자유롭게 공유하는 공간입니다"</h1>
			</section>

			<section class="section-board">
				<div class="area-sort">
<!-- 					<a href="#"> 최신글</a>| <a href="#"> 인기글</a>| <a href="#"> 댓글 많은 글</a>| -->
				</div>





				<c:choose>
					<c:when test="${empty all.posts}">
						<div id="board-list">
							<ul class="board-ul">
								<li class="one-writing-li">
									<!-- b-m -->
									<div class="one-writing">
										<span class="comment-ctn"></span>
										<!-- r-m -->
										<div class="title-inform">
											<h1>게시물이 존재하지 않습니다.</h1>
										</div>
									</div>
								</li>
							</ul>
						</div>
					</c:when>
					<c:when test="${!empty all.posts}">
						<c:forEach var="post" items="${ all.posts}" varStatus="post_id">
							<div id="board-list">
								<ul class="board-ul">
									<li class="one-writing-li">
										<div class="one-writing">

											<!-- 조회 수 -->
											<span class="view-ctn" data-post-id="${post.post_id}"> ${post.views} </span>
											<!-- 카테고리 -->
											<div class="title-inform">
												<span data-post-id="${post.post_id}">
													<c:forEach var="arts" items="${all.arts}">
													<c:if test="${arts.art_field_id eq post.art_field_id}">
														[ ${arts.art_field_name} ]
													</c:if>
													</c:forEach>
												</span> 
												<!-- 제목 -->
												<a class="writing-title" data-post-id="${post.post_id}" href="${path}/post/${post.post_id}" onclick="redirectToPost(event)">
													${ post.title }
												</a>
												
												<!-- 좋아요 수만큼 하트 -->	
												<c:set var="likeCtn" value="0" />
												<c:forEach var="like" items="${likeTotal}">
     													<c:if test="${like.post_id == post.post_id}">
														<c:set var="likeCtn" value="${likeCtn + 1}" />
													</c:if>
												</c:forEach>

												<div class="like-ctn" data-post-id="${post.post_id}">
													<c:if test="${likeCtn > 0}">
														<c:forEach var="i" begin="1" end="${likeCtn}">
															<i class="icon-heart-1"></i>
														</c:forEach>
													</c:if>
												</div>
												
												
												 
											</div>
											
											<!-- 작성자 -->
											<span class="writer-inform">
												<%-- <a class="writer" href="#">
														<strong>${member.nickname}</strong>
													</a>  --%>
												<img src="${path}/resources/visionart/user.png" class="profile-img">
												<p class="writer">
													<c:forEach var="member" items="${all.members}">
														<c:if test="${post.member_id eq member.member_id}">
						            						<strong>${member.nickname}</strong>
						        						</c:if>
													</c:forEach>
												</p>
												<!--  작성일 -->
												<span class="date">${post.post_datetime}</span>
											</span>
										</div>
									</li>
								</ul>
							</div>
						</c:forEach>
					</c:when>
				</c:choose>

				<!-- 테스트 -->
				<!-- <div id="board-list">
					<ul class="board-ul">
						<li class="one-writing-li">
							b-m
							<div class="one-writing">
								<span class="view-ctn"> 100 </span>
								r-m
								<div class="title-inform">
									<span>[ 머릿글 ]</span> <a class="writing-title" href="#">제목</a>
									<div class="like-ctn">
										좋아요 수만큼 하트?
										<i class="icon-heart-1"></i> <i class="icon-heart-1"></i> <i class="icon-heart-1"></i> <i class="icon-heart-1"></i> <i class="icon-heart-1"></i> <i class="icon-heart-1"></i> <i class="icon-heart-1"></i> <i class="icon-heart-1"></i> <i class="icon-heart-1"></i> <i class="icon-heart-1"></i> <i class="icon-heart-1"></i> <i class="icon-heart-1"></i> <i class="icon-heart-1"></i> <i class="icon-heart-1"></i> <i class="icon-heart-1"></i>
									</div>
								</div>

								<span class="writer-inform"> 
									<a class="writer" href="#"> <strong>작성자</strong></a> 
									<span class="date">1분 전</span>
								</span>
							</div>
						</li>
					</ul>
				</div> -->
				
			</section>
		</main>

		<section class="pagination_containor">
			<ul class="pagination">
				<c:if test="${currentPage > 0}">
					<li><a href="?page=${currentPage - 1}">이전</a></li>
				</c:if>
	
				<c:forEach begin="0" end="${totalPages - 1}" varStatus="loop">
					<c:choose>
						<c:when test="${currentPage eq loop.index}">
							<li class="active"><span>${loop.index + 1}</span></li>
						</c:when>
						<c:otherwise>
							<li><a href="?page=${loop.index}">${loop.index + 1}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
	
				<c:if test="${currentPage < totalPages - 1}">
					<li><a href="?page=${currentPage + 1}">다음</a></li>
				</c:if>
			</ul>
		</section>
		
	</div>
	<script>
	
</script>
	<%@ include file="footer.jsp"%>
</body>
</html>















