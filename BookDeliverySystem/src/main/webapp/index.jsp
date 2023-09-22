<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="css/font.css">
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/SerachBar.css">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript" src="js/statistics.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css">
<script type="text/javascript" src="./js/javascript41.js" defer="defer"></script>
<link rel='stylesheet' href='./css/slick.css'/>
<style type="text/css">
svg > g > g:last-child { pointer-events: none }
</style>
</head>
<%@ include file="/WEB-INF/views/header.jsp" %>
<body>
<div id="slider-div">
    <div><img src="./img/9.png" width="100%"></div>
    <div><img src="./img/7.png" width="100%"></div>
    <div><img src="./img/header01.png" width="100%"></div>
    <div><img src="./img/header02.png" width="100%"></div>
    <div><img src="./img/header03.png" width="100%"></div>
    <div><img src="./img/header04.png" width="100%"></div>
</div>

<!-- 검색창 -->
<!-- 검색창 -->
<!-- 검색창 -->
<div class="search-container" style="width: 40%; margin: 0 auto; text-align: center;">
  <input type="text" placeholder="도서명 또는 저자를 입력하세요." style="width: 70%;"> <!-- Adjust the width as needed -->
  <button type="submit" style="width: 30%;"><i class="fa fa-search"></i></button> <!-- Adjust the width as needed -->
</div>

<!-- <a href="./imgSelect.do">책이미지좀불러와라</a> -->
<!-- <a href="./genderList.do">성별통계불러와라</a> -->
<!-- <a href="./ageList.do">연령별통계불러와라</a> -->
<div id="content">
<div class="rectangle" style="background-image: url('./img/star.png'); width:350px; height:300px; background-size: cover; margin-top: 10px; margin-left: 20px;">
		<h2 style="color: white;">실시간 <span style="color: yellow;">베스트셀러!</span></h2>
		<h4 style="color: white;">누구에게 인기가 많을까?</h4>
		<button id="showModal" type="button" class="btn btn-lg" style="background-color: #00FFF5; color: #222831"  data-toggle="modal"
			data-target="#myModal">
			지금보러가자!
		</button>
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog modal-md">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title" style="color: #222832;">실시간 베스트셀러</h4>
					</div>
					<div class="modal-body">
						<h1 id="bookTitle" style="text-align: center; color: #222832;" onmouseover="showBookInfo()" onmouseout="hideBookInfo()"></h1>
						<div id="bookInfo" style="position: fixed; left: -200px;">
						</div>
						<!-- 여기에 차트 뿌리기 -->
						<table>
							<tr>
								<td>
									<div id="genderChart" style="text-align: center; margin-left: 90px; margin-top: 25px"></div>
								</td>
								</tr>
								<tr>
								<td>
									<div id="ageChart" style="text-align: center; margin-left: 95px;"></div>
								</td>
							</tr>
						</table>
		
					</div>
					<button id="bookDetail" class="btn btn-primary btn-lg"
						style="width: 500px; margin: 20px 50px;" onclick="location.href='./getDetailBook.do?book_seq='+book_seq">상세보기</button>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
</body>
<%@ include file="/WEB-INF/views/footer.jsp" %>
<script type="text/javascript">
$('#showModal').on('click', function () {
    drawAgeChart();
    drawGenderChart();
});
</script>
<script type="text/javascript"> 
	function showBookInfo(){
		$('#bookInfo').html('<img src="'+book_img+'" alt="bookImgLoading....">');
		$('#bookInfo').fadeIn();
		console.log(book_img);
		console.log(book_seq);
 		console.log("커서가 올라왔다");
	}
	function hideBookInfo(){
		$('#bookInfo').html('<img src="'+book_img+'" alt="bookImgLoading....">');
		$('#bookInfo').fadeOut();
 		console.log("커서가 내려갔다");
	}
</script>
</html>
