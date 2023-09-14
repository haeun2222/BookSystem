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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<%-- ${rDto} --%>
${rentData.size()}
@@@@@@@@@@@@@@@@@@@@@@@@@<br>
${rentData}
${rentData[0].USER_SEQ}
${loginVo.user_seq}
@@@@@@@@@@@@@@@@@@@@@@@@@<br>
@@@@@@@@@@@@@@@@@@@<br>
${filteredBookSeqList}<br>
@@@@@@@@@@@@@@@@@@@@@@@@@<br>
@@@@@@@@@@@@@@@@@@@<br>
<div id="rentDataSize" data-rent-data-size="${rentData.size()}"></div>
<div id="resveDataSize" data-resve-data-size="${resveData.size()}"></div>
<!-- <br>★★★★★★★★★★★<br> -->
<%--     ${loginVo.user_name}님은 현재 ${rentData[0].BOOK_TITLE} 도서를 대출중입니다. --%>
<%--     책번호 ${rentData[0].BOOK_SEQ} --%>
<%--     유저번호 ${rentData[0].USER_SEQ} --%>
<!-- <br>★★★★★★★★★★★<br> -->
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@<br> -->
<!-- @@@@@@@@@@@@@@@@@@@<br> -->
<!-- <br>★★★★★★★★★★★<br> -->
<%--     ${loginVo.user_name}님은 현재 ${resveData[0].BOOK_TITLE} 도서를 예약중입니다. --%>
<!-- <br>★★★★★★★★★★★<br> -->




<div>SEQ: ${dto.book_seq}</div>
<div>도서명: ${dto.book_title}</div>
<div>저자: ${dto.book_writer}</div>
<div>isbn: ${dto.book_isbn}</div>
<c:if test="${filteredBookSeqList.contains(dto.book_seq.toString())}">
<input type="button" class="btn btn-danger" value="대출불가" onclick="impossibility()">
<input type="button" class="btn btn-info" value="예약신청" onclick="newResve('${dto}')">
</c:if>
<c:if test="${!filteredBookSeqList.contains(dto.book_seq.toString())}">
<input type="button" class="btn btn-primary" value="대출신청" onclick="checkAvailability()">
<input type="button" class="btn btn-info" value="예약신청" onclick="newResve('${dto}')">
</c:if>

<!-- 모달 창 -->
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <!-- 모달 제목 -->
                <h4 class="modal-title" id="modalTitle">대출 신청 확인</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <!-- 모달 내용 -->
                <p id="modalContent"></p>
            </div>
            <div class="modal-footer d-flex justify-content-center">
            	<p id="modalFooter"></p>
            </div>
        </div>
    </div>
</div>



<script type="text/javascript">
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
        modalContent = "<b>회원정보</b><br>이름 : ${loginVo.user_name}<br>이메일 : ${loginVo.user_email}<br><br><b>도서정보</b><br>도서명 : ${dto.book_title}<br>저자 : ${dto.book_writer}<br><br><b>대출신청 확인</b><br>대출신청을 하시겠습니까?<br>대출신청 버튼을 누르면 배송지 입력으로 이동합니다.";
        button1 = $('<button type="button" class="btn btn-primary ml-2">대출신청</button>');
        button2 = $('<button type="button" class="btn btn-primary ml-2">닫기</button>');
        
        button1.click(function() {
        	window.location.href = "./배송지입력URL.do?book_seq=" + ${dto.book_seq};
        });

        button2.click(function() {
            $('#myModal').modal('hide');
        });
        
        modalFooter.append(button1);
        modalFooter.append(button2);
        
    } else {
        if (rentDataSize > 0) {
        	modalContent = "<b>회원정보</b><br>이름 : ${loginVo.user_name}<br>이메일 : ${loginVo.user_email}<br><br><b>대출정보</b><br>${loginVo.user_name}님은 현재<br>${rentData[0].BOOK_TITLE} 도서를 대출중입니다.<br>대출신청이 불가합니다.";
            button1 = $('<button type="button" class="btn btn-danger ml-2">대출조회</button>');
            button2 = $('<button type="button" class="btn btn-danger ml-2">닫기</button>');
            
            var user_seq = ${loginVo.user_seq};
            button1.click(function() {
                window.location.href = "./userRentList.do?user_seq=" + user_seq;
            });

            button2.click(function() {
                $('#myModal').modal('hide');
            });
            
            modalFooter.append(button1);
            modalFooter.append(button2);
        }

        if (resveDataSize > 0) {
        	modalContent = "<b>회원정보</b><br>이름 : ${loginVo.user_name}<br>이메일 : ${loginVo.user_email}<br><br><b>예약정보</b><br>${loginVo.user_name}님은 현재<br>${resveData[0].BOOK_TITLE} 도서를 예약중입니다.<br>대출신청이 불가합니다.";
        	button1 = $('<button type="button" class="btn btn-warning ml-2">예약조회</button>');
            button2 = $('<button type="button" class="btn btn-danger ml-2">닫기</button>');
            
            var user_seq = ${loginVo.user_seq};
            button1.click(function() {
                window.location.href = "./userResveList.do?user_seq=" + user_seq;
            });

            button2.click(function() {
                $('#myModal').modal('hide');
            });
            
            modalFooter.append(button1);
            modalFooter.append(button2);
        }
    }

    showModal(modalContent, modalFooter);
}

function showModal(content, button, modalFooter) {
    console.log("showModal content: " , content);
    console.log("showModal content: " , modalFooter);
    $('#myModal .modal-body').html(content);
    $('#myModal .modal-footer').html($(button));
    $('#myModal').modal('show');
}
</script>

















<!-- 예약 모달 창 -->
<div class="modal fade" id="newResve" role="dialog">
  <div class="modal-dialog modal-md">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">예약 신청 정보 확인</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <div class="modal-body">
        <h4>Title: ${dto.book_title}</h4>
        <h4>Writer: ${dto.book_writer}</h4>
      </div>
      <div class="modal-body">
        <h4>회원명: ${loginVo.user_name}<span id="userName"></span></h4>
        <h4>이메일: ${loginVo.user_email}<span id="userEmail"></span></h4>
      </div>
      <div class="modal-body">
        예약신청을 하시겠습니까?<br>
        
        예약신청 버튼을 누르시면 예약신청이 완료됩니다
      </div>
      <div class="modal-footer">
        <button class="btn btn-success" onclick="applyForResve(${loginVo.user_seq})">예약신청</button>
        <button class="btn btn-info" data-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>



<script>
function newResve(bookDto) {
    $('#newResve').modal('show');
}

function applyForResve() {
    alert("예약신청이 완료되었습니다.");

    window.location.href = "./userResveList.do?user_seq=${loginVo.user_seq}";
}

function impossibility(){
	alert("해당도서는 현재 대출중입니다. 예약신청만 가능합니다.");
}
</script>

</body>
</html>