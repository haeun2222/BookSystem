<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 조회</title>
</head>
<body>
	${lists}
	<hr>
	<fieldset>
		<form action="./insertBoard.do" method="post">
			<input type="text" name="id" value="D001">
			<input type="text" name="title" value="하하하">
			<input type="text" name="content" value="gkgkgkgkgk">
			<input type="submit" value="전송">
		</form>
	</fieldset>
</body>
</html>