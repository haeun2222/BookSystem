//function checkAvailability(rentDataSize, resveDataSize, loginDto, detailBook) {
//	var rentDataSize = ;
//	var resveDataSize = ;
//	var loginDto = ;
//    var modalContent = "";
//    var modalFooter = $('<div></div>');
//    var button1 = "";
//    var button2 = "";
//
//    if (rentDataSize == 0 && resveDataSize == 0) {
//        modalContent = "<b>회원정보</b><br>이름 : " + loginDto.user_name + "<br>이메일 : " + loginDto.user_email + "<br><br><b>도서정보</b><br>도서명 : " + detailBook.book_title + "<br>저자 : " + detailBook.book_writer + "<br><br><b>대출신청 확인</b><br>대출신청을 하시겠습니까?<br>대출신청 버튼을 누르면 배송지 입력으로 이동합니다.";
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
//            modalContent = "<b>회원정보</b><br>이름 : " + loginDto.user_name + "<br>이메일 : " + loginDto.user_email + "<br><br><b>예약정보</b><br>" + loginDto.user_name + "님은 현재<br>" + resveData[0].BOOK_TITLE + " 도서를 예약중입니다.<br>예약신청이 불가합니다.";
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
