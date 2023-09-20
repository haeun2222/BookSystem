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
<%@include file="/WEB-INF/views/header.jsp"%>
<body>
<c:set var="loginUser" value="${sessionScope.loginDto}" />
<c:choose>
    <c:when test="${not empty lists}">
		<h1>${loginUser.user_name}님의 예약 도서 목록 입니다</h1>
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
			        <c:when test="${resve.RESVE_STATUS eq 'S'}">대출진행완료</c:when>
			    </c:choose>
			</td>
            <td>
            	<c:choose>
            		<c:when test="${resve.RESVE_STATUS eq 'R'}">대출가능</c:when>
            		<c:when test="${resve.RESVE_STATUS eq 'S'}">&nbsp;</c:when>
            		<c:when test="${resve.RESVE_STEP eq 0}">&nbsp;</c:when>
            		<c:otherwise>${resve.RESVE_STEP}</c:otherwise>
            	</c:choose>
            
            </td>
            <td>
			    <c:choose>
			        <c:when test="${resve.RESVE_STATUS eq 'Y'}">
			        <button onclick="cancelReservation(${resve.BOOK_SEQ}, ${loginUser.user_seq})">예약취소</button>
			        </c:when>
			        <c:otherwise></c:otherwise>
			    </c:choose>
			</td>
			<td>
			    <c:choose>
			        <c:when test="${resve.RESVE_STATUS eq 'R'}"><button onclick="location.href = './addr.do?book_seq=' + ${resve.BOOK_SEQ}">대출신청</button></c:when>
			        <c:otherwise></c:otherwise>
			    </c:choose>
			</td>
        </tr>
    </c:forEach>
</table>
    </c:when>
    <c:otherwise>
        <h1>${loginUser.user_name}님은 예약 도서가 없습니다</h1>
    </c:otherwise>
</c:choose>


<script type="text/javascript">
    function cancelReservation(bookSeq, userSeq) {
        // 예약 취소 요청을 서버에 보냅니다.
        console.log(bookSeq, userSeq);
        $.ajax({
            type: "POST",
            url: "./cancel.do",
            contentType: "application/json",
            data: JSON.stringify({
                book_seq: bookSeq, // bookSeq 파라미터를 그대로 사용
                user_seq: userSeq // userSeq 파라미터를 그대로 사용
            }),
            success: function(response) {
                if (response == "success") {
                    alert("예약이 취소되었습니다.");
                    window.location.replace("./userResveList.do?user_seq=${loginDto.user_seq}");
                    window.location.reload(true);
                } else {
                    alert("예약 취소에 실패했습니다. 다시 시도해주세요.");
                }
            },
            error: function(xhr, status, error) {
                alert("예약 취소 요청에 실패했습니다. 다시 시도해주세요.");
            }
        });
    }

</script>



</body>
</html>