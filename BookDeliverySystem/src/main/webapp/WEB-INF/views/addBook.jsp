<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 등록 페이지</title>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="css/adminPage.css"/>
<script src="js/addBook.js"></script>
</head>
<%@ include file="/WEB-INF/views/adminHeader.jsp" %>
<body>
	<input type="text" id="bookName" placeholder="도서명 입력">
    <button id="search">검색</button>
    
    <div id="bookSearchTable"></div>
</body>
</html>