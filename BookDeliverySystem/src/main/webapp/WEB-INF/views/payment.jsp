<%@page import="com.dowon.bds.dto.AddrDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/font.css">
<link rel="stylesheet" href="css/payment.css">
<title>Payment 결제 페이지</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script>
        var merchant_uid = merchant_uid + 1; // DB 에서 마지막 시퀀스를 가지고 왔다가 처리 해야함.
        var payPayment = 5000; // 배송비 5000원 결제되도록 설정
        var IMP = window.IMP;
        IMP.init("imp84153337");
     // User_name 설정
        var User_name = "${sessionScope.loginDto.user_name}";

        // 주소 정보를 JavaScript 변수에 할당
        var buyer_email = "${sessionScope.loginDto.user_email}";
        var buyer_tel = "${sessionScope.savedAddress.delivery_phone}";
        var buyer_addr = "${sessionScope.savedAddress.address}"; // 주소 정보 수정
        var buyer_postcode = "${sessionScope.savedAddress.postcode}"; // 우편번호 정보 수정
        

        function requestPay() {
        	
            IMP.request_pay(
                {
                    pg: "kcp", //결제사 선택 포트원 사이트 참고
                    pay_method: "card", // 카드결제 선택
                    merchant_uid: merchant_uid,
                    name: "배송비 결제",
                    amount: payPayment,
                    buyer_email: buyer_email,
                    buyer_name: User_name,
                    buyer_tel: buyer_tel,
                    buyer_addr: buyer_addr,// 입력된 배송주소
                    buyer_postcode: buyer_postcode,
                },
                function (rsp) {
                    console.log(rsp);

                    if (rsp.success) {
                        var msg = '결제가 완료되었습니다.';
                        msg += '고유ID : ' + rsp.imp_uid;
                        msg += '상점 거래ID : ' + rsp.merchant_uid;
                        msg += '결제 금액 : ' + rsp.paid_amount;
                        msg += '카드 승인번호 : ' + rsp.apply_num;
                        alert(msg);

                        // fine.jsp로 이동
                        window.location.href = "./userRentList.do";

                        // 결제 성공 시에만 서버로의 AJAX 요청을 수행
                        $.ajax({
                            type: "POST",
                            url: "./payment.do",
                            data: JSON.stringify ({
                       // imp_uid를 payImd 대신 payImd로 전달
                                payImd: rsp.imp_uid,
                                payPayment: payPayment
                            }),
                            contentType: "application/json",
                            success: function(data) {
                                console.log('ajax success');
                            },
                            error: function(xhr, status, error) {
                                console.log('ajax error:', error);
                            }
                        });
                    } else {
                        var msg = '결제에 실패하였습니다.';
                        msg += '에러내용 : ' + rsp.error_msg;
                        console.log('결제실패'); // 결제 실패 시 콘솔에 메시지 출력
                        alert(msg);
                        window.location.href = "./userRentList.do";
                    }
                }
            );
        }
</script>
  
</head>
<body style=" background-image: url('./img/book.png'); background-repeat : no-repeat; background-size: 100%; background-position: bottom;">
<!-- 세션에서 loginDto 속성을 불러옴 -->
<c:set var="loginDto" value="${sessionScope.loginDto}"/>


<!-- loginDto 객체의 속성(필드) 값을 출력 -->
<%-- test: ${sessionScope.loginDto} <br> --%>
<%-- test: ${sessionScope.savedAddress.delivery_name} --%>
<!-- <div class="flex-container"> -->

  <div style="text-align: center;">
	<h1 style="padding-top: 100px;">${sessionScope.loginDto.user_name}님 배송비 결제페이지</h1>	 
	<button class="button" onclick="requestPay()">결제하기</button>
	<button class="button2" onclick="location.href='./bookDetailHaeun.do?user_seq=${loginDto.user_seq}'">취소</button>
  </div>


</body>
</html>