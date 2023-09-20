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
<style type="text/css">
svg > g > g:last-child { pointer-events: none }
</style>
</head>
<%@ include file="/WEB-INF/views/header.jsp" %>
<body>
<!-- 검색창 -->
<div class="search-container">
  <input type="text" placeholder="도서명 또는 저자를 입력하세요.">
  <button type="submit"><i class="fa fa-search"></i></button>
</div>
<!-- <a href="./imgSelect.do">책이미지좀불러와라</a> -->
<!-- <a href="./genderList.do">성별통계불러와라</a> -->
<!-- <a href="./ageList.do">연령별통계불러와라</a> -->
<div id="content">
<div class="rectangle" style="background-image: url('./img/star.png'); width:300px; height:300px; background-size: cover; margin-top: 400px; margin-left: 20px;">
		<h2>실시간 베스트셀러!</h2>
		<h4>누구에게 인기가 많을까?</h4>
		<button id="showModal" type="button" class="btn btn-info btn-lg" data-toggle="modal"
			data-target="#myModal">
			지금보러가자!
		</button>
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog modal-md">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">실시간 베스트셀러</h4>
					</div>
					<div class="modal-body">
						<h1 id="bookTitle" style="text-align: center;" onmouseover="showBookInfo()" onmouseout="hideBookInfo()"></h1>
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
