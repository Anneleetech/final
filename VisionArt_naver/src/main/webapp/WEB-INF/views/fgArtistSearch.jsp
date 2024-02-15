<%@page import="com.mc.full17th2.dto.FamousGallaryDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <!DOCTYPE html>
    <html lang="en">
        <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
        <meta http-equiv="Pragma" content="no-cache">
        <meta http-equiv="Expires" content="0">
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="/css/fgArtistSearch.css">
        <link rel="stylesheet" type="text/css" href="/css/page.css">
        <link rel="icon" href="data:;base64,iVBORw0KGgo=">
    
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src="/js/page.js"></script>
</head>
<body>
<div class="container">
    <div class="post">
        <h2 id="posth2">기성 작가 검색</h2>

        <div class="form-group half-width">
            <p class="p">작가명 <input type="text" id="artistKeyword" name="artistName" value="${post.artistName}">
            <button type="button" id="searchArtistButton" class="btn btn-custom">검색</button>
        </div>
        <div id="searchResult">
            <table border="1" id="searchResultList">
                <tr><th class="searchResultNumber">순번</th><th>작가명</th></tr>
                <tr><td colspan="2">검색 결과가 없습니다.</td></tr>
            </table>
        </div>
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
</div>

<script>
    let currentPage=1;
    let startPage=1, endPage=1;
    let resultCount=0;

    function getArtistList(){
        let keyword=$('#artistKeyword').val();

        $.ajax({
            type:'post',
            url:'/fg/artistSearch',
            dataType:'json',
            data:{
                'page':currentPage,
                'keyword':keyword
            },
            success:function(response){
                let resultList=$('#searchResultList>');
                resultCount=response.count;
                startPage=response.startPage;
                endPage=response.endPage;
                setupPagination();

                if(response.status==false || resultCount<1){
                    resultList.html('<tr><td colspan="2">검색 결과가 없습니다.</td></tr>');
                }else{
                    // 결과를 받아서 반복 출력함.
                    let artistList=response.artists;

                    resultList.html('<tr><th class="searchResultNumber">순번</th><th>작가명</th></tr>');
                    artistList.forEach((item,index) => {
                        let button=$('<button>').val(item.artistId).text(item.artistName);
                        button.click(function(){
                            window.opener.document.getElementById("artistSearchName").value=item.artistName;
                            window.opener.document.getElementById("artistSearchId").value=item.artistId;
                            window.close();
                        });
                        let tr=$('<tr>').append($('<td>').html(index+1)).append($('<td>').append(button));

                        resultList.append(tr);
                    });
                }
            }
        });
    }

    function goToPage(page){
        currentPage=page;
        getArtistList();
    }
    function goToPrevPage(){
        if(currentPage>1){
            currentPage--;
            getArtistList();
        }
    }
    function goToNextPage(){
        if(currentPage>endPage){
            currentPage++;
            getArtistList();
        }
    }

    function setupPagination() {
    const pageNumbers = document.getElementById('page-numbers');
    pageNumbers.innerHTML = '';

    for (let i = startPage; i <= endPage; i++) {
        let btn = document.createElement('button');
        btn.textContent = i;
        if(i==currentPage){
            btn.style.fontWeight="bold";
        }
        btn.onclick = function() { goToPage(i); };
        pageNumbers.appendChild(btn);
    }
}

    $(document).ready(function(){
        getArtistList();
        setupPagination();

        $('#searchArtistButton').click(function(){
            currentPage=1;
            getArtistList();
        });
    });
</script>
</body>
</html>    