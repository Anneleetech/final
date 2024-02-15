		/* 공통 */
function scrollToTop() {
  window.scrollTo({
    top: 0,
    behavior: 'smooth'
  });
}

   	
/*댓글창으로 이동*/
function commentInput() {
    var commentInput = document.getElementById("inputComment");
    commentInput.style.display = "block";
    commentInput.focus();
}




