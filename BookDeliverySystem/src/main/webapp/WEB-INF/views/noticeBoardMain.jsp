<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 전체 리스트</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/notice.css">
</head>
<%@ include file="header.jsp" %>
<body>
<h1>공지사항</h1>
	<c:choose>
		<c:when test="${loginDto != null && loginDto.user_auth == 'A'}">
			<input class="btn" type="submit" onclick="location.href='./noticeBoardInsertForm.do'"
				value="새글작성">
		</c:when>
	</c:choose>
	<table class="table" border="1">
	<tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
    </tr>
		<c:forEach var="noticeBoard" items="${noticeList}">
		<tr>
        <td><c:out value="${noticeBoard.notice_bseq}"/></td>
		<td><a href="./noticeBoardDetail.do?notice_bseq=${noticeBoard.notice_bseq}">${noticeBoard.notice_title}</a></td>
		<td>${noticeBoard.user_name}</td>
		<td><fmt:formatDate value="${noticeBoard.notice_regdate}" pattern="yyyy-MM-dd"/> </td>
		 </tr>
        </c:forEach>
</table>
</body>
<%@ include file="footer.jsp" %>
</html>