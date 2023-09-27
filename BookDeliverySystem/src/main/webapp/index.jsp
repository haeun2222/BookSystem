<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="css/index.css">
<link rel="stylesheet" href="css/font.css">
<link rel="stylesheet" href="css/SerachBar.css">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript" src="js/statistics.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css">
<script type="text/javascript" src="./js/javascript41.js" defer="defer"></script>
<link rel='stylesheet' href='./css/slick.css'/>
<link rel='stylesheet' href='./css/index.css'/>
<style type="text/css">
svg > g > g:last-child { pointer-events: none }
</style>
</head>
<%@ include file="/WEB-INF/views/header.jsp" %>
<body>
<div id="body_div" style="height: auto;">

<!-- 슬라이더 첫번째div -->
<div id="slider-div">
    <div><img src="./img/9.png" width="100%"></div>
    <div><img src="./img/guide.jpg" width="100%"></div>
    <div><img src="./img/2222.png" width="100%"></div>
    <div><img src="./img/22222.png" width="100%"></div>
    <div><img src="./img/7.png" width="100%"></div>
    <div><img src="./img/header01.png" width="100%"></div>
    <div><img src="./img/header02.png" width="100%"></div>
    <div><img src="./img/header03.png" width="100%"></div>
    <div><img src="./img/header04.png" width="100%"></div>
</div>
<!-- 검색창 두번째div -->
<form action="./searchBooks.do" method="get">
<div class="search-container" style="width: 40%g margin: 0 auto; text-align: center;">
 <input type="text" name="keyword" placeholder="도서명 또는 저자를 입력하세요." style="width: 70%; display: inline-block;">
<button type="submit" style="width: 28%; display: inline-block;"><i class="fa fa-search"></i></button>

</div>
</form> 

<div class="flex-container">
	<div style="text-align: center;">가</div>
	<div style="text-align: center;">나</div>
</div>

</div>
</body>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</html>
