<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/font.css">
<title>메인페이지</title>
</head>
<body>

<!-- 세션에서 loginDto 속성을 불러옴 -->
<c:set var="loginDto" value="${sessionScope.loginDto}"/>

<!-- loginDto 객체의 속성(필드) 값을 출력 -->
test: ${loginDto} <br>

<h2>메인테스트페이지</h2>
<button onclick="location.href='./bookListHaeun.do?user_seq=${loginDto.user_seq}'">대출(대출/예약등)</button>

<button onclick="location.href='./addr.do?user_seq=${loginDto.user_seq}'">배송</button>



<button>결제</button>


</body>
</html>