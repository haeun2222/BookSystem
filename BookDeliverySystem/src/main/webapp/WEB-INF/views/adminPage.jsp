<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
</head>
<body>

<script type="text/javascript"src="https://code.jquery.com/jquery-3.7.0.js"></script>

<input type="text" id="bookName">
<input type="button" value="검색" id="search">

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
            $("#covering").append("<img src='" + res.documents[0].thumbnail + "'/>");
            $("h5").append(res.documents[0].title);
            $(".card-text").append(res.documents[0].contents);
            $(".card-author").append(res.documents[0].authors);
            $(".card-publisher").append(res.documents[0].publisher);      
        });
    });
});
</script>
<div id="covering"></div>



</body>
</html>