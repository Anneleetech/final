<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.Map,java.util.List,com.mc.full17th2.dto.TempMyPagePostDTO,com.mc.full17th2.dto.TempMyPageCommentDTO"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>My Page</title>
  <link rel="stylesheet" href="/css/mypage.css">
</head>
<body>
  <!-- 공통 헤더 부분 -->
  <%@ include file="header.jsp" %>

  <!-- 본문 -->
  <script src="/js/mypage.js"></script>
  <div class="profile-container">
    <!-- 프로필 사진 -->
    <div class="profile-picture" id="profilePicture">
      <img src="media/blackpink.webp" alt="Profile Picture">
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
  <div class="user-posts" id="myPosts">
    <!-- 내가 쓴 글 목록 -->
    <table>
      <thead>
        <tr>
          <th><h3 id="myPostsHeader">작성 글 목록 →</h3></th>
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
  </div>
  <div class="user-replies" id="myReplies">
    <!-- 내가 쓴 댓글 목록 -->
    <table>
      <thead>
        <tr>
          <th><h3 id="myRepliesHeader">작성 댓글 목록 →</h3></th>
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
  </div>
</body>
</html>