/* 변수 선언 */
var joinButton = document.getElementById('regist'); // 가입하기 버튼을 ID로 가져옴
var yy = document.getElementById('yy'); // 연도 입력란
var mm = document.getElementById('mm'); // 월 선택란
var dd = document.getElementById('dd'); // 일 입력란

/* 가입하기 버튼 클릭 이벤트 핸들러 연결 */
joinButton.addEventListener("click", function () {
    // 입력된 연도, 월, 일을 가져와서 yyyymmdd 형식의 문자열로 조합
    var year = yy.value;
    var month = mm.value;
    var day = dd.value;

    // 월과 일이 한 자리 숫자인 경우 앞에 0을 추가
    if (month.length === 1) {
        month = '0' + month;
    }
    if (day.length === 1) {
        day = '0' + day;
    }

    // yyyymmdd 형식으로 조합
    var birthdate = year + month + day;

    // 조합된 생년월일을 hidden input에 설정
    document.getElementsByName('user_birth')[0].value = birthdate;

    // 폼 제출
    document.frm.submit();
});

//전화번호 유효성 검사 후 올바르면 coolsms에 문자 발송 요청
function sendSMS(){ 
   console.log()
        var user_phone = document.getElementById("user_phone").value;
        // 정규식을 사용하여 패턴 체크
        var pattern = /^01[016789]\d{7,8}$/;

      if(user_phone ==""){
         writenum();
      }else{
         
        if(pattern.test(user_phone)) {
            isc = true;
        } else {
            isc = false;
        }

        if(isc==true){
         confirmSMS(user_phone);
      }else{
         failalert();
         document.getElementById("user_phone").value="";
      }
   }
}

function confirmSMS(user_phone){
   $.ajax({
         url: "./sendPhoneSMS.do",
         data : {user_phone:user_phone},
         method : "POST",
         success: function (response) {
           if(response === "success"){
			 alert("SMS가 성공적으로 전송되었습니다.");
		}else{
			alert("SMS 전송에 실패했습니다.(ajax success)");
		}
			
        },
        error: function (error) {
            alert("SMS 전송에 실패했습니다.");
        }
    });
}
function failalert(){
   alert("잘못입력했어요")
}

function writenum(){
   alert("값을 입력하세요")
}

var checkStatus = false;

function handleResponse(response) {
    if (response === "success") {
        // 인증이 성공한 경우
        alert("인증이 성공적으로 완료되었습니다.");
        checkStatus = true;
    } else if (response === "error") {
        // 인증이 실패한 경우
        alert("인증이 실패하였습니다. 다시 시도해주세요.");
    } else {
        // 그 외의 경우 (예를 들어, 서버에서 다른 응답을 보낸 경우)
        alert("서버 오류 또는 잘못된 응답입니다.");
    }
}

function verifyCode() {
    var userInputCode = document.getElementById("userInputCode").value;
    
    // AJAX를 사용하여 userInputCode를 서버로 전송하고 결과를 받음
    $.ajax({
        url: "./checkSMS.do",
        method: "POST",
        data: { userInputCode: userInputCode },
        success: function (response) {
			console.log("verifyCode의 success MSG");
         	handleResponse(response);
        },
        error: function () {
			console.log("verifyCode의 error MSG");
            alert("인증번호 확인 중 오류가 발생했습니다.");
        }
    });
}

document.getElementById('regist').addEventListener('click', function(){
	if(checkStatus){
		console.log("checkStatus true");
		alert("가입 완료 되었어요.");
		
	}else{
		console.log("checkStatus false");
		alert("휴대폰 인증부터 진행해 주세요.");
	}
	
	
})
