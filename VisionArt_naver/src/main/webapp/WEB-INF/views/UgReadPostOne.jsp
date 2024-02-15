<%@page import="com.mc.full17th2.dto.UgReadPostOneDTO"%>
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
<link href="${path}/css/UgReadPostOne.css" rel="stylesheet">
<script src="${path}/js/jquery-3.7.1.min.js"></script>
<script src="${path}/js/UgReadPostOne.js"></script>
</head>
<script>
<%-- 	let sessionId = <%=session.getAttribute("memberId")%>; --%>
let sessionId = '<%= session.getAttribute("memberId") != null ? session.getAttribute("memberId") : "0" %>';
	$(document).ready(function(){
   		showData();
   		likeBtnClick();
   		shareBtnClick();
   		commentFunc();
   		updateDelMenu();
   		increaseViews();
   	});
	
   	function showData(){
   		$("#title").html("${ugReadPostOne.ugPostInfo.title}");
		$("#userName").html("${ugReadPostOne.ugName}");
		$("#date").html("${ugReadPostOne.ugPostInfo.post_datetime}");
		//$("#postContent").html("<h4>${ugReadPostOne.ugPostInfo.content}</h4>");
		$("#views").html("조회수: ${ugReadPostOne.ugPostInfo.views}");

		if(${post_attachment.size() != 0}){         
			let post_att_id = [];
			let post_att_path = [];
			let post_id = [];
               
			<c:forEach items="${post_attachment}" var="one">
			post_att_id.push("${one.post_att_id}");
			post_att_path.push("${one.post_att_path}");
				post_id.push("${one.post_id}");
			</c:forEach>
      
			for (var i = 0; i < post_att_path.length; i++) {
				$("#postContent").append("<img id='postImg' src=/visionart/" + post_att_path[i] + " width=55% height=55%>");
			}
			$("#postContent").append("<br>");
			$("#postImg").css("padding-right", "10px");
			 // 여기서 게시글 내용을 추가
	        $("#postContent").append("<h4>${ugReadPostOne.ugPostInfo.content}</h4>");
		 } else {
		     // 이미지가 없는 경우에는 그냥 게시글 내용만 추가
		    $("#postContent").html("<h4>${ugReadPostOne.ugPostInfo.content}</h4>");
			
		}
	};
	
	function likeBtnClick() {
	    // 좋아요 버튼 클릭 시 처리 함수
	    $("#likeBtnText").html("${ugReadPostOne.uglikeCnt}");

	    $("#likeBtn").on("click", function(){
	        let post_id = ${ugReadPostOne.ugPostInfo.post_id};
	        let data = { post_id: post_id, member_id: sessionId };

	        if (!sessionId || sessionId === "0") {
	            alert("로그인이 필요합니다.");
	        } else {
	            $.ajax({
	                url: "/ug/like",
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
		if(${ugReadPostOne.ugcomments.size() > 0}){
			<c:forEach items="${ugReadPostOne.ugcomments}" var="one">            
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
				
				commentText.innerHTML += "${one.comment_content}";
				comment.innerHTML += "<br><hr>";
				comments.appendChild(comment);
				showComment.appendChild(comments);
				inputComment.value = "";
				num++;
			</c:forEach>
		}
      
		$("#postBtn").on("click", function(){
		    var data = {comment_content: $("#inputComment").val(), member_id: sessionId, post_id: ${ugReadPostOne.ugPostInfo.post_id}};
			
		    if (inputComment.value != "") {            
				$.ajax({
					url: "/ug/comment",
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
	        url: "/ug/comment/delete/" + comment_id,  // 여기서 comment_id를 경로 변수로 전달
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



   
	function updateDelMenu() {
		$("#updatePostBtn").on("click", function(){
			if(sessionId == ${ugReadPostOne.ugPostInfo.member_id}){
				let isUpdate = confirm("해당 게시물을 수정하시겠습니까?");
            
				if (isUpdate) {
					location.href = "/ug/edit/" + ${ugReadPostOne.ugPostInfo.post_id};
				};
			} else {
				alert("해당 게시글을 수정할 수 있는 권한이 없습니다.");
			}
         
		});
      
		$("#deletePostBtn").on("click", function(){         
			var data = {post_id: ${ugReadPostOne.ugPostInfo.post_id}};
         
			if(sessionId == ${ugReadPostOne.ugPostInfo.member_id}){
				let isDelete = confirm("해당 게시물을 삭제하시겠습니까?");
				
				if (isDelete) {
					$.ajax({
						url: "/ug/delete",
						data: JSON.stringify(data),
						type: "post",
						dataType: "json",
						contentType: "application/json",
						success: function(response){
							alert("게시물 삭제성공");
							location.href = "/ug";
							console.log("Post deleted successfully");
						},
						error: function(request, e){
							console.error("Error deleting post", error);
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
	        url: "${path}/ug/increaseViews/${ugReadPostOne.ugPostInfo.post_id}",
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
<body>
<%@ include file="header.jsp" %>
	<div class="allElements">
		<div id="body">
			<div class="sideBar">
				<button class="sideBarBtn">
					<img class="sideBarImg"
						src="${path}/icon/more1.png" width="35"
						height="35"></img>
				</button>
				<div class="option">
					<button class="optionBtn" id="updatePostBtn" value="update">게시글
						수정</button>
					<button class="optionBtn" id="deletePostBtn" value="delete">게시글
						삭제</button>
				</div>
			</div>
<p id="artField">${art_field_id}</p> <!-- art_field_id 표시 부분  -->
<p id="artFieldName"> ${art_field_name}</p> <!-- art_field_name-->
			<h2 id="title">게시글 제목</h2>
			<div id="info">
				<p id="userName" style="display: inline;"></p>
				<p id="date" style="display: inline;"></p>
				<p id="views" style="display: inline;"></p> 
			</div>
			
			<div id="postContent">
			<br>
			</div>
		</div>
		<div id="btns">
			<button id="likeBtn" type="button">
				<span> <img src="${path}/icon/likeheart.png">
					<p id="likeBtnText" style="display: inline;">0</p>
				</span>
			</button>
			<button id="share" type="button">
				<img src="${path}/icon/share.png">
			</button>
		</div>

		<div id="commentDiv">
			<p>댓글</p>
			<textarea id="inputComment" rows="5" placeholder="댓글을 입력하세요."></textarea>
			<br> <input type="button" id="postBtn" value="등록">
			<div id="showComment"></div>
		</div>
	</div>
<%@ include file="footer.jsp" %>
</body>
</html>