<%@page import="com.mc.full17th2.dto.ReadPostOneDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>VisionArt</title>
<link href="${path}/css/ReadPostOne.css" rel="stylesheet">
<script src="${path}/js/jquery-3.7.1.min.js"></script>
<script src="${path}/js/ReadPostOne.js"></script>
</head>
	
<body>
	<%@ include file="header.jsp" %>

	<div class="allElements">
		<div id="body">
		<!-- 게시글 내용이 표시되는 영역 -->
			<div class="sideBar">
			 <!-- 게시글 옵션 버튼(더보기) -->
				<button class="sideBarBtn">
		<img class="sideBarImg" src="${path}/icon/more1.png" width="35" height="35"></img>
				</button>
				<div class="option">
				 <!-- 게시글 수정, 삭제 버튼 -->
					<button class="optionBtn" id="updatePostBtn" value="update">게시글
						수정</button>
					<button class="optionBtn" id="deletePostBtn" value="delete">게시글
						삭제</button>
				</div>
			</div>
	<p id="artField">${art_field_id}</p> <!-- art_field_id 표시 부분 추가 -->
	<p id="artFieldName"> ${art_field_name}</p> <!-- art_field_name-->
			<h2 id="title" data-post-id="${readPostOne.postInfo.post_id}">${readPostOne.postInfo.title}</h2>
	<div id="post">
			<div id="info">
				<p id="userName">${readPostOne.name}</p>
				<p id="date" >${readPostOne.postInfo.post_datetime}</p>
				<p id="views" >${readPostOne.postInfo.views}</p>
			</div>
	
	<c:forEach var="post_attachment" items="${post_attachment}">
    <c:if test="${post_attachment.post_id == readPostOne.postInfo.post_id}">
        <c:set var="post_att_path" value="${post_attachment.post_att_path}" />
         <img src="/visionart/${post_att_path}" class="postAttachment" data-post-id="${readPostOne.postInfo.post_id}">
        
      </c:if> </c:forEach>  
     
 
   	<div id="postContent" data-post-id="${post.post_id}">${readPostOne.postInfo.content}</div>
		</div>
</div>
		<div id="btns">
		  <!-- 좋아요, 공유 버튼 -->
			<button id="likeBtn" type="button">
				<span> <img src="${path}/icon/likeheart.png">
					<p id="likeBtnText" style="display: inline;"></p>
				</span>
			</button>
			<button id="share" type="button">
				<img src="${path}/icon/share.png">
			</button>
		</div>

		<div id="commentDiv">
		<!-- 댓글 영역 -->
			<p>댓글</p>
			
			<textarea id="inputComment" rows="5" placeholder="댓글을 입력하세요."></textarea>
			<br><br> <input type="button" id="postBtn" value="등록">
			<div id="showComment"></div>
		</div>
	</div>
<script>

	//현재 세션의 회원 ID를 JavaScript 변수에 할당
	<%-- 	let sessionId = <%=session.getAttribute("memberId")%>; --%>
	let sessionId = '<%= session.getAttribute("memberId") != null ? session.getAttribute("memberId") : "0" %>';
		$(document).ready(function(){
		// 페이지가 로드되면 실행될 함수들 호출
	   		likeBtnClick();
	   		shareBtnClick();
	   		commentFunc();
	   		updateDelMenu();
	   		increaseViews();
	   		
	   	});
		function likeBtnClick() {
		    // 좋아요 버튼 클릭 시 처리 함수
		    $("#likeBtnText").html("${readPostOne.likeCnt}");

		    $("#likeBtn").on("click", function(){
		        let post_id = ${readPostOne.postInfo.post_id};
		        let data = { post_id: post_id, member_id: sessionId };

		        if (!sessionId || sessionId === "0") {
		            alert("로그인이 필요합니다.");
		        } else {
		            $.ajax({
		                url: "/post/like",
		                type: "post",
		                data: JSON.stringify(data),
		                contentType: "application/json",
		                dataType: "json",
		                success: function(response){
		                    $("#likeBtnText").html(response);
		                },
		                error: function(request, e){
		                    alert("좋아요 요청에 실패했습니다. 다시 시도해주세요.");
		                }
		            });
		        }
		    });
		}
		function shareBtnClick() {
			// 공유 버튼 클릭 시 처리 함수
			let share = document.getElementById("share");
			
			share.onclick = () => {
				let currentUrl = location.href;
				let dummy = document.createElement("textarea");
				let url = location.href;
				
				document.body.appendChild(dummy);
				dummy.value = currentUrl;
				dummy.select();
				
				document.execCommand("copy");
				document.body.removeChild(dummy);
				
				alert("해당 URL이 복사되었습니다.");
			};
		};
		
		function commentFunc() {
			 // 댓글 관련 기능 처리 함수
			let postBtn = document.getElementById("postBtn");
			let inputComment = document.getElementById("inputComment");
			let showComment = document.getElementById("showComment");
			
			let comments = document.createElement("div");
			comments.setAttribute("id", "comments");
			
			let num = 1;
			let comment;
			let commentText;
			let deleteBtn;

			// 기존 데이터베이스에 있는 댓글 먼저 정렬
			if(${readPostOne.comments.size() > 0}){
				<c:forEach items="${readPostOne.comments}" var="one">            
					comment = document.createElement("span");
					comment.setAttribute("id", `${one.comment_id}`);
					commentText = document.createElement("p");
					commentText.setAttribute("id", "commentText");
					
					deleteBtn = document.createElement("input");
					deleteBtn.setAttribute("type", "button");
					deleteBtn.setAttribute("id", "deleteBtn");
					deleteBtn.setAttribute("value", "삭제");
					deleteBtn.setAttribute("style", "border:none; background-color:#fcf3ea; color:grey; float:right;");
					deleteBtn.setAttribute("onclick", `deleteCommentBtn(${one.comment_id})`);
					
					//deleteBtn.addEventListener("click", function() {deleteCommentBtn(one.comment_id);});
					comment.appendChild(commentText);
					comment.appendChild(deleteBtn);
					
					commentText.innerHTML += "${one.comment_content}";
					comment.innerHTML += "<br><hr>";
					comments.appendChild(comment);
					showComment.appendChild(comments);
					inputComment.value = "";
					num++;
				</c:forEach>
			}
	      
			$("#postBtn").on("click", function(){
			    var data = {comment_content: $("#inputComment").val(), member_id: sessionId, post_id: ${readPostOne.postInfo.post_id}};
				
			    if (inputComment.value != "") {            
					$.ajax({
						url: "/comment",
						data: JSON.stringify(data),
						type: "post",
						contentType: "application/json",
						dataType: "json",
						success: function(response){
							// alert("댓글 작성완료");
							location.reload();
						},
						error: function(request, e){
							alert("코드: " + request.status + "메시지: " + request.responseText + "오류: " + e);
						}
					});
				} else {
					alert("댓글을 입력해주세요.");
				}
			});
		};
		function deleteCommentBtn(comment_id) {    
		    $.ajax({
		        type: "post",
		        url: "/comment/delete/" + comment_id,  // 여기서 comment_id를 경로 변수로 전달
		        dataType: "json",
		        success: function (response) {
		            if (response.result === "ok") {
		                console.log(response.result);
		                $("#" + comment_id).remove();
		            } else {
		                alert("댓글삭제 권한이 없습니다.");
		            }
		        }
		    });
		}



		 // 게시글 수정, 삭제 버튼 클릭 시 처리 함수
		function updateDelMenu() {
			$("#updatePostBtn").on("click", function(){
				if(sessionId == ${readPostOne.postInfo.member_id}){
					let isUpdate = confirm("해당 게시물을 수정하시겠습니까?");
	            
					if (isUpdate) {
						location.href = "/post/edit/" + ${readPostOne.postInfo.post_id};
					};
				} else {
					alert("해당 게시글을 수정할 수 있는 권한이 없습니다.");
				}
	         
			});
	      
			$("#deletePostBtn").on("click", function(){         
				var data = {post_id: ${readPostOne.postInfo.post_id}};

				if(sessionId == ${readPostOne.postInfo.member_id}){
					let isDelete = confirm("해당 게시물을 삭제하시겠습니까?");
					
					if (isDelete) {
						$.ajax({
							url: "/post/delete",
							data: JSON.stringify(data),
							type: "post",
							dataType: "json",
							contentType: "application/json",
							success: function(response){
								alert("게시물 삭제성공");
								location.href = "/post";
							},
							error: function(request, e){
								alert("코드: " + request.status + "메시지: " + request.responseText + "오류: " + e);
							}
						});
					};   
				} else {
					alert("해당 게시물을 삭제할 수 있는 권한이 없습니다.");
				}
			});
		};
		
		function increaseViews() {
			
		    // 게시글 조회수 증가 처리 함수
		    $.ajax({
		        url: "${path}/post/increaseViews/${readPostOne.postInfo.post_id}",
		        type: "post",
		        success: function(response) {
		            // 조회수를 증가시키는데 성공하면 아무런 동작 필요 없음
		        },
		        error: function(request, e) {
		            console.error("조회수 증가 실패:", e);
		        }
		    });
		}
		
</script>

<%@ include file="footer.jsp" %>	
</body>
</html>