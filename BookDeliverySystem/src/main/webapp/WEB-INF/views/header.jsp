<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="flex-container" id="header">
  <div class="topLogo" style="margin-top: 30px;">
  </div>
  <div><h1 style="text-align: center; font-size: 60px;">계발의민족</h1></div>
  <div class="topLogo" style="margin-top: 30px;" id="loginBtn">
  		<button class="btn btn-info" onclick="location.href='./nomalRegistForm.do'">회원가입</button>
  		<button class="btn btn-info" onclick="location.href='./loginPage.do'">로그인</button>
  </div>  
</div>
<nav class="navbar navbar-default" style="border-radius: 20px; background-color: aliceblue; margin: 0 auto;">
  <div class="container-fluid">
    <div class="navbar-header">
    </div>
    <ul class="nav navbar-nav" style="margin: 0 auto;">
      <li class="active"><a href="#">Home</a></li>
      <li><a href="#">게시판</a></li>
      <li><a href="#">도서목록</a></li>
    </ul>
  </div>
</nav>


</body>
</html>