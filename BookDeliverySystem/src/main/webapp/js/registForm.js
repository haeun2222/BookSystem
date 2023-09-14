
/*변수 선언*/

var user_email = document.querySelector('#user_email');

var pw1 = document.querySelector('#pswd1');
var pwMsg = document.querySelector('#alertTxt');
var pwImg1 = document.querySelector('#pswd1_img1');

var pw2 = document.querySelector('#pswd2');
var pwImg2 = document.querySelector('#pswd2_img1');
var pwMsgArea = document.querySelector('.int_pass');

var userName = document.querySelector('#name');

var yy = document.querySelector('#yy');
var mm = document.querySelector('#mm');
var dd = document.querySelector('#dd');

var gender = document.querySelector('#gender');

var mobile = document.querySelector('#mobile');

var error = document.querySelectorAll('.error_next_box');


/*이벤트 핸들러 연결*/

user_email.addEventListener("focusout", checkId);
pw1.addEventListener("focusout", checkPw);
pw2.addEventListener("focusout", comparePw);
userName.addEventListener("focusout", checkName);
yy.addEventListener("focusout", isBirthCompleted);
mm.addEventListener("focusout", isBirthCompleted);
dd.addEventListener("focusout", isBirthCompleted);
gender.addEventListener("focusout", function() {
    if(gender.value === "성별") {
        error[5].style.display = "block";
    } else {
        error[5].style.display = "none";
    }
})
//email.addEventListener("focusout", isEmailCorrect);
mobile.addEventListener("focusout", checkPhoneNum);



/*콜백 함수*/


//function checkId() {
//	//이메일 유효성 검사
//    var idPattern = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
//    if(user_email.value === "") {
//        error[0].innerHTML = "이메일은 필수 정보입니다.";
//        error[0].style.display = "block";
//    } else if(!idPattern.test(user_email.value)) {
//        error[0].innerHTML = "이메일 형식에 맞게 입력해주세요.";
//        error[0].style.display = "block";
//    } else {
//        error[0].innerHTML = "사용가능한 아이디(이메일) 입니다.";
//        error[0].style.color = "#08A600";
//        error[0].style.display = "block";
//    }
//}

// jQuery를 사용하여 이메일 중복 검사 AJAX 요청
$("#user_email").blur(function () {
    var user_email = $(this).val(); // 이메일 입력란의 값 가져오기

    $.ajax({
        url: "/checkEmail.do", // 이메일 중복 확인을 처리하는 서버 엔드포인트의 URL
        type: "post", // POST 요청 사용
        async: true,
        data: { "email": user_email }, // 파라미터 이름을 "email"로 변경
        success: function (response) {
            if (response > 0) {
                // 이메일이 중복되는 경우
                $("#emailStatus").text("중복된 이메일입니다.");
            } else {
                // 이메일이 중복되지 않는 경우
                $("#emailStatus").text("사용 가능한 이메일입니다.");
            }
        },
        error: function (e) {
            console.log("잘못된 요청 처리", e);
        }
    });
});

//테스트
function checkPw() {
    var pwPattern = /[a-zA-Z0-9~!@#$%^&*()_+|<>?:{}]{8,16}/;
    if(pw1.value === "") {
        error[1].innerHTML = "필수 정보입니다.";
        error[1].style.display = "block";
    } else if(!pwPattern.test(pw1.value)) {
        error[1].innerHTML = "8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.";
        pwMsg.innerHTML = "사용불가";
        pwMsgArea.style.paddingRight = "93px";
        error[1].style.display = "block";
        
        pwMsg.style.display = "block";
        pwImg1.src = "m_icon_not_use.png";
    } else {
        error[1].style.display = "none";
        pwMsg.innerHTML = "사용가능";
        pwMsg.style.display = "block";
        pwMsg.style.color = "#03c75a";
        pwImg1.src = "m_icon_safe.png";
    }
}

function comparePw() {
    if(pw2.value === pw1.value && pw2.value != "") {
        pwImg2.src = "m_icon_check_enable.png";
        error[2].style.display = "none";
    } else if(pw2.value !== pw1.value) {
        pwImg2.src = "m_icon_check_disable.png";
        error[2].innerHTML = "비밀번호가 일치하지 않습니다.";
        error[2].style.display = "block";
    } 

    if(pw2.value === "") {
        error[2].innerHTML = "필수 정보입니다.";
        error[2].style.display = "block";
    }
}

function checkName() {
    var namePattern = /[a-zA-Z가-힣]/;
    if(userName.value === "") {
        error[3].innerHTML = "필수 정보입니다.";
        error[3].style.display = "block";
    } else if(!namePattern.test(userName.value) || userName.value.indexOf(" ") > -1) {
        error[3].innerHTML = "한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)";
        error[3].style.display = "block";
    } else {
        error[3].style.display = "none";
    }
}


function isBirthCompleted() {
    var yearPattern = /[0-9]{4}/;

    if(!yearPattern.test(yy.value)) {
        error[4].innerHTML = "태어난 년도 4자리를 정확하게 입력하세요.";
        error[4].style.display = "block";
    } else {
        isMonthSelected();
    }


    function isMonthSelected() {
        if(mm.value === "월") {
            error[4].innerHTML = "태어난 월을 선택하세요.";
        } else {
            isDateCompleted();
        }
    }

    function isDateCompleted() {
        if(dd.value === "") {
            error[4].innerHTML = "태어난 일(날짜) 2자리를 정확하게 입력하세요.";
        } else {
            isBirthRight();
        }
    }
}



function isBirthRight() {
    var datePattern = /\d{1,2}/;
    if(!datePattern.test(dd.value) || Number(dd.value)<1 || Number(dd.value)>31) {
        error[4].innerHTML = "생년월일을 다시 확인해주세요.";
    } else {
        checkAge();
    }
}

function checkAge() {
    if(Number(yy.value) < 1920) {
        error[4].innerHTML = "연도를 다시 입력해주세요";
        error[4].style.display = "block";
    } else if(Number(yy.value) > 2024) {
        error[4].innerHTML = "2024보다 낮은 값을 입력해주세요.";
        error[4].style.display = "block";
    } else {
        error[4].style.display = "none";
    }
}

/*
function isEmailCorrect() {
    var emailPattern = /[a-z0-9]{2,}@[a-z0-9-]{2,}\.[a-z0-9]{2,}/;

    if(email.value === ""){ 
        error[6].style.display = "none"; 
    } else if(!emailPattern.test(email.value)) {
        error[6].style.display = "block";
    } else {
        error[6].style.display = "none"; 
    }
}
*/

function checkPhoneNum() {
    var isPhoneNum = /([01]{2})([01679]{1})([0-9]{3,4})([0-9]{4})/;

    if(mobile.value === "") {
        error[6].innerHTML = "필수 정보입니다.";
        error[6].style.display = "block";
    } else if(!isPhoneNum.test(mobile.value)) {
        error[6].innerHTML = "형식에 맞지 않는 번호입니다.";
        error[6].style.display = "block";
    } else {
        error[6].style.display = "none";
    }
}

document.getElementById('nomalRegist').addEventListener('click', function(){
	var yy = document.getElementById('yy').value; // 년도 값 가져오기
    var mm = document.getElementById('mm').value; // 월 값 가져오기
    var dd = document.getElementById('dd').value; // 일 값 가져오기
    
	var birthdate = yy + '-' + mm + '-' + dd;

document.querySelector('input[name="user_birth"]').value = birthdate;

var f = document.forms['frm'];
f.submit();
	
});
