<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="css/registForm.css">
</head>
<body>
<!-- header -->

<!-- wrapper -->
<div id="wrapper">
    <form action="./socialRegist.do" id="frm" name="frm" method="post">

        <!-- content-->
        <div id="content">
            <!-- ID -->
            <div>
                <h3 class="join_title">
                    <label for="id">아이디(이메일)</label>
                </h3>
                <span class="box int_id">
                    <input type="text" id="user_email" name="user_email" class="int" maxlength="20" value="${socialInfo.user_email}"
                        readonly="readonly">
                    <span class="step_url">ex) dowon@naver.com</span>
                </span>
                <span class="error_next_box"></span>
                <span class="successmsg"></span>
            </div>

            <!-- PW1 -->
            <div>
                <h3 class="join_title"><label for="pswd1">비밀번호</label></h3>
                <span class="box int_pass">
                    <input type="password" id="pswd1" name="user_password" class="int" maxlength="20">
                    <span id="alertTxt">사용불가</span>
                </span>
                <span class="error_next_box"></span>
                <span class="successmsg"></span>
            </div>

            <!-- PW2 -->
            <div>
                <h3 class="join_title"><label for="pswd2">비밀번호 재확인</label></h3>
                <span class="box int_pass_check">
                    <input type="password" id="pswd2" class="int" maxlength="20">
                </span>
                <span class="error_next_box"></span>
            </div>

            <!-- NAME -->
            <div>
                <h3 class="join_title"><label for="name">이름</label></h3>
                <span class="box int_name">
                    <input type="text" id="user_name" name="user_name" class="int" maxlength="20"
                        value="${socialInfo.user_name}" readonly="readonly">
                </span>
                <span class="error_next_box"></span>
            </div>

            <!-- BIRTH -->
            <div>
                <h3 class="join_title">
                    <label for="yy">생년월일</label></h3>
                <div id="bir_wrap">
                    <!-- BIRTH_YY -->
                    <div id="bir_yy">
                        <span class="box">
                            <input type="text" id="yy" class="int" maxlength="4" placeholder="년(4자)">
                        </span>
                    </div>

                    <!-- BIRTH_MM -->
                    <div id="bir_mm">
                        <span class="box">
                            <select id="mm" class="sel">
                                <option>월</option>
                                <option value="01">1</option>
                                <option value="02">2</option>
                                <option value="03">3</option>
                                <option value="04">4</option>
                                <option value="05">5</option>
                                <option value="06">6</option>
                                <option value="07">7</option>
                                <option value="08">8</option>
                                <option value="09">9</option>                                    
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                            </select>
                        </span>
                    </div>

                    <!-- BIRTH_DD -->
                    <div id="bir_dd">
                        <span class="box">
                            <input type="text" id="dd" class="int" maxlength="2" placeholder="일">
                        </span>
                    </div>

                </div>
                <span class="error_next_box"></span>  

            </div>

            <!-- GENDER -->
            <div>
                <h3 class="join_title"><label for="gender">성별</label></h3>
                <span class="box gender_code">
                    <select id="gender" class="sel" name="user_gender">
                        <option>성별</option>
                        <option value="M">남자</option>
                        <option value="F">여자</option>
                    </select>                            
                </span>
                <span class="error_next_box">필수 정보입니다.</span>
            </div>

            <!-- MOBILE -->
            <div>
                <h3 class="join_title"><label for="phoneNo">휴대전화</label></h3>
                <span class="box int_mobile">
                    <input type="tel" id="mobile" name="user_phone" class="int" maxlength="16" placeholder="전화번호 입력"
                        value="${socialInfo.user_phone}">
                </span>
                <span class="error_next_box"></span>
            </div>
            <input type="hidden" id="user_birth" name="user_birth">
            <input type="hidden" name="naver_key" value="${socialInfo.naver_key}">
            <!-- JOIN BTN-->
            <div class="btn_area">
                <input type="submit" id="joinButton" value="가입하기">
            </div>
        </div> 
        <!-- content-->
    </form>
</div> 
<script src="js/socialRegistForm.js"></script>
</body>
</html>
