<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>
<div class="container">
<h2>로그인하기</h2>
  <form action="./login.do" method="post">
    <div class="form-group">
      <label for="usr">아이디(이메일)</label>
      <input type="text" class="form-control" id="usr" name="user_email">
    </div>
    <div class="form-group">
      <label for="pwd">비밀번호</label>
      <input type="password" class="form-control" id="pwd" name="user_password">
    </div>
    <input type="submit" class="btn btn-primary" value="로그인">
  </form>
</div>
</body>
</html>