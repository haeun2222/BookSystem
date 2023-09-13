<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
</head>
<body>

<!-- 세션에서 loginVo 속성을 불러옴 -->
<c:set var="loginVo" value="${sessionScope.loginVo}"/>

<!-- loginVo 객체의 속성(필드) 값을 출력 -->
test: ${loginVo.user_email} <br>

<h2>메인테스트페이지</h2>
<button>대출(대출/예약/관리자/회원목록 등)</button>
<button>결제</button>
<button>통계</button>
</body>
</html>