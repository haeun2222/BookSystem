<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/font.css">
<link rel="stylesheet" href="css/header.css">
<title>Insert title here</title>
</head>
<%@ include file="header.jsp" %>
<body>
<div class="container">
<c:set var="loginUser" value="${sessionScope.loginDto}" />
<h1>${loginUser.user_name}님의 대출 도서 목록 입니다</h1>
    <button id="refreshButton">대출내역 갱신</button>

    <!-- JavaScript 코드 -->
    <script>
        // 페이지 새로고침 버튼을 클릭할 때 페이지를 새로고침합니다.
        document.getElementById("refreshButton").addEventListener("click", function() {
            location.reload();
        });
    </script>
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
        	<td>
                <fmt:formatDate value="${rent.RENT_DATE}" pattern="yyyy.MM.dd"/>
            </td>
            <td>
                <fmt:formatDate value="${rent.RENT_RETURN_DATE}" pattern="yyyy.MM.dd"/>
            </td>
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

                       <button onclick="location.href='./returnAddr.do?user_seq=${loginDto.user_seq}&book_seq=${rent.BOOK_SEQ}'">수거요청</button>


                    </c:when>
			        <c:otherwise></c:otherwise>
			    </c:choose>
			</td>
			<td>
			<button onclick="openTrackerForm()">배송조회</button>

			
<%-- 				<button onclick="location.href='./delivery.do?user_seq=${loginDto.user_seq}'">배송조회</button> --%>
			</td>
        </tr>
    </c:forEach>
</table>
</div>
</body>
<%@ include file="footer.jsp" %>
<script>
function openTrackerForm() {
    	window.open("http://info.sweettracker.co.kr/tracking/5?t_key=vIvDVTiiTlMarYcHz1x5wQ&t_code=04&t_invoice=578914961436", "_blank", "width=600,height=400");
}
</script>
			
</html>
