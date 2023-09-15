<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

        	 // 사용자가 입력한 주소를 가져옵니다. (입력 필드의 id가 "addressInput"이라고 가정합니다.)
//            var userAddress = document.getElementById("address").value;
            
            // 사용자의 seq를 가져옵니다. (사용자 ID를 저장하는 변수 "userid"가 있다고 가정합니다.)
            //var userSeq = "사용자_아이디_여기에_입력"; // 실제 사용자 아이디로 대체하세요
        function requestPay() {
        	
            IMP.request_pay(
                {
                    pg: "kcp", //결제사 선택 포트원 사이트 참고
                    pay_method: "card", // 카드결제 선택
                    merchant_uid: merchant_uid,
                    name: "배송비 결제",
                    amount: payPayment,
                    buyer_email: "deliverytest@testemail.com",
                    buyer_name: "김지인",
                    buyer_tel: "010-6703-3555",
                    buyer_addr: "서울시 금천구 가산동",// 입력된 배송주소
                    buyer_postcode: "123-456",
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
                    }
                }
            );
        }
</script>
  
</head>
<body>
<div class="flex-container">
  <div style="width: 600px;">
 	 <img src="./img/img-bike.png" width="70%">
  </div>
  <div style="text-align: center;padding-top: 150px;">
	<h1 style="padding-top: 100px;">계발의 민족<br>배송신청 결제페이지</h1>	 
	<button class="button" onclick="requestPay()">결제하기</button>
  </div>
</div>

</body>
</html>