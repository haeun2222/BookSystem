<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
        
<c:set var="loginUser" value="${sessionScope.loginVo}" />
<c:choose>
    <c:when test="${not empty lists}">
		<h1>${loginUser.user_name}님의 현재 예약 현황 입니다</h1>
            <table border="1">
    <tr>
        <th>No.</th>
        <th>도서명</th>
        <th>예약상태</th>
        <th>예약순번</th>
        <th>예약취소</th>
        <th>대출신청</th>
    </tr>
    <c:forEach var="resve" items="${lists}"  varStatus="status">
        <tr>
        	<td>${status.index + 1}</td>
            <td>${resve.BOOK_TITLE}</td>
            <td>
			    <c:choose>
			        <c:when test="${resve.RESVE_STATUS eq 'Y'}">예약중</c:when>
			        <c:when test="${resve.RESVE_STATUS eq 'R'}">대출대기</c:when>
			        <c:when test="${resve.RESVE_STATUS eq 'N'}">예약취소</c:when>
			        <c:when test="${resve.RESVE_STATUS eq 'C'}">자동취소</c:when>
			    </c:choose>
			</td>
            <td>${resve.RESVE_STEP}</td>
            <td>
			    <c:choose>
			        <c:when test="${resve.RESVE_STATUS eq 'Y'}"><button onclick="">예약취소</button></c:when>
			        <c:otherwise></c:otherwise>
			    </c:choose>
			</td>
			<td>
			    <c:choose>
			        <c:when test="${resve.RESVE_STATUS eq 'R'}"><button onclick="">대출신청</button></c:when>
			        <c:otherwise></c:otherwise>
			    </c:choose>
			</td>
        </tr>
    </c:forEach>
</table>
    </c:when>
    <c:otherwise>
        <h1>예약 현황이 없습니다</h1>
    </c:otherwise>
</c:choose>





</body>
</html>