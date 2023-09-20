<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서목록조회</title>
</head>
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
					<td>${book.book_img}</td>
					<td>${book.book_title}</td>
					<td>${book.book_writer}</td>
					<td>${book.book_isbn}</td>
					<td>${book.book_publisher}</td>
				</tr>
			</c:forEach>
	</table>
</body>
</html>