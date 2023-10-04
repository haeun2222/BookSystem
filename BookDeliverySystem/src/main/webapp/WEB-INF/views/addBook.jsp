<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 등록 페이지</title>
<link rel="stylesheet" href="css/font.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="css/adminHeader.css"/>
<link rel="stylesheet" href="css/adminPage.css"/>
<script src="js/addBook.js"></script>
</head>
<%@ include file="/WEB-INF/views/adminHeader.jsp" %>
<body>
    <c:if test="${not empty resultAddBook}">
        <script>
            alert("${resultAddBook}");
        </script>
    </c:if>

	<input type="text" id="bookName" placeholder="도서명 입력">
    <button id="search">검색</button>
    <div id="bookSearchTable"></div>
</body>
</html>