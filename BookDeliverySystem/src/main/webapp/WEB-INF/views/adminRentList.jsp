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
<%@include file="/WEB-INF/views/header.jsp"%>
<body>
${addrDto}
<div class="container">
    <h1>계발의민족 회원 도서 대출 목록</h1>
    <table border="1">
        <tr>
        	<th>No.</th>
            <th>사용자 이름</th>
            <th>도서 제목</th>
            <th>대출일</th>
            <th>반납예정일</th>
            <th>대출 상태</th>
            <th>처리</th>
            <th>운송장</th>
        </tr>
        <c:forEach var="rent" items="${lists}" varStatus="status">
            <tr>
<%--         	    <td>${rent.BOOK_SEQ}</td> --%>
				<td>${status.index + 1}</td>
                <td>${rent.USER_NAME}</td>
                <td>${rent.BOOK_TITLE}</td>
                <td>
                	<fmt:formatDate value="${rent.RENT_DATE}" pattern="yyyy.MM.dd"/>
                </td>
                <td>
                	<fmt:formatDate value="${rent.RENT_RETURN_DATE}" pattern="yyyy.MM.dd"/>
                </td>
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
                        <c:when test="${rent.RENT_STATUS eq 'B'}">
                        <button onclick="handleActions(${rent.RENT_SEQ}, ${rent.BOOK_SEQ})">반납확인</button>
                        </c:when>
                    </c:choose>
                </td>
                <td style="display: flex; align-items: center;">
            	    	<input type="text" id="deliveryNum${rent.USER_SEQ}" placeholder="운송장번호 입력" value="">
  					   <button onclick="updateDelivery(${rent.USER_SEQ}, '${rent.USER_SEQ.delivery_num}')">입력</button>

                </td>
            </tr>
        </c:forEach>
    </table>
</div> 
</body>
<%@ include file="footer.jsp" %>
<script>
//버튼 클릭 시 두 개의 메소드를 호출하는 함수
async function handleActions(rentSeq, bookSeq) {
    try {
        // 첫 번째 AJAX 요청 (rentSeq 사용)
        const confirmResponse = await $.ajax({
            type: "POST",
            url: "./confirmReturn.do",
            data: { rentSeq: rentSeq }
        });

        if (confirmResponse == "success") {
            alert("반납확인 완료");
        } else {
            alert("반납확인 실패");
        }

        // 두 번째 AJAX 요청 (bookSeq 사용)
        const rentStandbyResponse = await $.ajax({
            type: "POST",
            url: "./rentStandby.do",
            data: { bookSeq: bookSeq }
        });

        if (rentStandbyResponse == "success") {
            alert("해당도서의 예약회원의 상태가 대출대기로 변경되었습니다.");
        } else {
            alert("해당도서는 예약건이 없어 예약상태변경이 진행되지 않습니다.");
        }
        location.reload();
    } catch (error) {
        console.error("오류 발생: " + error);
        alert("요청을 처리하는 동안 오류가 발생했습니다.");
    }
}

</script>
<script type="text/javascript">
function updateDelivery(userSeq, deliveryNum) {
    // 운송장 번호 입력 필드에서 값을 가져온다
const deliveryNum = document.getElementById('deliveryNum${userSeq}').value;


    // AJAX를 사용하여 서버에 업데이트 요청을 보냄
    $.ajax({
        url: './updateDeliveryNum.do', 
        type: 'POST', // 업데이트 요청의 HTTP
        data: {
        	 user_seq: userSeq,
             delivery_num: deliveryNum
        },
        success: function(response) {
            
            alert('운송장 번호가 업데이트되었습니다.');
        },
        error: function(error) {
            // 업데이트가 실패한 경우 처리할 내용을 여기에 추가하세요.
            alert('운송장 번호 업데이트 중 오류가 발생했습니다.');
        }
    });
}
</script>

</html>