//document.addEventListener("DOMContentLoaded", function() {
//    var rentDataSize = document.getElementById("rentDataSize").value;
//    var resveDataSize = document.getElementById("resveDataSize").value;
//    var filteredBookSeqList = document.getElementById("filteredBookSeqList").value;
//    var rentYBookSeqList = document.getElementById("rentYBookSeqList").value;
//    console.log(rentDataSize, resveDataSize, filteredBookSeqList, rentYBookSeqList);
//
//	var rentDataTitle = document.getElementById("rentDataTitle").value;
//	console.log("rentDataTitle : " ,rentDataTitle);
//	
//	var rentData = document.getElementById("rentData").value;
//	console.log("@@@@@@@@rentData : " ,rentData);
////	var resveData = document.getElementById("resveData").value;
//	
//	var loginDto = document.getElementById("loginDto").value;
//	var detailBook = document.getElementById("detailBook").value;
//	
//	var userName = document.getElementById("userName").value;
//	var userEmail = document.getElementById("userEmail").value;
//	
//	var bookTitle = document.getElementById("bookTitle").value;
//	var bookWriter = document.getElementById("bookWriter").value;
//	console.log(loginDto);
//	console.log(userName, userEmail);
//	console.log(detailBook);
//	console.log(bookTitle,bookWriter);
//	console.log("ff : ",filteredBookSeqList);
//	console.log(resveData[0].BOOK_TITLE);
//	console.log(rentDate[0].BOOK_TITLE);
//
//function checkAvailability(rentDataSize, resveDataSize, loginDto, detailBook) {
//
//
//    if (rentDataSize == 0 && resveDataSize == 0) {
//        modalContent = "<b>회원정보</b><br>이름 : " + userName + "<br>이메일 : " + userEmail + "<br><br><b>도서정보</b><br>도서명 : " + bookTitle + "<br>저자 : " + bookWriter + "<br><br><b>대출신청 확인</b><br>대출신청을 하시겠습니까?<br>대출신청 버튼을 누르면 배송지 입력으로 이동합니다.";
//        button1 = $('<button type="button" class="btn btn-primary ml-2">대출신청</button>');
//        button2 = $('<button type="button" class="btn btn-danger ml-2" data-dismiss="modal">닫기</button>');
//
//        button1.click(function() {
//            window.location.href = "./addr.do?book_seq=" + detailBook.book_seq;
//        });
//
//        modalFooter.append(button1);
//        modalFooter.append(button2);
//    } else {
//        if (resveDataSize > 0) {
//            modalContent = "<b>회원정보</b><br>이름 : " + userName + "<br>이메일 : " + userEmail + "<br><br><b>예약정보</b><br>" + userName + "님은 현재<br>" + resveData[0].BOOK_TITLE + " 도서를 예약중입니다.<br>예약신청이 불가합니다.";
//            button1 = $('<button type="button" class="btn btn-warning ml-2">예약조회</button>');
//            button2 = $('<button type="button" class="btn btn-danger ml-2" data-dismiss="modal">닫기</button>');
//            
//            var user_seq = loginDto.user_seq;
//            button1.click(function() {
//                window.location.href = "./userResveList.do?user_seq=" + user_seq;
//            });
//
//            modalFooter.append(button1);
//            modalFooter.append(button2);
//        }
//        if (rentDataSize > 0) {
//            modalContent = "<b>회원정보</b><br>이름 : " + loginDto.user_name + "<br>이메일 : " + loginDto.user_email + "<br><br><b>대출정보</b><br>" + loginDto.user_name + "님은 현재<br>" + rentData[0].BOOK_TITLE + " 도서를 대출중입니다.<br>대출신청이 불가합니다.";
//            button1 = $('<button type="button" class="btn btn-warning ml-2">대출조회</button>');
//            button2 = $('<button type="button" class="btn btn-danger ml-2" data-dismiss="modal">닫기</button>');
//
//            var user_seq = loginDto.user_seq;
//            button1.click(function() {
//                window.location.href = "./userRentList.do?user_seq=" + user_seq;
//            });
//
//            modalFooter.append(button1);
//            modalFooter.append(button2);
//        }
//    }
//
//    showModal1(modalContent, modalFooter);
//}
//
//function showModal1(content, modalFooter) {
//    console.log("showModal1 content: ", content);
//    console.log("showModal1 content: ", modalFooter);
//    $('#modalContent').html(content);
//    $('#modalFooter').html($(modalFooter));
//    $('#rentModal').modal('show');
//}
//});