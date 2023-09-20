<%@page import="com.dowon.bds.dto.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="css/font.css">
<link rel="stylesheet" href="css/header.css">
  <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>자유게시판</title>
</head>
<%@ include file="header.jsp" %>
<body>
<div class="container">
	<h1>자유게시판</h1>
	<input type="submit" onclick="location.href='./freeBoardInsertView.do'" value="새글작성">
    <table class="table" border="1">
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
        </tr>
        <c:forEach var="freeBoard" items="${freeBoardList}">
            <tr>
                <td>${freeBoard.free_bseq}</td>
                <td><a href="./freeBoardDetail.do?free_bseq=${freeBoard.free_bseq}">${freeBoard.free_title}</a></td>
                <td>${freeBoard.user_name}</td>
                <td><fmt:formatDate value="${freeBoard.free_regdate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
            </tr>
        </c:forEach>
    </table>
    </div>
</body>
<%@ include file="footer.jsp" %>
</html>