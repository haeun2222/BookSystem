<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="css/font.css">
<link rel="stylesheet" href="css/header.css">
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>글 수정 페이지</title>
</head>
<%@ include file="header.jsp" %>
<body>
${free_bseq}
	<div class="container">
		<h1>제목: ${dto.free_title}<input style="float: right;" class="btn btn-success" type="button" value="이전" onclick="history.back(-1);">
			<c:if test="${loginDto.user_name eq dto.user_name or loginDto.user_auth eq 'A'}">
    		<input style="float: right;" class="btn btn-danger" type="button" value="삭제" onclick="boardDel()">
			<input style="float: right;" class="btn btn-info" type="button" value="수정" onclick="location.href='./updateBoard.do?free_bseq=${dto.free_bseq}'">
			
			</c:if>
		</h1>
		<div>
			작성자<div class="form-control" style="font-size: 20px;">${dto.user_name}</div>
			내용<div class="form-control" style="height: 100px; font-size: 20px;">${dto.free_content}</div>
			작성일<div class="form-control" style="font-size: 20px;"><fmt:formatDate value="${dto.free_regdate}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></div>
		</div><br>
		<div>
			
			
			
</body>
<%@ include file="footer.jsp" %>
</html>