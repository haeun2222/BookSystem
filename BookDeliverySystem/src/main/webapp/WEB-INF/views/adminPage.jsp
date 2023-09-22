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
</head>
<body>

<h1>비대면 도서 대출 시스템 [관리자페이지]</h1>

<body>
    <button id="userTableButton">회원관리</button>
    <button id="bookTableButton">도서관리</button>
<!--     <button id="rentListButton">대출관리</button> -->
    <button type="button" onclick="location.href='./freeBoardList.do'">자유게시판 관리</button>
    <button type="button" onclick="location.href='./adminRentList.do'">관리자대출관리</button>
    <input type="text" id="bookName" placeholder="도서명 입력">
    <button id="search">검색</button>
    <button class="btn btn-info" onclick="location.href='./logout.do'">로그아웃</button>
    
    <div id="userInfoTable"></div>
    <div id="bookInfoTable"></div>
    <div id="bookSearchTable"></div>    
    
    
    
    <input type="hidden" id="userName" value="${rent.USER_NAME}">
    <input type="hidden" id="bookTitle" value="${rent.BOOK_TITLE}">
    <input type="hidden" id="rentDate" value="${rent.RENT_DATE}">
    <input type="hidden" id="rentReturnDate" value="${rent.RENT_RETURN_DATE}">
    <input type="hidden" id="rentSeq" value="${rent.RENT_SEQ}">
    <input type="hidden" id="userSeq" value="${rent.USER_SEQ}">
    <input type="hidden" id="bookSeq" value="${rent.BOOK_SEQ}">
    <input type="hidden" id="rentStatus" value="${rent.RENT_STATUS}">

</body>
</html>