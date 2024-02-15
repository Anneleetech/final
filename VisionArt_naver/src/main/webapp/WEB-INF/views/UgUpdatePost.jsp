<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>VisionArt</title>
     <c:set var="path" value="${pageContext.request.contextPath}" />  
    <script src="${path}/js/UgUpdatePost.js"></script>
    <script src="${path}/js/jquery-3.7.1.min.js"></script>
    <link href="${path}/css/ugupdatepost.css" rel="stylesheet">
</head>
<body>
<%@ include file="header.jsp" %>
    <br><br><br>
    <section id="container">
        <div class="post">
            <form id="editPostForm"  action="/ug/edit/${post_id}" method="post" enctype="multipart/form-data" onsubmit="setArtFieldId()">
                <div>
                    <h2 id="posth2">유저 갤러리 게시글 수정</h2>
                </div>
                
                 <div>
			    <p>종류</p>
			     <div class="box">
			    <select name="selectedArtField" id="selectedArtField" onchange="setArtFieldId()">
			        <option value="유화" ${artFieldId == 1 ? 'selected' : ''}>유화</option>
			        <option value="수채화" ${artFieldId == 2 ? 'selected' : ''}>수채화</option>
			       <option value="아크릴화" ${artFieldId == 3 ? 'selected' : ''}>아크릴화</option>
			        <option value="채색 연필" ${artFieldId == 4 ? 'selected' : ''}>채색 연필</option>
			        <option value="붓글씨" ${artFieldId == 5 ? 'selected' : ''}>붓글씨</option>
			        <option value="디지털 그림" ${artFieldId == 6 ? 'selected' : ''}>디지털 그림</option>
			        <option value="실사" ${artFieldId == 7 ? 'selected' : ''}>실사</option>
			        <option value="동양화" ${artFieldId == 8 ? 'selected' : ''}>동양화</option>
			        <option value="기타" ${artFieldId == 9 ? 'selected' : ''}>기타</option>
			    </select>
			</div>
                <div>	</div>
                    <p>제목</p>
                    <input type="text" id="editPostTitle" name="title" placeholder="" value='${title}'>
                    
                    <p>내용</p>
                    <textarea id="editPostContent" name="content" rows="4" required >${content}</textarea>
					
                    <div class="box">
                        <input type="file" name="imageFiles" accept="image/*" value="파일첨부" multiple>
					<input type="file" name="imageFiles" accept="image/*" value="파일첨부" multiple>
                      
                        <div>
       					 <c:forEach var="filename" items="${imageFilenames}">
          				${filename}
       					 </c:forEach>
       					</div>
   						
                    </div>
               <!-- art_field_id를 저장할 hidden 필드 추가 -->
        <input type="hidden" id="artFieldId" name="art_field_id" value="${artFieldId}">
                    
             
                    <br><br><br><br>
                    <div>
                        <input type="submit" value="수정">
                    </div>
                    <br>
                </div>
            </form>
        </div>
    </section>
    
    <script>
    function setArtFieldId() {
        var selectedArtField = document.getElementById("selectedArtField").value;
        console.log("Selected Art Field: " + selectedArtField);
        var artFieldIdInput = document.getElementById("artFieldId");
        
        // 선택된 드롭다운 값에 따라 hidden 필드의 값을 설정합니다.
        switch (selectedArtField) {
            case "유화":
                artFieldIdInput.value = 1;
                break;
            case "수채화":
                artFieldIdInput.value = 2;
                break;
            case "아크릴화":
                artFieldIdInput.value = 3;
                break;
            case "채색 연필":
                artFieldIdInput.value = 4;
                break;
            case "붓글씨":
                artFieldIdInput.value = 5;
                break;
            case "디지털 그림":
                artFieldIdInput.value = 6;
                break;
            case "실사":
                artFieldIdInput.value = 7;
                break;
            case "동양화":
                artFieldIdInput.value = 8;
                break;
            case "기타":
                artFieldIdInput.value = 9;
                break;
            // 다른 옵션에 대한 경우 추가
            default:
                artFieldIdInput.value = 9; // 기본값 설정
        }
        console.log("Art Field ID: " + artFieldIdInput.value);
    }
</script>
<%@ include file="footer.jsp" %>
</body>

</html>
