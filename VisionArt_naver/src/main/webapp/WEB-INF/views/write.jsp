<%@page import="com.mc.full17th2.dto.PostDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!-- post_field_id title content file -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<!-- 공유하기 -->
<script src="${path}/resources/js/jquery-3.7.1.min.js"></script>
<script src="${path}/resources/js/board.js"></script>
<link rel="stylesheet" href="${path}/resources/css/fontello-dede59aa/css/fontello-embedded.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/board.css" />
</head>

<body>
<% 
	String id = null;

// 로그인
if (session.getAttribute("id") != null) {
    id = (String) session.getAttribute("id");
} else {
    // 로그인하지 않은 경우
    out.println("<script> alert('로그인을 해주세요'); </script>");
}
%>

	<%@ include file="header.jsp"%>
	<div class="pageClass" id="board-containor">
		<header class="navi">
			<nav class="content-nav">
				<!-- 사방 패딩, 스크롤 고정,  -->
				<div class="location">
					<!-- 왼쪽 -->
					<strong>자유 게시판 글쓰기</strong>

					<div class="contents-util">
						<!-- 오른쪽, 아이콘  -->
						<div class="contents-share">
							<!-- 왼쪽으로 아코디언 -->
							<!-- 						<button type="button" id="contents_share-trigger" class="icon icon-share" title="공유하기"></button> -->
							<div class="shareList">
								<!-- 카톡api? -->
								<!-- 								<button class="shareList-item icon icon-chat" title="카톡공유"></button> -->
								<!-- 								<button class="shareList-item shareList-item-copy">주소 복사</button> -->
							</div>
						</div>
						<!-- 						<button type="button" class="icon icon-heart" title="좋아요"></button> -->
						<!-- 						<button type="button" class="icon icon-comment" title="댓글"></button> -->
						<%-- 						<button type="button" class="icon icon-edit-2" onclick="location.href = '${path}/post/write'" title="글쓰기"></button> --%>
						<button type="button" class="icon icon-up-2" onclick="scrollToTop()" title="맨위로"></button>
					</div>

				</div>

			</nav>
		</header>
		<main>
		
		

			<!-- 게시판 글쓰기 -->
			<div class="writer-container" align="center">
				<form method="post" action="/post/write" enctype="multipart/form-data">
					<table class="table boardWrite-table">
						<thead>
							<tr>
								<th colspan="2">글쓰기</th>
							</tr>
						</thead>
						<colgroup>
							<col>
							<col>
						</colgroup>
						<tbody>
							<tr>
								<th scope="row"><label for="writeType"> 카테고리 </label></th>
								<td>
									<div class="form-field form-field-30">
										<div class="form-field_inner form-field-submit">
											<input type="hidden" id="artFieldId" name="art_field_id" value="${artFieldId}">
											 <select name="selectedArtField" id="selectedArtField" onchange="setArtFieldId()">
												<option value="유머글" ${artFieldId == 10 ? 'selected' : ''}>유머글</option>
												<option value="자랑하기" ${artFieldId == 11 ? 'selected' : ''}>자랑하기</option>
												<option value="질문하기" ${artFieldId == 12 ? 'selected' : ''}>질문하기</option>
												<option value="정보공유" ${artFieldId == 13 ? 'selected' : ''}>정보공유</option>
												<option value="그냥" ${artFieldId == 14 ? 'selected' : ''}>그냥수다</option>
												<option value="그냥" ${artFieldId == 15 ? 'selected' : 'selected'}>카테고리선택하기</option>
											</select>
										</div>

										<div class="labelDiv">
											<label for="cancle" class="btn-cancle" onclick="cancle">작성 취소</label> <label for="submit" class="btn-submit" onclick="submit()">글 저장</label>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="writeTitle"> <span class="required__mark">*</span> 제목
								</label></th>
								<td>
									<div class="form-field">
										<div class="form-field_inner">
											<input type="text" id="writeTitle" name="title" title="제목" maxlength="100" required>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="writecontent"> <span class="required__mark">*</span> 내용
								</label></th>
								<td>
									<div class="form-field">
										<textarea id="writecontent" name="content" title="내용" maxlength="1000" required>
								</textarea>
									</div>
								</td>
							</tr>
							<tr id="fileTr">
								<th scope="row"><label for="file"> 파일첨부 </label></th>
								<td class="fileTd">
									<div class="form-field">
										<input class="file-name" value="첨부파일"> <label for="file" class="btn-file">파일찾기</label> <input type="file" id="file" name="post_att_id" title="파일">
									</div>
									<script>
										$("#file").on('change', function() {
											var fileName = $("#file").val();
											$(".file-name").val(fileName);
										});
										
										function setArtFieldId() {
									        var selectedArtField = document.getElementById("selectedArtField").value;
									        console.log("Selected Art Field: " + selectedArtField);
									        var artFieldIdInput = document.getElementById("artFieldId");
									        
									        // 선택된 드롭다운 값에 따라 hidden 필드의 값을 설정합니다.
									        switch (selectedArtField) {
									            
									            case "유머글":
									                artFieldIdInput.value = 10;
									                break;
									            case "자랑하기":
									                artFieldIdInput.value = 11;
									                break;
									            case "질문하기":
									                artFieldIdInput.value = 12;
									                break;
									            case "정보공유":
									                artFieldIdInput.value = 13;
									                break;
									            case "그냥":
									                artFieldIdInput.value = 14;
									                break; 
									            case "카테고리선택하기":
									                artFieldIdInput.value = 15;
									                break; 
									            // 다른 옵션에 대한 경우 추가
									            default:
									                artFieldIdInput.value = 14; // 기본값 설정
									        }
									        console.log("Art Field ID: " + artFieldIdInput.value);
									    }
									</script>
								</td>
							</tr>
							<tr>
								<td class="btn-right" colspan="2">
									<div class="form-field-submit ">
										<input type="button" id="cancle" title="취소"> <input type="submit" id="submit" name="post_submit" title="저장">
										<script>
											
										</script>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<input type="hidden" name="member_id" value="${member_id}">
				</form>
			</div>
		</main>
	</div>
</body>
</html>















