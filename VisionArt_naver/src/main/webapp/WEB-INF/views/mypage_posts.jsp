<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${result.status==false}">
  <script>
    alert("잘못된 페이지에 접속하셨습니다.");
    location.href="/mypage/post";
  </script>
</c:if>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>My Page</title>
  <link rel="stylesheet" href="/css/myposts.css">
  <link rel="stylesheet" href="/css/page.css">
  <script src="/js/jquery-3.7.1.min.js"></script>
  <script>
    const startPage=${result.startPage};
    let currentPage=${result.page};
    const endPage=${result.endPage};
    const uri="/mypage/post";

    $(function(){
      setupPagination();
    })
  </script>
</head>

<body>
    <!-- 공통 헤더 부분 -->
    <%@ include file="header.jsp" %>

    <!-- 본문 -->
  <script src="/js/myposts.js"></script>
  <div class="profile-container">
    <div class="profile-picture" id="profilePicture">
      <img src="/media/blackpink.webp" alt="Profile Picture">
    </div>
    <div class="profile-info">
      <h2 id="Nickname">${nickname}</h2>
      <!-- <p id="Email">Email: project@multi.com</p> -->
      <button id="editProfileBtn">수정</button>
    </div>
  </div>
  <div class="user-posts" id="myPosts">
    <table>
      <thead>
        <tr>
          <th><h3 id="myPostsHeader">글 목록</h3></th>
        </tr>
      </thead>
      <tbody>
        <c:choose>
            <c:when test="${empty result.posts}">
            <tr>
              <td class="post-cell post-title">작성하신 글이 존재하지 않습니다.</td>
            </tr>
          </c:when>
          <c:otherwise>
            <c:forEach var="data" items="${result.posts}">
              <c:choose>
                <c:when test="${data.postFieldId==0}">
                  <c:set var="postField" value="/post" scope="page"/>
                </c:when>
                <c:when test="${data.postFieldId==1}">
                  <c:set var="postField" value="/ug" scope="page"/>
                </c:when>
                <c:when test="${data.postFieldId==2}">
                  <c:set var="postField" value="/fg" scope="page"/>
                </c:when>
                <c:when test="${data.postFieldId==100}">
                  <c:set var="postField" value="/notice" scope="page"/>
                </c:when>
              </c:choose>
              <tr>
                <td class="post-cell">
                  <a class="post-title" href="${postField}/${data.postId}">${data.title}</a>
                  <div class="post-actions">
                    <div class="group-menu" onclick="toggleMenu(this)">
                      <div class="dot"></div>
                      <div class="dot"></div>
                      <div class="dot"></div>
                    </div>
                    <div class="frame1">
                      <div class="info"><a class="editPostBtn" href="${postField}/edit/${data.postId}">수정</a></div>
                      <div class="info"><a class="deletePostBtn">삭제</a></div>
                    </div>
                  </div>
                  <span class="post-date">${data.postDate}</span>
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