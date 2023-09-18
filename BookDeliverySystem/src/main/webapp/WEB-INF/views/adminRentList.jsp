<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Insert title here</title>
</head>
<body>
    <h1>관리자 대출 도서 목록</h1>
    <table border="1">
        <tr>
        	<th>No.</th>
            <th>사용자 이름</th>
            <th>도서 제목</th>
            <th>대출 일자</th>
            <th>반납 일자</th>
            <th>대출 상태</th>
            <th>처리</th>
            <th>운송장</th>
        </tr>
        <c:forEach var="rent" items="${lists}" varStatus="status">
            <tr>
        	    <td>${rent.BOOK_SEQ}</td>
                <td>${rent.USER_NAME}</td>
                <td>${rent.BOOK_TITLE}</td>
                <td>${rent.RENT_DATE}</td>
                <td>${rent.RENT_RETURN_DATE}</td>
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
            	    	<input type="text" id="deliveryNum${rent.USER_SEQ}" placeholder="운송장번호 입력">
  					    <button onclick="updateDelivery('${rent.USER_SEQ}', ${rent.RENT_SEQ})">입력</button>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
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
            alert("대출대기 완료");
        } else {
            alert("예약이 없어 대출대기 X");
        }
        location.reload();
    } catch (error) {
        console.error("오류 발생: " + error);
        alert("요청을 처리하는 동안 오류가 발생했습니다.");
    }
}

</script>
<script type="text/javascript">
async function updateDelivery(userSeq, rentSeq) {
    try {
        const deliveryNumInputId = `deliveryNumInput${userSeq}`;
        const deliveryNum = document.getElementById(deliveryNumInputId).value;

        // AJAX 요청을 사용하여 서버에 운송장 번호 업데이트 요청 보내기
        const updateResponse = await $.ajax({
            type: "POST",
            url: "./updateDeliveryNum.do",
            data: { userSeq: userSeq, rentSeq: rentSeq, deliveryNum: deliveryNum }
        });

        if (updateResponse == "success") {
            alert("운송장 번호 업데이트 완료");
            location.reload(); // 페이지 새로고침
        } else {
            alert("운송장 번호 업데이트 실패");
        }
    } catch (error) {
        console.error("오류 발생: " + error);
        alert("요청을 처리하는 동안 오류가 발생했습니다.");
    }
}


</script>
</html>