<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="css/font.css">
<link rel="stylesheet" href="css/header.css">
<title>도서목록조회</title>
</head>
<%@ include file="header.jsp" %>
<body>
	<table>
		<tr>
			<th>도서번호</th>
			<th>도서이미지</th>
			<th>도서제목</th>
			<th>저자명</th>
			<th>도서 ISBN</th>
			<th>출판사</th>
		<tr>
			<c:forEach var="book" items="${userBookList}" varStatus="status">
				<tr onclick="location.href='./getDetailBook.do?book_seq=${book.book_seq}'">
					<td>${book.book_seq}</td>
					<td><img src="${book.book_img} alt="도서 이미지"></td>
					<td>${book.book_title}</td>
					<td>${book.book_writer}</td>
					<td>${book.book_isbn}</td>
					<td>${book.book_publisher}</td>
				</tr>
			</c:forEach>
	</table>
</body>
<%@ include file="footer.jsp" %>
</html>