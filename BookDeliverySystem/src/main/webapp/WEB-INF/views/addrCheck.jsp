<%@page import="com.dowon.bds.dto.AddrDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소 정보</title>
<link rel="stylesheet" href="css/addrCheck.css" />
<link rel="stylesheet" href="css/font.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
${sessionScope.loginDto.user_seq} <br>
${sessionScope.loginDto.user_name}님
<c:set var="loginUser" value="${sessionScope.loginDto}"/>
<h1 style="font-family: 'Hanna', fantasy;">${sessionScope.loginDto.user_name}님의 배송지 확인</h1>
    <div id="container" style="width: 800px; height: 900px;">
        <h2>입력한 주소 확인</h2>
        <table>
        <thead>
            <tr>
                <td><strong>이름:</strong></td>
                <td>${sessionScope.savedAddress.delivery_name}</td>
            </tr>
            <tr>
                <td><strong>전화번호:</strong></td>
                <td>${sessionScope.savedAddress.delivery_phone}</td>
            </tr>
            <tr>
                <td><strong>우편번호:</strong></td>
                <td>${sessionScope.savedAddress.postcode}</td>
            </tr>
            <tr>
                <td><strong>주소:</strong></td>
                <td>${sessionScope.savedAddress.address} ${sessionScope.savedAddress.detaddr}</td>
            </tr>
           </thead>
        </table>
       <div class="container">
			<input class="btn btn-info" type="button" value="결제요청" onclick="redirectToPayment()">
		    <button class="btn"  onclick="history.back(-1)">취소</button>
     
		</div>
    </div>
    ${bookSeq}
<script>
    // JavaScript를 사용하여 bookSeq 값을 전달하고 페이지 이동
    function redirectToPayment() {
        var bookSeq = ${bookSeq}; // JavaScript로 bookSeq 값을 얻어오는 코드
        var url = "./payment.do?book_seq=" + bookSeq; // book_seq로 수정
        location.href = url;
    }
</script>
</body>
</html>