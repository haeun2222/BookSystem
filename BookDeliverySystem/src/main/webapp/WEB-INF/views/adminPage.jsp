<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link rel="stylesheet" href="css/adminPage.css"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script src="js/adminUser.js"></script>
<script src="js/adminBook.js"></script>
<script src="js/adminRent.js"></script>
</head>
<body>

<h1>비대면 도서 대출 시스템 [관리자페이지]</h1>

<body>
    <button id="userTableButton">회원관리</button>
    <button id="bookTableButton">도서관리</button>
    <button id="rentListButton">대출관리(페이징중)</button>
    <button type="button" onclick="location.href='./freeBoardList.do'">자유게시판 관리</button>
    <button type="button" onclick="location.href='./faqList.do'">FAQ게시판 관리</button>
    <input type="text" id="bookName" placeholder="도서명 입력">
    <button id="search">검색</button>
    <button class="btn btn-info" onclick="location.href='./logout.do'">로그아웃</button>
    
    <div id="userInfoTable"></div>
    <div id="bookInfoTable"></div>
    <div id="bookSearchTable"></div>    
    <div id="rentListTable"></div>   
    
    <!-- 하은 -->


</body>
</html>