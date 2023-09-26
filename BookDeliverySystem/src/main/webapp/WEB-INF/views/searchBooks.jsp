<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책 검색결과 페이지</title>
</head>
<body>
    <h1>도서 검색 결과</h1>
    
    <table>
        <thead>
            <tr>
                <th>도서 제목</th>
                <th>저자</th>
                <th>출판년도</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${searchResults}" var="book">
                <tr>
                	<td><img src="${book.book_img}"></td>
                    <td>${book.book_title}</td>
                    <td>${book.book_writer}</td>
                    <td>${book.book_isbn}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>