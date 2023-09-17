<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link rel="stylesheet" href="css/adminPage.css"/>
<script type="text/javascript"src="https://code.jquery.com/jquery-3.7.0.js"></script>
</head>
<body>

<h1>도서 등록 시스템</h1>
<script type="text/javascript">

$(document).ready(function(){
    $("#search").click(function(){
        $.ajax({
            method: "GET",
            url: "https://dapi.kakao.com/v3/search/book?target=title",
            data: { query: $("#bookName").val() },
            headers: { "Authorization": "KakaoAK deebb5b9fe3604c7cbb30baeb31b856e" }
        })
        .done(function(res){
            // API에서 받아온 데이터를 테이블에 추가
            var table = $(".book-table tbody");
            table.empty(); // 이전 검색 결과 삭제

            // 최대 3개의 결과만 처리 (0부터 2번째까지)
            for (var i = 0; i <= 4 && i < res.documents.length; i++) {
                var rowData = res.documents[i];
                var row = '<tr>';
                row += '<td><img src="' + rowData.thumbnail + '" /></td>';
                row += '<td>' + rowData.title + '</td>';
                row += '<td>' + rowData.contents + '</td>';
                row += '<td>' + rowData.authors + '</td>';
                row += '<td>' + rowData.publisher + '</td>';
//                 row += '<button>' + 등록하기 +'</button>'; 
                row += '</tr>';
                table.append(row);
            }
        });
    });
});
</script>

<body>
    <input type="text" id="bookName" placeholder="도서명 입력">
    <button id="search">검색</button>

    <table class="book-table" style="width: 1200px">
        <thead>
            <tr>
                <th>도서이미지</th>
                <th>도서제목</th>
                <th>도서내용</th>
                <th>저자</th>
                <th>출판사</th>
                <th>도서등록하기</th>
            </tr>
        </thead>
        <tbody id="tableBody">

        </tbody>
    </table>


</body>
</html>