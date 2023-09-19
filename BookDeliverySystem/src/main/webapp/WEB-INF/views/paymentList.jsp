<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/font.css">
<title>Insert title here</title>
</head>
<body>

<c:set var="loginUser" value="${sessionScope.loginDto}" />
<c:set var="payment" value="${sessionScope.payDto}" />

<h1>${loginUser.user_name}님의 결제내역</h1>
<%-- ${paymentList} --%>
<table border="1">
    <tr>
    	<th>결제번호</th>
        <th>승인번호</th>
        <th>회원번호</th>
        <th>금액</th>
        <th>결제시간</th>
        <th>적립마일리지</th>
        <th>총마일리지</th>
       
    </tr>
    <c:forEach var="payment" items="${paymentList}" varStatus="status">
        <tr>
        	<td>${payment.PAY_SEQ}</td>
            <td>${payment.PAY_IMD}</td>
            <td>${payment.USER_SEQ}</td>
            <td>${payment.PAY_PAYMENT}</td>
            <td>${payment.PAY_DATE}</td>
            <td>DD</td>
            <td>DD</td>
		     <td>
				<button onclick="location.href='./delivery.do?user_seq=${loginDto.user_seq}'">결제취소</button>
			</td>
        </tr>
    </c:forEach>
    
</table>
 
</body>

</html>
