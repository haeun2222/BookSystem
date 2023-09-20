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
<title>자유게시판 새글작성</title>
<%@ include file="header.jsp" %>
</head>
<body>
	<div class="container">
		<h2>새글작성</h2>
		<form action="./freeBoardInsert.do" method="post">
			<div class="form-group">
				<label for="id">아이디:</label>
				<div class="form-control" id="id">${loginDto.user_name}</div>
			</div>
			<div class="form-group">
				<label for="title">제목:</label>
				<input type="text" class="form-control" id="free_title" name="free_title">
			</div>
			<div class="form-group">
				<label for="comment">내용:</label>
				<textarea class="form-control" id="free_content" name="free_content" rows="5" cols="50"></textarea>
			</div>
			<button type="submit" class="btn btn-info">완료</button>
			<button class="btn btn-default" onclick="history.back(-1)">취소</button>
		</form>
	</div>
</body>
<%@ include file="footer.jsp" %>
</html>