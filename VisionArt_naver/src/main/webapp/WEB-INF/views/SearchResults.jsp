<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>VisionArt</title>
<link rel="stylesheet" href="${path}/css/SearchResults.css">
<script src="${path}/js/SearchResults.js"></script>    
</head>
<body>
  <%@ include file="header.jsp" %>
    <div class="SearchResult">  
<%--    <img src="${path}/icon/new.jpg" id="icon">   --%>
     <h2>검색 결과</h2>
 <!-- part 1 -->  	 
<section class="category">
 <div id="title">
		<h5>자유 게시글</h5></div>
<section class="post">
<!--게시물 목록 섹션: ${searchAll.posts}에서 받아온 게시물 목록을 순회하며 각 게시물을 동적으로 생성
    게시물 이미지, 제목, 작성자 정보, 좋아요 정보 등을 표시  -->
     <c:if test="${not empty searchAll.posts}">
			<c:forEach var="post" items="${searchAll.posts}">
				<div class="post-box">
				
				<div class="art-field">
				<p class="art-field-name" data-post-id="${post.post_id}">
				<c:forEach var="arts" items="${searchAll.hitArts}">
				<c:if test="${arts.art_field_id eq post.art_field_id}">
				${arts.art_field_name}
				</c:if>
				</c:forEach>
				</p>
				<%-- <div class="art-field-id" data-post-id="${post.post_id}">${post.art_field_id}</div> --%>
			</div>
			<h2 class="post-title" data-post-id="${post.post_id}">${post.title}</h2>
					<div class="post-content-box"> 
					</div>
					<c:forEach var="post_attachment" items="${images}">
						<c:if test="${post_attachment.post_id == post.post_id}">
							<c:set var="post_att_path" value="${post_attachment.post_att_path}" />
						</c:if>
					</c:forEach>
					<img src="/visionart/${post_att_path}" class="post-img" data-post-id="${post.post_id}"> 
					<h4 class="post-content" data-post-id="${post.post_id}">${post.content}</h4>
					
						<div class="profile">
						<img src="${path}/icon/user.png" class="profile-img">
						<p class="profile-name">
							<c:forEach var="member" items="${searchAll.members}">
								<c:if test="${post.member_id eq member.member_id}">
            						${member.name}
        						</c:if>
							</c:forEach>
						</p>

					</div>	
					
					
				<div class="viewCount" data-post-id="${post.post_id}"> <p></p> ${post.views}</div>
				
					
	<!--좋아요 이미지 및 개수: 각 게시물에 대한 좋아요 이미지와 좋아요 개수를 표시
    좋아요 개수는 ${likeNum}에 표시되며, 이미지는 좋아요 여부에 따라 변경됨  -->
					<div class="like">
						<c:set var="likeImage" value="${path}/icon/heart.png" />

						<c:forEach var="personal" items="${likes}">
							<c:if test="${post.post_id == personal.post_id}">
								<c:set var="likeImage" value="${path}/icon/redheart.png" />
							</c:if>
						</c:forEach>

						<img src="${likeImage}" class="like-img"
							data-member-id="${session.getAttribute('memberId')}"
							data-post-id="${post.post_id}">

						<p class="like-num">
							<c:set var="likeNum" value="0" />
							<c:forEach var="like" items="${likeTotal}">
								<c:if test="${like.post_id == post.post_id}">
									<c:set var="likeNum" value="${likeNum + 1}" />
								</c:if>
							</c:forEach>
							${likeNum}
						</p>
					</div>
				</div>
			</c:forEach>

 </c:if>

    <c:if test="${empty searchAll.posts}">
        <p id="notExist">해당 검색어가 포함된 자유 게시판 게시물이 존재하지 않습니다.</p>
    </c:if>
		</section></section>
	<!-- part 2 -->
	<section class="category">
	
	<div id="title">
	<%-- <img src="${path}/icon/new.jpg"> --%>
		<h5>유저 갤러리</h5></div>
		<section class="post">
<!--게시물 목록 섹션:
    ${searchAllUg.posts}에서 받아온 게시물 목록을 순회하며 각 게시물을 동적으로 생성
    게시물 이미지, 제목, 작성자 정보, 좋아요 정보 등을 표시  -->
     <c:if test="${not empty searchAllUg.posts}">
     
			<c:forEach var="post" items="${searchAllUg.posts}">
				<div class="post-box">
					<div class="art-field">
				<p class="art-field-name" data-post-id="${post.post_id}">
				<c:forEach var="arts" items="${searchAllUg.arts}">
				<c:if test="${arts.art_field_id eq post.art_field_id}">
				${arts.art_field_name}
				</c:if>
				</c:forEach>
				</p>
				<%-- <div class="art-field-id" data-post-id="${post.post_id}">${post.art_field_id}</div> --%>
			</div>
			
					<c:forEach var="post_attachment" items="${images}">
						<c:if test="${post_attachment.post_id == post.post_id}">
							<c:set var="post_att_path" value="${post_attachment.post_att_path}" />
						</c:if>
					</c:forEach>
					
					<img src="/visionart/${post_att_path}" class="post-img2" data-post-id="${post.post_id}">
					
					<h2 class="post-title2" data-post-id="${post.post_id}">${post.title}</h2>
					
				
					
					<div class="profile">
						<img src="${path}/icon/user.png" class="profile-img">
						<p class="profile-name">
							<c:forEach var="member" items="${searchAllUg.members}">
								<c:if test="${post.member_id eq member.member_id}">
            						${member.name}
        						</c:if>
							</c:forEach>
						</p>

					</div>
				
					
					<div class="viewCount" data-post-id="${post.post_id}"> <p> </p> ${post.views}</div>
	<!--좋아요 이미지 및 개수: 각 게시물에 대한 좋아요 이미지와 좋아요 개수를 표시
    좋아요 개수는 ${likeNum}에 표시되며, 이미지는 좋아요 여부에 따라 변경됨  -->
					<div class="like">
						<c:set var="likeImage" value="${path}/icon/heart.png" />

						<c:forEach var="personal" items="${likes}">
							<c:if test="${post.post_id == personal.post_id}">
								<c:set var="likeImage" value="${path}/icon/redheart.png" />
							</c:if>
						</c:forEach>

						<img src="${likeImage}" class="like-img"
							data-member-id="${session.getAttribute('memberId')}"
							data-post-id="${post.post_id}">

						<p class="like-num">
							<c:set var="likeNum" value="0" />
							<c:forEach var="like" items="${likeTotal}">
								<c:if test="${like.post_id == post.post_id}">
									<c:set var="likeNum" value="${likeNum + 1}" />
								</c:if>
							</c:forEach>
							${likeNum}
						</p>
					</div>
				</div>
			</c:forEach>

    </c:if>

    <c:if test="${empty searchAllUg.posts}">
        <p id="notExist">해당 검색어가 포함된 유저갤러리의 작품이 존재하지 않습니다.</p>
    </c:if>
</section>
		</section>

	<!-- part3 -->
	
	<section class="category">
	
		<div id="title">
<%-- 	<img src="${path}/icon/new.jpg"> --%>
		<h5>명화 갤러리</h5></div>
			<section class="post">
<!--게시물 목록 섹션:
    ${searchAllFg.posts}에서 받아온 게시물 목록을 순회하며 각 게시물을 동적으로 생성
    게시물 이미지, 제목, 작성자 정보, 좋아요 정보 등을 표시  -->
    <c:if test="${not empty searchAllFg.posts}"> 
    
			<c:forEach var="post" items="${searchAllFg.posts}">
				<div class="post-box">
					<div class="art-field">
				<p class="art-field-name" data-post-id="${post.post_id}">
				<c:forEach var="arts" items="${searchAllFg.arts}">
				<c:if test="${arts.art_field_id eq post.art_field_id}">
				${arts.art_field_name}
				</c:if>
				</c:forEach>
				</p>
				
<div class="art-field-id" data-post-id="${post.post_id}" style="display: none;">${post.art_field_id}</div>
			
			</div>
			
					<c:forEach var="post_attachment" items="${images}">
						<c:if test="${post_attachment.post_id == post.post_id}">
							<c:set var="post_att_path" value="${post_attachment.post_att_path}" />
						</c:if>
					</c:forEach>
					
					<img src="/visionart/${post_att_path}" class="post-img3" data-post-id="${post.post_id}">
					
					<h2 class="post-title3" data-post-id="${post.post_id}">${post.title}</h2>
					
				
					
					<div class="profile">
						<img src="${path}/icon/user.png" class="profile-img">
						<p class="profile-name">
							<c:forEach var="member" items="${searchAllFg.members}">
								<c:if test="${post.member_id eq member.member_id}">
            						${member.name}
        						</c:if>
							</c:forEach>
						</p>

					</div>
				
					
					<div class="viewCount" data-post-id="${post.post_id}"> <p>조회수 </p> ${post.views}</div>
	<!--좋아요 이미지 및 개수: 각 게시물에 대한 좋아요 이미지와 좋아요 개수를 표시
    좋아요 개수는 ${likeNum}에 표시되며, 이미지는 좋아요 여부에 따라 변경됨  -->
					<div class="like">
						<c:set var="likeImage" value="${path}/icon/heart.png" />

						<c:forEach var="personal" items="${likes}">
							<c:if test="${post.post_id == personal.post_id}">
								<c:set var="likeImage" value="${path}/icon/redheart.png" />
							</c:if>
						</c:forEach>

						<img src="${likeImage}" class="like-img"
							data-member-id="${session.getAttribute('memberId')}"
							data-post-id="${post.post_id}">

						<p class="like-num">
							<c:set var="likeNum" value="0" />
							<c:forEach var="like" items="${likeTotal}">
								<c:if test="${like.post_id == post.post_id}">
									<c:set var="likeNum" value="${likeNum + 1}" />
								</c:if>
							</c:forEach>
							${likeNum}
						</p>
					</div>
				</div>
			</c:forEach>
</c:if>
	 <c:if test="${empty searchAllFg.posts}">
        <p id="notExist">해당 검색어가 포함된 게시물이 존재하지 않습니다.</p>
    </c:if>
</section></section>
	
	<!-- part 4 -->
		<section class="category">
	
		<div id="title">
	<%-- <img src="${path}/icon/new.jpg"> --%>
		<h5>작품 분류</h5></div>
		<section class="post">
<!--게시물 목록 섹션:
    ${searchAllCategory.posts}에서 받아온 게시물 목록을 순회하며 각 게시물을 동적으로 생성
    게시물 이미지, 제목, 작성자 정보, 좋아요 정보 등을 표시  -->
      <c:if test="${not empty searchAllCategory.posts}">
			<c:forEach var="post" items="${searchAllCategory.posts}">
				<div class="post-box">
					<div class="art-field">
				<p class="art-field-name" data-post-id="${post.post_id}" data-post-field-id="${post.post_field_id}">
				<c:forEach var="arts" items="${searchAllCategory.arts}">
				<c:if test="${arts.art_field_id eq post.art_field_id}">
				${arts.art_field_name}
				</c:if>
				</c:forEach>
				</p>
				<%-- <div class="art-field-id" data-post-id="${post.post_id}">${post.art_field_id}</div> --%>
			</div>
			
					<c:forEach var="post_attachment" items="${images}">
						<c:if test="${post_attachment.post_id == post.post_id}">
							<c:set var="post_att_path" value="${post_attachment.post_att_path}" />
						</c:if>
					</c:forEach>
					
					<img src="/visionart/${post_att_path}" class="post-img4" data-post-id="${post.post_id}" data-post-field-id="${post.post_field_id}">
					
					<h2 class="post-title4" data-post-id="${post.post_id}">${post.title}</h2>
					
				
					
					<div class="profile">
						<img src="${path}/icon/user.png" class="profile-img">
						<p class="profile-name">
							<c:forEach var="member" items="${searchAllCategory.members}">
								<c:if test="${post.member_id eq member.member_id}">
            						${member.name}
        						</c:if>
							</c:forEach>
						</p>

					</div>
				
					
					<div class="viewCount" data-post-id="${post.post_id}"> <p> </p> ${post.views}</div>
	<!--좋아요 이미지 및 개수: 각 게시물에 대한 좋아요 이미지와 좋아요 개수를 표시
    좋아요 개수는 ${likeNum}에 표시되며, 이미지는 좋아요 여부에 따라 변경됨  -->
					<div class="like">
						<c:set var="likeImage" value="${path}/icon/heart.png" />

						<c:forEach var="personal" items="${likes}">
							<c:if test="${post.post_id == personal.post_id}">
								<c:set var="likeImage" value="${path}/icon/redheart.png" />
							</c:if>
						</c:forEach>

						<img src="${likeImage}" class="like-img"
							data-member-id="${session.getAttribute('memberId')}"
							data-post-id="${post.post_id}">

						<p class="like-num">
							<c:set var="likeNum" value="0" />
							<c:forEach var="like" items="${likeTotal}">
								<c:if test="${like.post_id == post.post_id}">
									<c:set var="likeNum" value="${likeNum + 1}" />
								</c:if>
							</c:forEach>
							${likeNum}
						</p>
					</div>
				</div>
			</c:forEach>
</c:if>

    <c:if test="${empty searchAllCategory.posts}">
        <p id="notExist">해당 검색어가 포함된 자유게시판의 분류 또는 유저 또는 명화갤러리 분류가 존재하지 않습니다.</p>
    </c:if>
</section></section>
	<!-- part 5 -->
		<section class="category">
	
		<div id="title">
	<%-- <img src="${path}/icon/new.jpg"> --%>
		<h5>작가 분류</h5></div>
		<section class="post">
<!--게시물 목록 섹션:
    ${searchAllAuthor.posts}에서 받아온 게시물 목록을 순회하며 각 게시물을 동적으로 생성
    게시물 이미지, 제목, 작성자 정보, 좋아요 정보 등을 표시  -->
      <c:if test="${not empty searchAllAuthor.posts}">
			<c:forEach var="post" items="${searchAllAuthor.posts}">
				<div class="post-box">
					<div class="art-field">
				<p class="art-field-name" data-post-id="${post.post_id}" data-post-field-id="${post.post_field_id}">
				<c:forEach var="arts" items="${searchAllAuthor.arts}">
				<c:if test="${arts.art_field_id eq post.art_field_id}">
				${arts.art_field_name}
				</c:if>
				</c:forEach>
				</p>
				<%-- <div class="art-field-id" data-post-id="${post.post_id}">${post.art_field_id}</div> --%>
			</div>
			
					<c:forEach var="post_attachment" items="${images}">
						<c:if test="${post_attachment.post_id == post.post_id}">
							<c:set var="post_att_path" value="${post_attachment.post_att_path}" />
						</c:if>
					</c:forEach>
					
					<img src="/visionart/${post_att_path}" class="post-img4" data-post-id="${post.post_id}" data-post-field-id="${post.post_field_id}">
					
					<h2 class="post-title4" data-post-id="${post.post_id}">${post.title}</h2>
					
				
					
					<div class="profile">
						<img src="${path}/icon/user.png" class="profile-img">
						<p class="profile-name">
							<c:forEach var="member" items="${searchAllAuthor.members}">
								<c:if test="${post.member_id eq member.member_id}">
            						${member.name}
        						</c:if>
							</c:forEach>
						</p>

					</div>
				
					
					<div class="viewCount" data-post-id="${post.post_id}"> <p> </p> ${post.views}</div>
	<!--좋아요 이미지 및 개수: 각 게시물에 대한 좋아요 이미지와 좋아요 개수를 표시
    좋아요 개수는 ${likeNum}에 표시되며, 이미지는 좋아요 여부에 따라 변경됨  -->
					<div class="like">
						<c:set var="likeImage" value="${path}/icon/heart.png" />

						<c:forEach var="personal" items="${likes}">
							<c:if test="${post.post_id == personal.post_id}">
								<c:set var="likeImage" value="${path}/icon/redheart.png" />
							</c:if>
						</c:forEach>

						<img src="${likeImage}" class="like-img"
							data-member-id="${session.getAttribute('memberId')}"
							data-post-id="${post.post_id}">

						<p class="like-num">
							<c:set var="likeNum" value="0" />
							<c:forEach var="like" items="${likeTotal}">
								<c:if test="${like.post_id == post.post_id}">
									<c:set var="likeNum" value="${likeNum + 1}" />
								</c:if>
							</c:forEach>
							${likeNum}
						</p>
					</div>
				</div>
			</c:forEach>
</c:if>

    <c:if test="${empty searchAllAuthor.posts}">
        <p id="notExist">해당 검색어가 포함된 작가가 존재하지 않습니다.</p>
    </c:if>
</section>
<!-- 페이지네이션 섹션:${currentPage}, ${totalPages} 등을 사용하여 페이지네이션을 생성함
    현재 페이지는 "active" 클래스를 가지며, 페이지를 클릭하면 해당 페이지로 이동하도록 링크가 설정됨 -->
<section class="page-area">
		<ul class="paging">
			<c:if test="${totalPages > 1}">
				<li><a href="?page=${currentPage - 1}">이전</a></li>
			</c:if>
<c:if test="${totalPages > 0}">
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
</c:if>
			<c:if test="${currentPage < totalPages - 1}">
				<li><a href="?page=${currentPage + 1}">다음</a></li>
			</c:if>
		</ul>
</section>
            
   </section>         
            
   
    </div>
<script>
document.addEventListener('DOMContentLoaded', function() {
    // post_id를 클릭한 postBox에서 가져와서 새로운 URL로 이동
    let sessionId = '<%= session.getAttribute("memberId") != null ? session.getAttribute("memberId") : "0" %>';
    let postTitles = document.querySelectorAll('.post-title');
    let postImages = document.querySelectorAll('.post-img');
    let likeImages = document.querySelectorAll('.like-img');
	let likeNums = document.querySelectorAll('.like-num');
    
    postTitles.forEach(function(postTitle) {
        postTitle.addEventListener('click', function() {
            let post_id = postTitle.dataset.postId; 
            location.href = 'http://localhost:9071/post/' + post_id; //To Read Post One
        });
    });
    
    postImages.forEach(function(postImage) {
        postImage.addEventListener('click', function() {
            let post_id = postImage.dataset.postId; 
            location.href = 'http://localhost:9071/post/' + post_id; //To Read Post One
        });
    });
    
    likeImages.forEach(function(likeImage) {
        likeImage.addEventListener('click', function() {
            let post_id = likeImage.dataset.postId;
            let member_id = likeImage.dataset.memberId; 
            
            if (sessionId === "0") {
                alert("로그인이 필요합니다.");
            } else {
                // 기존의 fetch 코드 유지
                fetch('http://localhost:9071/post?post_id=' + post_id + '&member_id=' + member_id, {
                    method: 'GET',
                    headers: {
                        'Content-Type': 'application/json',
                        // You can add more headers if needed
                    },
                })
                .then(() => {
                    location.reload();
                });
            }
        });
    });
});


document.addEventListener('DOMContentLoaded', function() {
    // post_id를 클릭한 postBox에서 가져와서 새로운 URL로 이동
    let postTitles = document.querySelectorAll('.post-title2');
    let postImages = document.querySelectorAll('.post-img2');
    let likeImages = document.querySelectorAll('.like-img');
	let likeNums = document.querySelectorAll('.like-num');
    
    postTitles.forEach(function(postTitle) {
        postTitle.addEventListener('click', function() {
            let post_id = postTitle.dataset.postId; 
            location.href = 'http://localhost:9071/ug/' + post_id; //To Read Post One
        });
    });
    
    postImages.forEach(function(postImage) {
        postImage.addEventListener('click', function() {
            let post_id = postImage.dataset.postId; 
            location.href = 'http://localhost:9071/ug/' + post_id; //To Read Post One
        });
    });
    
   
});

document.addEventListener('DOMContentLoaded', function() {
    // post_id를 클릭한 postBox에서 가져와서 새로운 URL로 이동
    let postTitles = document.querySelectorAll('.post-title3');
    let postImages = document.querySelectorAll('.post-img3');
    let likeImages = document.querySelectorAll('.like-img');
	let likeNums = document.querySelectorAll('.like-num');
    
    postTitles.forEach(function(postTitle) {
        postTitle.addEventListener('click', function() {
            let post_id = postTitle.dataset.postId; 
            location.href = 'http://localhost:9071/fg/' + post_id; //To Read Post One
        });
    });
    
    postImages.forEach(function(postImage) {
        postImage.addEventListener('click', function() {
            let post_id = postImage.dataset.postId; 
            location.href = 'http://localhost:9071/fg/' + post_id; //To Read Post One
        });
    });
    
   
});
document.addEventListener('DOMContentLoaded', function() {
    // post_id를 클릭한 postBox에서 가져와서 새로운 URL로 이동
    let postTitles = document.querySelectorAll('.post-title4');
    let postImages = document.querySelectorAll('.post-img4');
    let likeImages = document.querySelectorAll('.like-img');
	let likeNums = document.querySelectorAll('.like-num');
	
    
    postTitles.forEach(function(postTitle) {
        postTitle.addEventListener('click', function() {
             let post_id = postTitle.dataset.postId;
            let post_field_id = postTitle.dataset.postFieldId;

            if (post_field_id === "1") {
                location.href = 'http://localhost:9071/ug/' + post_id;
            } else if (post_field_id === "2") {
                location.href = 'http://localhost:9071/fg/' + post_id;
            }
        });
    });
    
    postImages.forEach(function(postImage) {
        postImage.addEventListener('click', function() {
             let post_id = postImage.dataset.postId;
            let post_field_id = postImage.dataset.postFieldId;

            if (post_field_id === "1") {
                location.href = 'http://localhost:9071/ug/' + post_id;
            } else if (post_field_id === "2") {
                location.href = 'http://localhost:9071/fg/' + post_id;
            }
        });
    });

    
  
});
</script>
<%@ include file="footer.jsp" %>
</body>
</html>