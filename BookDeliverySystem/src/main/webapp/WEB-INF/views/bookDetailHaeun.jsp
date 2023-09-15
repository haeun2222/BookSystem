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
빌린책 있는지 : ${rentData}<br>
예약중인책 있는지 : ${resveData}<br>
${rentData[0].USER_SEQ}
@@@@@@@@@@@@@@@@@@@@@@@@@<br>
@@@@@@@@@@@@@@@@@@@<br>
현재 빌릴수없는 책들(대출중+예약대기[R]) : ${filteredBookSeqList}<br>
@@@@@@@@@@@@@@@@@@@@@@@@@<br>
현재 빌릴수없는 책중 대출중인책 : ${rentYBookSeqList}
@@@@@@@@@@@@@@@@@@@<br>
${dto.book_seq}




<div>SEQ: ${dto.book_seq}</div>
<div>도서명: ${dto.book_title}</div>
<div>저자: ${dto.book_writer}</div>
<div>isbn: ${dto.book_isbn}</div>
<c:if test="${filteredBookSeqList.contains(dto.book_seq.toString())}">
<input type="button" class="btn btn-danger" value="대출불가" onclick="impossibility()">
<input type="button" class="btn btn-info" value="예약신청" onclick="newResve1()">
</c:if>
<c:if test="${!filteredBookSeqList.contains(dto.book_seq.toString())}">
<input type="button" class="btn btn-primary" value="대출신청" onclick="checkAvailability()">
<input type="button" class="btn btn-danger" value="예약불가" onclick="newResve()">
</c:if>

<!-- 대출 모달 창 -->
<div class="modal fade" id="rentModal" role="dialog">
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

<!-- 예약 모달 창1 -->
<div class="modal fade" id="myModal1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <!-- 모달 제목 -->
                <h4 class="modal-title" id="modalTitle">예약 신청 확인</h4>
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




<!-- 예약 모달 창2 -->
<div class="modal fade" id="myModal2" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <!-- 모달 제목 -->
                <h4 class="modal-title" id="modalTitle">예약 신청 확인</h4>
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
        	window.location.href = "./addr.do?book_seq=" + ${dto.book_seq};
        });

        button2.click(function() {
            $('#rentModal').modal('hide');
        });
        
        modalFooter.append(button1);
        modalFooter.append(button2);
        
    } else {
        if (resveDataSize > 0) {
        	modalContent = "<b>회원정보</b><br>이름 : ${loginVo.user_name}<br>이메일 : ${loginVo.user_email}<br><br><b>예약정보</b><br>${loginVo.user_name}님은 현재<br>${resveData[0].BOOK_TITLE} 도서를 예약중입니다.<br>예약신청이 불가합니다.";
        	button1 = $('<button type="button" class="btn btn-warning ml-2">예약조회</button>');
            button2 = $('<button type="button" class="btn btn-danger ml-2">닫기</button>');
            
            var user_seq = ${loginVo.user_seq};
            button1.click(function() {
                window.location.href = "./userResveList.do?user_seq=" + user_seq;
            });

            button2.click(function() {
                $('#rentModal').modal('hide');
            });
            
            modalFooter.append(button1);
            modalFooter.append(button2);
        }
        if (rentDataSize > 0) {
        	modalContent = "<b>회원정보</b><br>이름 : ${loginVo.user_name}<br>이메일 : ${loginVo.user_email}<br><br><b>대출정보</b><br>${loginVo.user_name}님은 현재<br>${rentData[0].BOOK_TITLE} 도서를 대출중입니다.<br>대출신청이 불가합니다.";
            button1 = $('<button type="button" class="btn btn-danger ml-2">대출조회</button>');
            button2 = $('<button type="button" class="btn btn-danger ml-2">닫기</button>');
            
            var user_seq = ${loginVo.user_seq};
            button1.click(function() {
                window.location.href = "./userRentList.do?user_seq=" + user_seq;
            });

            button2.click(function() {
                $('#rentModal').modal('hide');
            });
            
            modalFooter.append(button1);
            modalFooter.append(button2);
        }

    }

    showModal1(modalContent, modalFooter);
}

function showModal1(content, button, modalFooter) {
    console.log("showModal1 content: " , content);
    console.log("showModal1 content: " , modalFooter);
    $('#rentModal .modal-body').html(content);
    $('#rentModal .modal-footer').html($(button));
    $('#rentModal').modal('show');
}

//예약1
function newResve1() {
    var rentDataSize = ${rentData.size()};
    var resveDataSize = ${resveData.size()};
    var rentYBookSeqList = ${rentYBookSeqList};
    var isReservable = ${rentYBookSeqList.contains(dto.book_seq)};
    var user_seq = ${loginVo.user_seq};

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

  
        if (user_seq == null || user_seq == "") {
            // 사용자가 비회원인 경우
            // alert("회원 가입 후 예약신청이 가능합니다.");
            // window.location.href = "./main.do"; // 메인 페이지 URL로 리다이렉트
        }else{
        	if(resveDataSize == 0){
        
            modalContent = "<b>회원정보</b><br>이름 : ${loginVo.user_name}<br>이메일 : ${loginVo.user_email}<br><br><b>도서정보</b><br>도서명 : ${dto.book_title}<br>저자 : ${dto.book_writer}<br><br><b>예약신청 확인</b><br>예약신청을 하시겠습니까?<br>예약신청 버튼을 누르면 신청이 완료됩니다.";
            button1 = $('<button type="button" class="btn btn-primary ml-2">예약신청</button>');
            button2 = $('<button type="button" class="btn btn-primary ml-2">닫기</button>');

            // 예약 넣는 아작스
            button1.click(function () {
                // AJAX 요청을 통해 예약 정보를 서버에 전송
                $.ajax({
                    type: "POST", // 또는 "GET" 등 HTTP 요청 메소드 설정
                    url: "./resveBook.do", // 서버의 예약 처리 메소드를 가리키는 URL
                    contentType: "application/json", // Content-Type 설정
                    data: JSON.stringify({
                        book_seq: ${dto.book_seq},
                        user_seq: ${loginVo.user_seq}
                    }),
                    success: function (response) {
                        // 예약이 성공하면 실행되는 함수
                        alert("예약신청이 완료되었습니다.");
                        window.location.href = "./userResveList.do?user_seq=" + ${loginVo.user_seq};
                    },
                    error: function (error) {
                        // 예약이 실패하면 실행되는 함수
                        alert("예약신청에 실패했습니다. 다시 시도해주세요.");
                    }
                });
            });

            button2.click(function () {
                $('#myModal1').modal('hide');
            });

            modalFooter.append(button1);
            modalFooter.append(button2);
        } else if(resveDataSize > 0){
        	modalContent = "<b>회원정보</b><br>이름 : ${loginVo.user_name}<br>이메일 : ${loginVo.user_email}<br><br><b>예약정보</b><br>${loginVo.user_name}님은 현재<br>${resveData[0].BOOK_TITLE} 도서를 예약중입니다.<br>예약신청이 불가합니다.";
        	button1 = $('<button type="button" class="btn btn-danger ml-2">닫기</button>');
        	
        	 button1.click(function () {
                 $('#myModal1').modal('hide');
             });
        	 modalFooter.append(button1);
        } else if(rentDataSize > 0){
        	modalContent = "테스트.";
        	button1 = $('<button type="button" class="btn btn-danger ml-2">닫기</button>');
        	
        	 button1.click(function () {
                 $('#myModal1').modal('hide');
             });
        }
    

    showModal3(modalContent, modalFooter);
}

}

function showModal3(content, button, modalFooter) {
    console.log("showModal3 content: ", content);
    console.log("showModal3 content: ", modalFooter);
    $('#myModal1 .modal-body').html(content);
    $('#myModal1 .modal-footer').html($(button));
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
</html>