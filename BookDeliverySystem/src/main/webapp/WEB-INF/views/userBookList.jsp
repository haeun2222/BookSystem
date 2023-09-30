<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/font.css">
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/bookList.css">
<title>도서목록조회</title>
</head>
<%@ include file="header.jsp" %>
<body>
	<table id="bookList">
		<tr>
            <th>도서번호</th>
            <th>도서이미지</th>
            <th>도서제목</th>
            <th>저자명</th>
            <th>도서 ISBN</th>
            <th>출판사</th>
            <th>출판일</th>
        </tr>
        
        <c:forEach var="book" items="${userBookList}" varStatus="status">
            <tr>
                <td>${book.book_seq}</td>
                <td><a href='./getDetailBook.do?book_seq=${book.book_seq}'><img src="${book.book_img}" alt="도서 이미지"></a></td>
                <td><a href='./getDetailBook.do?book_seq=${book.book_seq}'>${book.book_title}</a></td>
                <td>${book.book_writer}</td>
                <td>${book.book_isbn}</td>
                <td>${book.book_publisher}</td>
                <td><fmt:formatDate pattern="yyyy-MM-dd" value="${book.book_published_date}"/></td>
            </tr>
        </c:forEach>
	</table>
</body>
<%@ include file="footer.jsp" %>
</html>