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
                        <button onclick="confirmReturn(${rent.RENT_SEQ})">반납확인</button>
                        </c:when>
                    </c:choose>
                </td>
                <td style="display: flex; align-items: center;">
            	    	<input type="text">
  					  <button>입력</button>
                </td>
                <!-- 코드 합칠때 상태가 @@@배송완료@@@ 일때 로 수정해야함 -->
                <!-- 버튼에 업데이트(반납완료처리) 메소드 달아야함 -->
            </tr>
        </c:forEach>
    </table>
</body>
<script>
function confirmReturn(rentSeq) {
    // AJAX를 사용하여 서버에 요청을 보냅니다.
    $.ajax({
        type: "POST", // 요청 메서드 (POST 또는 GET 등)
        url: "./confirmReturn.do", // 요청을 처리할 서버의 URL
        data: { rentSeq: rentSeq }, // 서버에 전달할 데이터 (rentSeq를 전달)
        success: function(response) {
            // 요청이 성공적으로 처리되면 이 함수가 호출됩니다.
            if (response === "success") {
                // 성공적으로 반납이 확인된 경우에 대한 처리
                alert("반납이 확인되었습니다.");
                // 페이지 새로고침 또는 필요한 작업 수행
                location.reload(); // 페이지를 새로고침하거나, 필요한 작업을 수행하세요.
            } else {
                // 실패한 경우에 대한 처리
                alert("반납 확인에 실패했습니다.");
            }
        },
        error: function(xhr, status, error) {
            console.error("AJAX 요청이 오류와 함께 실패했습니다: " + error);
            alert("요청을 처리하는 동안 오류가 발생했습니다.");
        }
    });
}
</script>
</html>