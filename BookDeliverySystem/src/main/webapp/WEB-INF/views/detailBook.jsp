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
<script type="text/javascript" src="js/userRentResve.js"></script>

<title>Insert title here</title>
</head>
<%@ include file="header.jsp" %>
<body>
<table class="tg">
<thead>
  <tr>
    <th class="tg-0pky" rowspan="5"><img src="${detailBook.book_img}" width="40%"></th>
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

<!-- 밑으로 하은이 추가한부분 / 나중에 주석 지우겠습니다 -->
<c:if test="${not empty sessionScope.loginDto}">
<c:if test="${filteredBookSeqList.contains(detailBook.book_seq.toString())}">
<input type="button" class="btn btn-danger" value="대출불가" onclick="impossibility()">
<input type="button" class="btn btn-info" value="예약신청" onclick="newResve1()">
</c:if>
<c:if test="${!filteredBookSeqList.contains(detailBook.book_seq.toString())}">
<input type="button" class="btn btn-primary" value="대출신청" onclick="checkAvailability()">
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
                <p id="modalContent"></p>
            </div>
            <div class="modal-footer text-center">
                <p id="modalFooter"></p>
            </div>
        </div>
    </div>
</div>
<%-- ${rentData} --%>
<%-- ${resveData} --%>
<!-- -->
<input type="hidden" id="rentDataSize" value="${rentData.size()}">
<input type="hidden" id="resveDataSize" value="${resveData.size()}">
<input type="hidden" id="filteredBookSeqList" value="${filteredBookSeqList}">
<input type="hidden" id="rentYBookSeqList" value="${rentYBookSeqList}">

<input type="hidden" id="rentDataTitle" value='${rentData[0].BOOK_TITLE}'>
<input type="hidden" id="rentData" value="${rentData}">

<input type="hidden" id="rentDataTitle" value='${rentData[0].BOOK_TITLE}'>
<input type="hidden" id="rentData" value="${rentData}">

<input type="hidden" id="loginDto" value="${loginDto}">
<input type="hidden" id="detailBook" value="${detailBook}">

<input type="hidden" id="userName" value="${loginDto.user_name}">
<input type="hidden" id="userEmail" value="${loginDto.user_email}">

<input type="hidden" id="bookTitle" value="${detailBook.book_title}">
<input type="hidden" id="bookWriter" value="${detailBook.book_writer}">

<script type="text/javascript">
//대출
function checkAvailability() {
    var rentDataSize = ${rentData.size()};
    var resveDataSize = ${resveData.size()};
    console.log("rentDataSize: " + rentDataSize);
    console.log("resveDataSize: " + resveDataSize);

    var modalContent = "";
    var modalFooter = $('<div></div>');
    var button1 = "";
    var button2 = "";

    if (rentDataSize == 0 && resveDataSize == 0) {
        modalContent = "<b>회원정보</b><br>이름 : ${loginDto.user_name}<br>이메일 : ${loginDto.user_email}<br><br><b>도서정보</b><br>도서명 : ${detailBook.book_title}<br>저자 : ${detailBook.book_writer}<br><br><b>대출신청 확인</b><br>대출신청을 하시겠습니까?<br>대출신청 버튼을 누르면 배송지 입력으로 이동합니다.";
        button1 = $('<button type="button" class="btn btn-primary ml-2">대출신청</button>');
        button2 = $('<button type="button" class="btn btn-danger ml-2" data-dismiss="modal">닫기</button>');

        button1.click(function() {
            window.location.href = "./addr.do?book_seq=" + ${detailBook.book_seq};
        });

        modalFooter.append(button1);
        modalFooter.append(button2);
    } else {
        if (resveDataSize > 0) {
            modalContent = "<b>회원정보</b><br>이름 : ${loginDto.user_name}<br>이메일 : ${loginDto.user_email}<br><br><b>예약정보</b><br>${loginDto.user_name}님은 현재<br>${resveData[0].BOOK_TITLE} 도서를 예약중입니다.<br>예약신청이 불가합니다.";
            button1 = $('<button type="button" class="btn btn-warning ml-2">예약조회</button>');
            button2 = $('<button type="button" class="btn btn-danger ml-2" data-dismiss="modal">닫기</button>');
            
            var user_seq = ${loginDto.user_seq};
            button1.click(function() {
                window.location.href = "./userResveList.do?user_seq=" + user_seq;
            });

            modalFooter.append(button1);
            modalFooter.append(button2);
        }
        if (rentDataSize > 0) {
            modalContent = "<b>회원정보</b><br>이름 : ${loginDto.user_name}<br>이메일 : ${loginDto.user_email}<br><br><b>대출정보</b><br>${loginDto.user_name}님은 현재<br>${rentData[0].BOOK_TITLE} 도서를 대출중입니다.<br>대출신청이 불가합니다.";
            button1 = $('<button type="button" class="btn btn-warning ml-2">대출조회</button>');
            button2 = $('<button type="button" class="btn btn-danger ml-2" data-dismiss="modal">닫기</button>');

            var user_seq = ${loginDto.user_seq};
            button1.click(function() {
                window.location.href = "./userRentList.do?user_seq=" + user_seq;
            });

            modalFooter.append(button1);
            modalFooter.append(button2);
        }
    }

    showModal1(modalContent, modalFooter);
}

function showModal1(content, modalFooter) {
    console.log("showModal1 content: ", content);
    console.log("showModal1 content: ", modalFooter);
    $('#modalContent').html(content);
    $('#modalFooter').html($(modalFooter));
    $('#rentModal').modal('show');
}


//예약
function newResve1() {
    var rentDataSize = ${rentData.size()};
    var resveDataSize = ${resveData.size()};
    var rentYBookSeqList = ${rentYBookSeqList};
    var isReservable = ${rentYBookSeqList.contains(detailBook.book_seq)};
    var user_seq = ${loginDto.user_seq};

    console.log("rentDataSize: " , rentDataSize);
    console.log("resveDataSize: " , resveDataSize);
    console.log("rentYBookSeqList: " , rentYBookSeqList);
    console.log("isReservable: " , isReservable);
    console.log("user_seq: " , user_seq);
    console.log("!isReservable : "  ,!isReservable);

    var modalContent = "";
    var modalFooter = $('<div></div>');
    var button1 = "";
    var button2 = "";

    if(rentDataSize == 0 && resveDataSize == 0){
        modalContent = "<b>회원정보</b><br>이름 : ${loginDto.user_name}<br>이메일 : ${loginDto.user_email}<br><br><b>도서정보</b><br>도서명 : ${detailBook.book_title}<br>저자 : ${detailBook.book_writer}<br><br><b>예약신청 확인</b><br>예약신청을 하시겠습니까?<br>예약신청 버튼을 누르면 신청이 완료됩니다.";
        button1 = $('<button type="button" class="btn btn-primary ml-2">예약신청</button>');
        button2 = $('<button type="button" class="btn btn-danger ml-2" data-dismiss="modal">닫기</button>');

        // 예약 넣는 아작스
        button1.click(function () {
            // AJAX 요청을 통해 예약 정보를 서버에 전송
            $.ajax({
                type: "POST", // 또는 "GET" 등 HTTP 요청 메소드 설정
                url: "./resveBook.do", // 서버의 예약 처리 메소드를 가리키는 URL
                contentType: "application/json", // Content-Type 설정
                data: JSON.stringify({
                    book_seq: ${detailBook.book_seq},
                    user_seq: ${loginDto.user_seq}
                }),
                success: function (response) {
                    // 예약이 성공하면 실행되는 함수
                    alert("예약신청이 완료되었습니다.");
                    window.location.href = "./userResveList.do?user_seq=" + ${loginDto.user_seq};
                },
                error: function (error) {
                    // 예약이 실패하면 실행되는 함수
                    alert("예약신청에 실패했습니다. 다시 시도해주세요.");
                }
            });
        });

        modalFooter.append(button1);
        modalFooter.append(button2);
    } 
    else if(rentDataSize == 0 && resveDataSize > 0){
        modalContent = "<b>회원정보</b><br>이름 : ${loginDto.user_name}<br>이메일 : ${loginDto.user_email}<br><br><b>예약정보</b><br>${loginDto.user_name}님은 현재<br>${resveData[0].BOOK_TITLE} 도서를 예약중입니다.<br>예약신청이 불가합니다.";
        button1 = $('<button type="button" class="btn btn-warning ml-2" data-dismiss="modal">예약조회</button>');
        button2 = $('<button type="button" class="btn btn-danger ml-2" data-dismiss="modal">닫기</button>');

        var user_seq = ${loginDto.user_seq};
        button1.click(function() {
            window.location.href = "./userResveList.do?user_seq=" + user_seq;
        });
        
        modalFooter.append(button1);
        modalFooter.append(button2);
    } 
    else if(resveDataSize == 0 && rentDataSize > 0){
        modalContent = "<b>회원정보</b><br>이름 : ${loginDto.user_name}<br>이메일 : ${loginDto.user_email}<br><br><b>대출정보</b><br>${loginDto.user_name}님은 현재<br>${rentData[0].BOOK_TITLE} 도서를 대출중입니다.<br>예약신청이 불가합니다.";
        button1 = $('<button type="button" class="btn btn-warning ml-2" data-dismiss="modal">대출조회</button>');
        button2 = $('<button type="button" class="btn btn-danger ml-2" data-dismiss="modal">닫기</button>');

        var user_seq = ${loginDto.user_seq};
        button1.click(function() {
            window.location.href = "./userRentList.do?user_seq=" + user_seq;
        });

        modalFooter.append(button1);
        modalFooter.append(button2);
    }

    showModal3(modalContent, modalFooter);
}

function showModal3(content, modalFooter) {
    console.log("showModal3 content: ", content);
    console.log("showModal3 content: ", modalFooter);
    $('#myModal1 .modal-body').html(content);
    $('#myModal1 .modal-footer').html($(modalFooter));
    $('#myModal1').modal('show');
}

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