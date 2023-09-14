<%@page import="com.dowon.bds.dto.AddrDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<c:set var="loginUser" value="${sessionScope.loginVo}"/>
<h1 style="font-family: 'Hanna', fantasy;">${loginUser.user_name}님의 배송지 확인</h1>

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
			<input class="btn btn-info" type="button" value="결제요청" onclick="location.href='./payment.do'">
		    <button class="btn"  onclick="history.back(-1)">취소</button>
<%-- <input class="btn btn-info" type="button" value="결제요청" onclick="deleteOne('${vo.seq}')"> --%>
     
		</div>
    </div>
</body>
</html>