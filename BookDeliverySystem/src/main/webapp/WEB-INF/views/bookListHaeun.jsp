<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/font.css">
<link rel="stylesheet" href="css/header.css">
<title>Insert title here</title>
</head>
<%@include file="/WEB-INF/views/header.jsp"%>
<body>

    <!-- 세션에서 loginDto 속성을 불러옴 -->
    <c:set var="loginDto" value="${sessionScope.loginDto}"/>

    <!-- 로그인 정보에 따라 회원 여부를 히든 필드로 전달 -->
<%--     <c:choose> --%>
<%--         <c:when test="${loginDto != null}"> --%>
<!--             회원인 경우 -->
<!--             <input type="hidden" name="isMember" value="true"> -->
<%--         </c:when> --%>
<%--         <c:otherwise> --%>
<!--             비회원인 경우 -->
<!--             <input type="hidden" name="isMember" value="false"> -->
<%--         </c:otherwise> --%>
<%--     </c:choose> --%>

<!-- loginDto 객체의 속성(필드) 값을 출력 -->

test: ${loginDto.user_email} <br>
test: ${loginDto.user_seq} <br>
test: ${loginDto.user_name} <br>

<button onclick="location.href='./userRentList.do?user_seq=${loginDto.user_seq}'">대출목록조회</button>
<button onclick="location.href='./userResveList.do?user_seq=${loginDto.user_seq}'">예약순번조회</button>
<button onclick="location.href='./paymentList.do?user_seq=${loginDto.user_seq}'">결제내역조회</button>

<button onclick="location.href='./adminRentList.do'">관리자 대출조회</button>
  <br>
  <br>
  <table>
    <thead>
      <tr>
        <th>도서 번호</th>
        <th>도서 제목</th>
        <th>작가</th>
        <th>ISBN</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach items="${books}" var="book">
        <tr>
			<td>${book.book_seq}</td>
<%-- 			<td><a href="./bookDetailHaeun.do?seq=${book.book_seq}">${book.book_title}</a></td> --%>
			<td><a href="./bookDetailHaeun.do?seq=${book.book_seq}">${book.book_title}</a></td>
			<td>${book.book_writer}</td>
         	 <td>${book.book_isbn}</td>
        </tr>
      </c:forEach>
    </tbody>
  </table>
</body>
</html>