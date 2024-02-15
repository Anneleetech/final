<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>VisionArt</title>
<link href="${path}/css/home.css" rel="stylesheet">
<script src="${path}/js/home.js"></script>

</head>
<body>
<%@ include file="header.jsp" %>
<!-- part 1 -->
<div id="title">
	<img src="${path}/icon/new.jpg">
		<h2>최근 게시글</h2></div>
		
<section class="hitHome">
	<div id="body1">
		<c:forEach var="post" items="${hitHome.hitPosts}">
		<div class="postBox1">
		
		<div class="art-field">
	<p class="art-field-name1" data-post-id="${post.post_id}">
		<c:forEach var="arts" items="${hitHome.hitArts}">
		<c:if test="${arts.art_field_id eq post.art_field_id}">
		${arts.art_field_name}
		</c:if></c:forEach>
	</p><%-- <div class="art-field-id" data-post-id="${post.post_id}">${post.art_field_id}</div> --%>
   </div>
	
		
		 <c:forEach var="post_attachment" items="${images}">
	  <c:if test="${post_attachment.post_id == post.post_id}">
		<c:set var="post_att_path" value="${post_attachment.post_att_path}" /> 
	</c:if></c:forEach> 
<img src="/visionart/${post_att_path}" class="post-img1" data-post-id="${post.post_id}" data-post-field-id="${post.post_field_id}">

 
	<a class="post-subject1" data-post-id="${post.post_id}" data-post-field-id="${post.post_field_id}">
    ${post.title}
</a>
	
	
			
		<div class="post-content-box"> 
		<h4 class="post-content" data-post-id="${post.post_id}">${post.content}</h4>
		</div>
			
	<div class="profile1">
		<img src="${path}/icon/user.png" class="profile-img">
		<span class="profile-name1">
		<c:forEach var="member" items="${hitHome.members}">
		<c:if test="${post.member_id eq member.member_id}">
         ${member.name}
        </c:if></c:forEach>
		</span>
	</div>
		<span class="viewCount" data-post-id="${post.post_id}"> ${post.views}</span>
	<span class="like1">
		<c:set var="likeImage" value="${path}/icon/heart.png" />
		<c:forEach var="personal" items="${likes}">
		<c:if test="${post.post_id == personal.post_id}">
		<c:set var="likeImage" value="${path}/icon/redheart.png" />
		</c:if>
		</c:forEach>

		<img src="${likeImage}" class="like-img"
    data-member-id="${session.getAttribute('memberId')}"
    data-post-id="${post.post_id}"
    data-post-field-id="${post.post_field_id}">

		<p class="like-num">
		<c:set var="likeNum" value="0" />
		<c:forEach var="like" items="${likeTotal}">
		<c:if test="${like.post_id == post.post_id}">
		<c:set var="likeNum" value="${likeNum + 1}" />
		</c:if>
		</c:forEach>
		${likeNum}</p></span></div>
		</c:forEach>
		</div>
		</section>
		</div>
		
	<!-- part 2 -->
	<div>
		<div id="title">
			<img src="${path}/icon/best.jpg">
			<h2> 최고의 작품 </h2>
		</div>
		<div id="body2">
			<c:forEach var="popPost" items="${pophome.posts}" varStatus="status">
				<div class="p-box">
					<c:forEach var="post_attachment" items="${images}">
						<c:if test="${post_attachment.post_id == popPost.post_id}">
							<c:set var="post_att_path" value="${post_attachment.post_att_path}" />
						</c:if>
					</c:forEach>
					<c:if test="${status.index == 0}">
						<img src="${path}/icon/medal1.jpg" class="topClass">
					</c:if>
					<c:if test="${status.index == 1}">
						<img src="${path}/icon/medal2.jpg" class="topClass">
					</c:if>
					<c:if test="${status.index == 2}">
						<img src="${path}/icon/medal3.jpg" class="topClass">
					</c:if>
			<img src="/visionart/${post_att_path}" class="post-img" data-post-id="${popPost.post_id}" data-post-field-id="${popPost.post_field_id}">
					<a class="post-subject" data-post-id="${popPost.post_id}" data-post-field-id="${popPost.post_field_id}">
    ${popPost.title}
</a>
						
			<div class="art-field">
				<p class="art-field-name" data-post-id="${popPost.post_id}">
				<c:forEach var="arts" items="${pophome.arts}">
				<c:if test="${arts.art_field_id eq popPost.art_field_id}">
				${arts.art_field_name}
				</c:if>
				</c:forEach>
				</p>
				<%-- <div class="art-field-id" data-post-id="${post.post_id}">${post.art_field_id}</div> --%>
			</div>
			<span class="viewCount" data-post-id="${popPost.post_id}"> ${popPost.views}</span>
					<div class="profile">
			<img src="${path}/icon/user.png" class="profile-img">
						<span class="profile-name">
							<c:forEach var="member" items="${pophome.members}">
								<c:if test="${popPost.member_id eq member.member_id}">
            						${member.name}
        						</c:if>
							</c:forEach>
						</span>
					</div>
					<div class="like">
						<c:set var="likeImage" value="${path}/icon/heart.png" />

						<c:forEach var="personal" items="${likes}">
							<c:if test="${popPost.post_id == personal.post_id}">
								<c:set var="likeImage" value="${path}/icon/redheart.png" />
							</c:if>
						</c:forEach>

						<img src="${likeImage}" class="like-img"
		    data-member-id="${session.getAttribute('memberId')}"
		    data-post-id="${popPost.post_id}"
		    data-post-field-id="${popPost.post_field_id}">

						<p class="like-num">
							<c:set var="likeNum" value="0" />
							<c:forEach var="like" items="${likeTotal}">
								<c:if test="${like.post_id == popPost.post_id}">
									<c:set var="likeNum" value="${likeNum + 1}" />
								</c:if>
							</c:forEach>
							${likeNum}
						</p>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<div>
		<!-- 3 //only art -->
		<div id="title">
			<img src="${path}/icon/All.png">
			<h2>전체 작품</h2>
		</div>
	
	<section class="home">
		<div id="body3">
			<c:forEach var="post" items="${home.postsForGallery}">
				<div class="postBox">
				<div class="art-field">
				<p class="art-field-name" data-post-id="${post.post_id}">
				<c:forEach var="arts" items="${home.arts}">
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
<img src="/visionart/${post_att_path}" class="post-img" data-post-id="${post.post_id}" data-post-field-id="${post.post_field_id}">
					<a class="post-subject" data-post-id="${post.post_id}" data-post-field-id="${post.post_field_id}">
    ${post.title}
</a>
		
		<span class="viewCount" data-post-id="${post.post_id}"> ${post.views}</span>	
					
					<div class="profile">
						<img src="${path}/icon/user.png" class="profile-img">
						<span class="profile-name">
							<c:forEach var="member" items="${home.members}">
								<c:if test="${post.member_id eq member.member_id}">
            						${member.name}
        						</c:if>
							</c:forEach>
						</span>
					</div>
					<span class="like">
						<c:set var="likeImage" value="${path}/icon/heart.png" />

						<c:forEach var="personal" items="${likes}">
							<c:if test="${post.post_id == personal.post_id}">
								<c:set var="likeImage" value="${path}/icon/redheart.png" />
							</c:if>
						</c:forEach>

						<img src="${likeImage}" class="like-img"
    data-member-id="${session.getAttribute('memberId')}"
    data-post-id="${post.post_id}"
    data-post-field-id="${post.post_field_id}">

						<p class="like-num">
							<c:set var="likeNum" value="0" />
							<c:forEach var="like" items="${likeTotal}">
								<c:if test="${like.post_id == post.post_id}">
									<c:set var="likeNum" value="${likeNum + 1}" />
								</c:if>
							</c:forEach>
							${likeNum}
						</p>
					</span>
				</div>
			</c:forEach>
		</div>
	</section>
	</div>
		
<section class="page-area">
		<ul class="paging">
			<c:if test="${totalPages > 0}">
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
<script>


document.addEventListener('DOMContentLoaded', function() {
	let sessionId = '<%= session.getAttribute("memberId") != null ? session.getAttribute("memberId") : "0" %>';
	// post_id를 클릭한 postBox에서 가져와서 새로운 URL로 이동
	let postSubjects = document.querySelectorAll('.post-subject');
	let postSubjects1 = document.querySelectorAll('.post-subject1');
	let postImages = document.querySelectorAll('.post-img');
	let postImages1 = document.querySelectorAll('.post-img1');
	let likeImages = document.querySelectorAll('.like-img');
	let likeNums = document.querySelectorAll('.like-num');
	
	postSubjects.forEach(function(postSubject) {
		postSubject.addEventListener('click', function() {
			
					let post_id = postSubject.dataset.postId; 
					let post_field_id = postSubject.dataset.postFieldId;
            console.log("post_id:", post_id);
            console.log("post_field_id:", post_field_id);
			     if (post_field_id === "1") {
                location.href = 'http://localhost:9071/ug/' + post_id;
            } else if (post_field_id === "2") {
                location.href = 'http://localhost:9071/fg/' + post_id;
            }
        });
    });
		postSubjects1.forEach(function(postSubject1) {
		postSubject1.addEventListener('click', function() {
					let post_id = postSubject1.dataset.postId; 
					location.href = 'http://localhost:9071/post/' + post_id;
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
	postImages1.forEach(function(postImage1) {
			postImage1.addEventListener('click', function() {
					let post_id = postImage1.dataset.postId; 
					location.href = 'http://localhost:9071/post/' + post_id;
			});
	});
	
	likeImages.forEach(function(likeImage) {
        likeImage.addEventListener('click', function() {
            let post_id = likeImage.dataset.postId; 
            let member_id = likeImage.dataset.memberId; 
            if (sessionId === "0") {
                alert("로그인이 필요합니다.");
            } else {
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
</script>
<%@ include file="footer.jsp" %>
</body>
</html>
