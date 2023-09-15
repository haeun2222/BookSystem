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
                    <td>${resve.book_title}</td>
                    <td>
                        <c:choose>
                            <c:when test="${resve.resve_status eq 'Y'}">예약중</c:when>
                            <c:when test="${resve.resve_status eq 'R'}">대출대기</c:when>
                            <c:when test="${resve.resve_status eq 'N'}">예약취소</c:when>
                            <c:when test="${resve.resve_status eq 'C'}">자동취소</c:when>
                        </c:choose>
                    </td>
                    <td>${resve.resve_step}</td>
                    <td>
                        <c:choose>
                            <c:when test="${resve.resve_status eq 'Y'}"><button onclick="cancelReservation('${resve.resve_seq}')">${resve.resve_seq}예약취소</button></c:when>
                        </c:choose>
                    </td>
                    <td>
                        <c:choose>
                            <c:when test="${resve.resve_status eq 'R'}"><button onclick="">대출신청</button></c:when>
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

<br>

<script type="text/javascript">
function cancelReservation(resveSeq) {
    $.ajax({
        type: "POST",
        data: JSON.stringify(resveSeq),
        contentType: "application/json; charset=utf-8",
        success: function(response) {
            if (response == "success") {
                alert("예약이 취소되었습니다.");
                updateStep(resveSeq);
            } else {
                alert("예약 취소에 실패했습니다.");
            }
        },
        error: function() {
            alert("서버 오류가 발생했습니다.");
        }
    });
}

function updateStep(resveSeq) {
    $.ajax({
        type: "POST",
        url: "./getReservationInfo.do", 
        data: JSON.stringify(resveSeq),
        contentType: "application/json; charset=utf-8",
        success: function(reservationInfo) {
            if (reservationInfo) {
                var bookSeq = reservationInfo.bookSeq;
                var userSeq = reservationInfo.userSeq;

                var map = {
                    "book_seq": bookSeq,
                    "user_seq": userSeq
                };

                $.ajax({
                    type: "POST",
                    url: "./updateStep.do", 
                    data: JSON.stringify(map),
                    contentType: "application/json; charset=utf-8",
                    success: function(response) {
                        if (response == "success") {
                            alert("스텝이 업데이트되었습니다.");
                        } else {
                            alert("스텝 업데이트에 실패했습니다.");
                        }
                    },
                    error: function() {
                        alert("서버 오류가 발생했습니다.");
                    }
                });
            } else {
                alert("예약 정보를 가져오는 데 실패했습니다.");
            }
        },
        error: function() {
            alert("서버 오류가 발생했습니다.");
        }
    });
}


</script>


</body>
</html>