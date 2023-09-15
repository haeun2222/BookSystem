<%@page import="com.dowon.bds.dto.SocialDto"%>
<%@page import="com.dowon.bds.dto.URLDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/font.css">
<title>로그인페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>
<div class="container">
<h2>로그인하기 2023.09.12</h2>
	
	<%
		URLDto uDto = new URLDto();
		SocialDto dto = new SocialDto();
		SecureRandom random = new SecureRandom();
		String state = new BigInteger(130, random).toString();
	%>
  
  <!-- 일반회원 로그인 -->
  <form action="./login.do" method="post">
    <div class="form-group">
      <label for="usr">아이디(이메일)</label>
      <input type="text" class="form-control" id="usr" name="user_email">
    </div>
    <div class="form-group">
      <label for="pwd">비밀번호</label>
      <input type="password" class="form-control" id="pwd" name="user_password">
    </div>
    <input type="submit" class="btn btn-primary" value="로그인"><br>
  </form>
  
  <div>
  <button type="button" onclick="location.href='./nomalRegistForm.do'">일반 회원 가입 하기</button>
  </div>
  
  <div>
  <!-- 네이버 아이디로 로그인  -->
  <a href="<%=uDto.getNaverUrl()+"&client_id="+dto.getNaverClientID()+"&redirect_uri="+uDto.getNaverRedirect()+"&state="+state%>">
  <img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/>
  </a>
  </div>
</div>
</body>
</html>