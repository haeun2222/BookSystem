<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul>
		<li>${requestScope.str}</li>
	</ul>

	<ul>
	<li>
		<a href="./home.do?name=remon">home GET 호출</a>
	</li>
	<li>
		<form action="./home.do" method="post">
			<input type="text" name="name" value="banana">
			<input type="submit" value="post전송">
		</form>
	</li>
	
	<li>
		<a href="./info.do?name=한글&age=100">info GET호출</a>
	</li>
	
	<li>
		<a href="./redirect.do?name=귤">redirect GET호출</a>
	</li>
	</ul>
	<div>
		<a href="./selectBoard.do">게시글 리스트보기</a>
	</div>
</body>
</html>