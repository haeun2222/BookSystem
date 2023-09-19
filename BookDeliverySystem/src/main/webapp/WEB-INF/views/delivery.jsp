<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- <section id="home" class="effect-section bg-gray-100"><div class="effect bg-primary effect-skew"></div><div class="particles-box" id="particles-box"><canvas class="particles-js-canvas-el" width="1137" height="1180" style="width: 100%; height: 100%;"></canvas></div><div class="container position-relative"><div class="row min-vh-100 align-items-center py-10"><div class="col-12 col-lg-5 col-xl-4 py-8 wow fadeInUp" data-wow-duration="0.4s" style="visibility: visible; animation-duration: 0.4s; animation-name: fadeInUp;"><h1 class="text-white mb-3">Our Analysis is your financial results</h1><p class="lead text-white-50">Mombo is a HTML5 template based on Sass and Bootstrap 5 with modern and creative multipurpose design you can use it as a startups.</p><form class="d-flex flex-row mb-2 p-1 bg-white input-group"><input type="email" class="form-control rounded-0 border-0 bg-white text-black" placeholder="you@yoursite.com"> <button class="btn btn-secondary rounded-0 flex-shrink-0" type="submit">Get Started</button></form><span class="small text-white-50">14-day FREE trial - no credit card needed</span></div><div class="col-lg-7 col-xl-8 text-center wow fadeInUp" data-wow-duration=".4s" style="visibility: visible; animation-duration: 0.4s; animation-name: fadeInUp;"><img class="lg-img-140" src="../../assets/img/home-banner/home-banner-1.svg" title="" alt=""></div></div></div></section> -->
	<!-- 택배 -->
	
        <form action="http://info.sweettracker.co.kr/tracking/5" method="post">
            <div class="form-group" style="display: none;">
              <label for="t_key">API key</label>
              <input type="text" class="form-control" id="t_key" name="t_key" value="vIvDVTiiTlMarYcHz1x5wQ">
            </div>
            <div class="form-group" style="display: none;">
              <label for="t_code">택배사 코드</label>
              <input type="text" class="form-control" name="t_code" id="t_code" value="04">
            </div>
            <div class="form-group" style="display: none;">
              <label for="t_invoice">운송장 번호</label>
              <input type="text" class="form-control" name="t_invoice" id="t_invoice" placeholder="운송장 번호" value="520209804405"><!--value에 입력된 운송장 번호가 입력되어야함. -->
            </div>
            <button type="submit" class="btn btn-default">조회하기</button>
        </form>
	<br>
	
	
<!-- <a href="https://tracker.delivery/#/kr.cupost/572764050855" target="_blank">배송조회</a> -->
<br>
<br>
<br>


</body>
</html>