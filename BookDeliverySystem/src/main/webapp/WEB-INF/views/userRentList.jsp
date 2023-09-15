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

<c:set var="loginUser" value="${sessionScope.loginVo}" />

<h1>${loginUser.user_name}님의 대출 도서 목록입니다</h1>

<table border="1">
    <tr>
    	<th>No.</th>
        <th>대출일</th>
        <th>반납예정일</th>
        <th>도서 제목</th>
        <th>대출 상태</th>
        <th>반납 신청</th>
        <th>배송 조회</th>
    </tr>
    <c:forEach var="rent" items="${userRentList}" varStatus="status">
        <tr>
        	<td>${status.index + 1}</td>
            <td>${rent.RENT_DATE}</td>
            <td>${rent.RENT_RETURN_DATE}</td>
            <td>${rent.BOOK_TITLE}</td>
            <td>
			    <c:choose>
			        <c:when test="${rent.RENT_STATUS eq 'Y'}">대출중</c:when>
			        <c:when test="${rent.RENT_STATUS eq 'N'}">반납완료</c:when>
			        <c:when test="${rent.RENT_STATUS eq 'A'}">대출 배송완료</c:when>
                    <c:when test="${rent.RENT_STATUS eq 'B'}">반납 배송완료</c:when>
			    </c:choose>
			</td>
			<td>
			    <c:choose>
			        <c:when test="${rent.RENT_STATUS eq 'Y'}">
                        <button onclick="">수거요청</button>
                    </c:when>
			        <c:otherwise></c:otherwise>
			    </c:choose>
			</td>
			<td>
				<button onclick="location.href='./delivery.do?user_seq=${loginVo.user_seq}'">배송조회</button>
			</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
