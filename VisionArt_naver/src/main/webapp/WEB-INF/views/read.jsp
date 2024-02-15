<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<c:set var = "path" value = "${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title>비전아트 게시판</title>
<!-- 공유하기 -->
<script src = "${path}/resources/js/jquery-3.7.1.min.js"></script>  
<link rel="stylesheet" href="${path}/resources/css/fontello-dede59aa/css/fontello-embedded.css"  />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/board.css" />
<script src="${path}/resources/js/read.js"></script>
<script>
//현재 세션의 회원 ID를 JavaScript 변수에 할당
<%-- 	let sessionId = <%=session.getAttribute("memberid")%>; --%>
let sessionId = '<%= session.getAttribute("memberid") != null ? session.getAttribute("memberid") : "0" %>';
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
	   $("#likeBtn").on("click", function(){
		   var data = {post_id: ${readPostOne.postInfo.post_id}, member_id: sessionId};
		   
		   $.ajax({
			   url: "/post/like",
			   type: "post",
			   data: JSON.stringify(data),
			   contentType: "application/json",
			   dataType: "json",
			   success: function(response){
				   $(".icon-heart").css("color", "red");},
			   error: function(request, e){
				   alert("코드: " + request.status + "메시지: " + request.responseText + "오류: " + e);}
		   });
	   });
	};
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
				
				comment.appendChild(commentText);
				comment.appendChild(deleteBtn);
				comment.appendChild(document.createElement("hr"));
				comment.appendChild(document.createElement("br"));
				deleteBtn.style.marginTop = "-10px";
				
				commentText.innerHTML += "${one.comment_content}";
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
		if(sessionId == ${readPostOne.postInfo.member_id}){
			let isDelete = confirm("해당 댓글을 삭제하시겠습니까?");
			if (isDelete){
				$(`#${'${comment_id}'}`).remove();
				$.ajax({
					url: "/comment/delete",
					data: {"comment_id": `${'${comment_id}'}`},
					type: "post",
					dataType: "json",
					success: function(response){
						location.reload();
					},
					error: function(request, e){
						alert("코드: " + request.status + "메시지: " + request.responseText + "오류: " + e);
					}
				});
			};
		} else{
			alert("해당 댓글을 삭제할 수 있는 권한이 없습니다.");
		}
	};
	 // 게시글 수정, 삭제 버튼 클릭 시 처리 함수
	function update() {
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
      
		$("#delete").on("click", function(){         
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
</head>

<body>
	<%@ include file="header.jsp"%>
	<div class="pageClass" id="board-containor">
		<header class="navi">
			<nav class="content-nav"><!-- 사방 패딩, 스크롤 고정,  -->
				<div class="location"><!-- 왼쪽 -->
					<strong>자유 게시판</strong>
					
					<div class="contents-util"><!-- 오른쪽, 아이콘  -->
						<!-- <div class="contents-share">왼쪽으로 아코디언
							<button type="button" id="contents_share-trigger" class="icon icon-share"></button>
							<div class="shareList">
								<button class="shareList-item icon icon-chat"></button>
								<button class="shareList-item shareList-item-copy"> 주소 복사 </button>
							</div>
						</div> -->
						<button type="button" id="share" class="icon icon-share"></button>
						<button type="button" class="icon icon-heart" onclick="likeClick()" id="likeBtn"></button>
						<button type="button" class="icon icon-comment" onclick="commentInput()"></button>
						<button type="button" class="icon icon-edit-2" onclick="location.href = '${path}/post/write'" title="글쓰기"></button>
						<button type="button" class="icon icon-up-2" onclick="scrollToTop()" title="맨위로"></button>
					</div>
					
				</div>
			</nav>
		</header>
		
		<main>
			<div class="writer-container" align="center">
				<table class="table boardWrite-table">
					<thead >
						<tr>
							<th colspan="2">
								<div id="artFieldName"> [ ${art_field_name} ]</div> <!-- art_field_name-->
								<div id="title" data-post-id="${readPostOne.postInfo.post_id}">
								<h2>${readPostOne.postInfo.title}</h2>
								</div>
							</th>
						</tr>
					</thead>
					<colgroup>
						<col>
						<col>
					</colgroup>
					<tbody >
						<tr id="readTr">
							<th scope="row"><label for="writer"> ${readPostOne.postInfo.post_datetime} </label></th>
							<td>
								<div class="form-field form-field-30">
									<div class="form-field_inner form-field-submit">${readPostOne.name}</div>
										
									<div class="labelDiv">
										<label for="update" class="btn-update" id="updatePostBtn" onclick="update()">수정하기</label>
										<label for="delete" class="btn-delete" id="delete" onclick="delete()">삭제하기</label> 
									</div>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
				
			<!-- 본문 -->
			<div id="postContent" data-post-id="${post.post_id}">
				${readPostOne.postInfo.content}
				<div id="attachment" data-post-id="${post.post_id}">
					<c:forEach var="post_attachment" items="${post_attachment}">
						<c:if test="${post_attachment.post_id == readPostOne.postInfo.post_id}">
							<c:set var="post_att_path" value="${post_attachment.post_att_path}" />
							<div class="postAttachment">
								<img src="/visionart/${post_att_path}" class="postAttachment" data-post-id="${readPostOne.postInfo.post_id}">
							</div>	
						</c:if>
					</c:forEach>
				</div>
			</div>	
			<!-- 댓글 -->
				<div class="commentContainer">
					<textarea id="inputComment" rows="1" placeholder="댓글을 입력하세요."></textarea>
					<div class="labelDiv" id="labelComment">
						<label for="inputComment" class="btnLabel" id="postBtn" onclick="commentFunc()">작성 완료</label>
					</div>
					<div id="commentDiv">
						<div id="showComment"></div>
					</div>
				</div>
			</div>
		</main>	
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>















