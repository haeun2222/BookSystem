<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="flex-container" id="header">
		<div class="topLogo" style="margin-top: 30px;"></div>
		<div>
			<h1 style="text-align: center; font-size: 60px; color: white;">계발의민족</h1>
		</div>
		<div class="topLogo" style="margin-top: 30px;" id="loginBtn">
			<button class="btn" style="background-color: #00FFF5"
				onclick="location.href='./nomalRegistForm.do'">회원가입</button>
			<!--로그인 상태확인 -->
			<c:choose>
				<c:when test="${loginDto == null}">
					<button class="btn" id="loginButton"
						style="background-color: #00FFF5"
						onclick="location.href='./loginPage.do'">로그인</button>
				</c:when>
				<c:otherwise>
					<button class="btn" id="logoutButton"
						style="background-color: #00FFF5"
						onclick="location.href='./logout.do'">로그아웃</button>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<nav class="navbar navbar-default"
		style="border-radius: 15px; background-color: #222831; margin: 0 auto;">
		<div class="container-fluid">
			<div class="navbar-header"></div>
			<ul class="nav navbar-nav" style="margin: 0 auto;">
				<li class="active"><a href="./home.do">Home</a></li>

				<li><a style="color: #CFD8DC;" href="./freeBoardList.do">자유게시판</a></li>
				<li><a style="color: #CFD8DC;" href="./userBookList.do">도서목록</a></li>
				<li><a style="color: #CFD8DC;" href="./paymentList.do">결제내역</a></li>
				<li><a style="color: #CFD8DC;" href="./userRentList.do">회원대출목록</a></li>
				<li><a style="color: #CFD8DC;" href="./userResveList.do">회원예약목록</a></li>
				<!--     <li><a style="color: #CFD8DC;" href="./adminRentList.do">관리자대출관리</a></li> -->

			</ul>
		</div>
	</nav>
	<script type="text/javascript" src="js/header.js"></script>
</body>
</html>