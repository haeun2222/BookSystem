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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>

<body>
<c:set var="loginUser" value="${sessionScope.loginDto}" />
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
			        <c:when test="${resve.RESVE_STATUS eq 'Y'}">
			        <button onclick="cancelReservation(${resve.BOOK_SEQ}, ${resve.USER_SEQ})">예약취소</button>
			        </c:when>
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



<script type="text/javascript">
    // 예약 취소 요청을 서버로 보내는 JavaScript 함수
    function cancelReservation(bookSeq, userSeq) {
        $.ajax({
            url: './cancle.do', // 컨트롤러 URL을 입력하세요
            type: 'POST', // 또는 'GET', HTTP 요청 방식에 맞게 설정하세요
            data: { book_seq: bookSeq, user_seq: userSeq },
            success: function(data) {
                // 성공적으로 서버에서 응답을 받았을 때 실행할 코드
                alert('예약이 취소되었습니다.');
                // 페이지 새로고침 또는 다른 동작을 수행하세요.
            },
            error: function(xhr, status, error) {
                // 서버 요청 중 오류가 발생했을 때 실행할 코드
                alert('예약 취소 중 오류가 발생했습니다.');
                // 오류 처리 로직을 구현하세요.
            }
        });
    }
</script>







<br>



</body>
</html>