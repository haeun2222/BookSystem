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
<%-- ${loginDto} --%>
<%-- ${free_title} --%>
<%-- ${free_content} --%>
<%-- ${free_bseq} --%>
<div class="container">
		<h1>제목: ${free_title}</h1><button style="float: right;" class="btn btn-success" onclick="history.back(-1)">이전</button>
		<form action="./freeBoardUpdate.do?free_bseq=${free_bseq}" method="post">
			<div class="form-group">
				<label for="id">아이디:</label>
				<div class="form-control" id="id">${loginDto.user_name}</div>
			</div>
			<div class="form-group">
				<label for="comment">내용:</label>
				<textarea class="form-control" id="free_content" name="free_content" rows="5" cols="50">${free_content}</textarea>
			</div>
			<button type="submit" class="btn btn-success">완료</button>
		</form>
			
	</div>
			
			
</body>
<%@ include file="footer.jsp" %>
</html>