<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>My Page</title>
  <link rel="stylesheet" href="/css/myreplies.css">
  <link rel="stylesheet" href="/css/page.css">
  <script src="/js/jquery-3.7.1.min.js"></script>
  <script>
    const startPage=${result.startPage};
    let currentPage=${result.page};
    const endPage=${result.endPage};
    const uri="/mypage/comment";

    $(function(){
      setupPagination();
    })
  </script>
</head>

<body>
    <!-- 공통 헤더 부분 -->
    <%@ include file="header.jsp" %>

    <!-- 본문 -->
  <script src="/js/myreplies.js"></script>
  <div class="profile-container">
    <!-- 프로필 사진 -->
    <div class="profile-picture" id="profilePicture">
      <img src="/media/blackpink.webp" alt="Profile Picture">
    </div>
    <!-- 프로필 정보 -->
    <div class="profile-info">
      <!-- 닉네임 -->
      <h2 id="Nickname">${nickname}</h2>
      <!-- 이메일 주소 -->
      <!-- <p id="Email">Email: project@multi.com</p> -->
      <!-- 수정 버튼 -->
      <button id="editProfileBtn">수정</button>
    </div>
  </div>
  
  <div class="user-replies" id="myReplies">
    <!-- 내가 쓴 댓글 목록 -->
    <table>
      <thead>
        <tr>
          <th><h3 id="myRepliesHeader"> 댓글 목록</h3></th>
        </tr>
      </thead>
      <tbody>
        <c:choose>
        <c:when test="${empty result.comments}">
            <tr>
              <td class="post-cell post-title">작성하신 댓글이 존재하지 않습니다.</td>
            </tr>
          </c:when>
          <c:otherwise>
            <c:forEach var="data" items="${result.comments}">
              <tr>
                <td class="post-cell">
                  <span class="post-title"><strong>${data.postTitle}</strong><br><span>${data.commentContent}</span></span>
                  <div class="post-actions">
                    <div class="group-menu" onclick="toggleMenu(this)">
                      <div class="dot"></div>
                      <div class="dot"></div>
                      <div class="dot"></div>
                    </div>
                    <div class="frame1">
                      <div class="info"><span class="editPostBtn">수정</span></div>
                      <div class="info"><span class="deletePostBtn">삭제</span></div>
                    </div>
                  </div>
                  <span class="post-date">${data.commentDate}</span>
                </td>
              </tr>
            </c:forEach>
          </c:otherwise>
        </c:choose>
      </tbody>
    </table>
    <!-- 페이지 바 -->
    <div id="page" class="page">
      <div id="pagination">
        <button onclick="goToPreviousPage()">이전</button>
        <span id="page-numbers"></span>
        <button onclick="goToNextPage()">다음</button>
      </div>
      <script src="/js/page.js"></script>
    </div>
  </div>
</body>
</html>