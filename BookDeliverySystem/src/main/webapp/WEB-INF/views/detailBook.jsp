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
<script type="text/javascript" src="js/userRentResve.js" defer="defer"></script>

<title>Insert title here</title>
</head>
<%@ include file="header.jsp" %>
<body>
<table class="tg">
<thead>
  <tr>
    <th class="tg-0pky" rowspan="5"><img src="./img/bamin_1.png" width="50%"></th>
    <th class="tg-0pky">${detailBook.book_title}</th>
  </tr>
  <tr>
    <th class="tg-0pky">${detailBook.book_writer}</th>
  </tr>
  <tr>
    <th class="tg-0pky">${detailBook.book_isbn}</th>
  </tr>
  <tr>
    <th class="tg-0lax">${detailBook.book_publisher}</th>
  </tr>
  <tr>
    <th class="tg-0lax"><fmt:formatDate value="${detailBook.book_published_date}" pattern="yyyy-MM-dd"/></th>
  </tr>
 
</thead>
<tbody style="text-align: center;">
  <tr>
    <td class="tg-0lax" colspan="2">${detailBook.book_intro}</td>
  </tr>
  <tr>
    <td class="tg-0lax" colspan="2">${detailBook.book_index}</td>
  </tr>
  <tr>
    <td class="tg-0lax" colspan="2">${detailBook.book_summary}</td>
  </tr>
</tbody>
</table>


<c:if test="${not empty sessionScope.loginDto}">
<c:if test="${filteredBookSeqList.contains(detailBook.book_seq.toString())}">
<input type="button" class="btn btn-danger" value="대출불가" onclick="impossibility()">
<input type="button" class="btn btn-info" value="예약신청" onclick="newResve1()">
</c:if>
<c:if test="${!filteredBookSeqList.contains(detailBook.book_seq.toString())}">
<input type="button" class="btn btn-primary" value="대출신청" onclick="chkAvailability()">
<input type="button" class="btn btn-danger" value="예약불가" onclick="newResve()">
</c:if>
</c:if>
<c:if test="${empty sessionScope.loginDto}">
	<br><div>도서 대출과 예약은 로그인 후 이용하실 수 있습니다.</div><br>
    <input type="button" class="btn btn-success" value="로그인" onclick="location.href='./loginPage.do'">
</c:if>

<!-- 대출 모달 창 -->
<div class="modal fade" id="rentModal" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <!-- 모달 제목 -->
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title" id="modalTitle">대출 신청 확인</h4>
            </div>
            <div class="modal-body">
                <!-- 모달 내용 -->
                <p id="modalContent"></p>
            </div>
            <div class="modal-footer text-center">
                <!-- 모달 푸터 -->
                <p id="modalFooter"></p>
            </div>
        </div>
    </div>
</div>

<!-- 예약 모달 창 -->
<div class="modal fade" id="myModal1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <!-- 모달 제목 -->
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title" id="modalTitle">예약 신청 확인</h4>
            </div>
            <div class="modal-body">
                <!-- 모달 내용 -->
                <p id="modalContent2"></p>
            </div>
            <div class="modal-footer text-center">
                <p id="modalFooter2"></p>
            </div>
        </div>
    </div>
</div>

<!-- js에서 사용할 변수 -->
<input type="hidden" id="rentDataSize" value="${rentData.size()}">
<input type="hidden" id="resveDataSize" value="${resveData.size()}">
<input type="hidden" id="filteredBookSeqList" value="${filteredBookSeqList}">
<input type="hidden" id="rentYBookSeqList" value="${rentYBookSeqList}">

<input type="hidden" id="rentDataTitle" value='${rentData[0].BOOK_TITLE}'>
<input type="hidden" id="rentData" value="${rentData}">

<input type="hidden" id="resveDataTitle" value='${resveData[0].BOOK_TITLE}'>
<input type="hidden" id="resveData" value="${resveData}">

<input type="hidden" id="loginDto" value="${loginDto}">
<input type="hidden" id="userName" value="${loginDto.user_name}">
<input type="hidden" id="userEmail" value="${loginDto.user_email}">
<input type="hidden" id="userSeq" value="${loginDto.user_seq}">

<input type="hidden" id="detailBook" value="${detailBook}">
<input type="hidden" id="bookTitle" value="${detailBook.book_title}">
<input type="hidden" id="bookWriter" value="${detailBook.book_writer}">
<input type="hidden" id="bookSeq" value="${detailBook.book_seq}">

<input type="hidden" id="isReservable" value="${rentYBookSeqList.contains(detailBook.book_seq)}">

<script type="text/javascript">


function newResve(){
   alert("해당도서는 현재 대출가능하므로 예약신청은 불가합니다.");
}

function impossibility(){
   alert("해당도서는 현재 대출중입니다. 예약신청만 가능합니다.");
}
</script>
</body>
<%@ include file="footer.jsp" %>
</html>