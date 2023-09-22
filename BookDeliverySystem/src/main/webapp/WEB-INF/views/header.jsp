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
  <div><h1 style="text-align: center; font-size: 60px;  color: white; ">계발의민족</h1></div>
  <div class="topLogo" style="margin-top: 30px;" id="loginBtn">
  		<button class="btn" style="background-color: #00FFF5" onclick="location.href='./nomalRegistForm.do'">회원가입</button>
  		<button class="btn" style="background-color: #00FFF5" onclick="location.href='./loginPage.do'">로그인</button>
  		<button class="btn" style="background-color: #00FFF5" onclick="location.href='./logout.do'">로그아웃</button>
  </div>  
</div>
<nav class="navbar navbar-default" style="background-color:#222831; margin: 0 auto;" >
  <div class="container-fluid">
    <div class="navbar-header">
    </div>
    <ul class="nav navbar-nav" style="margin: 0 auto;">
      <li class="active"><a style="background-color:#222831; color:#CFD8DC;" href="./home.do">Home</a></li>

      <li><a style="color: #CFD8DC;" href="./freeBoardList.do">자유게시판</a></li>
      <li><a style="color: #CFD8DC;" href="./userBookList.do">도서목록</a></li>
      <li><a style="color: #CFD8DC;" href="./paymentList.do">결제내역</a></li>
      <li><a style="color: #CFD8DC;" href="./userRentList.do">회원대출목록</a></li>
      <li><a style="color: #CFD8DC;" href="./userResveList.do">회원예약목록</a></li>
 <!--     <li><a style="color: #CFD8DC;" href="./adminRentList.do">관리자대출관리</a></li> -->

    </ul>
  </div>
</nav>


</body>
</html>