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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
var book_img;

window.onload = function(){
//     구글차트 
    google.charts.load('current', {'packages':['corechart']}); 
    google.charts.setOnLoadCallback(drawGenderChart);
    
    function drawGenderChart() {
 //        Ajax요청하기
        $.get('/BookDeliverySystem/genderChart.do', function(data) {
            
            var genderData = new google.visualization.DataTable();
            genderData.addColumn('string', 'Gender');
            genderData.addColumn('number', 'Count');
            
  //           1위책 남,녀
            genderData.addRow([data[0].user_gender,parseInt(data[0].percent)]);
            genderData.addRow([data[1].user_gender,parseInt(data[1].percent)]);

//             차트 옵션 설정
            var options = {
			    title: '성별 통계',
			    chartArea: {
			        width: '80%', 
			        height: '80%'
			    },
			    width: 400, 
			    height: 300,
			    legend: 'right',
			    titlePosition: 'out',
			    is3D:true,
			    colors: ['#74b9ff', '#81ecec', '#a29bfe', '#dfe6e9', '#00cec9'],
	          	fontSize: 15
			};

//             차트 그리기
            var chart = new google.visualization.PieChart(document.getElementById('genderChart'));
            chart.draw(genderData, options);
            
            var bookTitle = data[0].book_title;
            $('#bookTitle').text('['+ bookTitle + ']');
        
            book_img = data[0].book_img;
        });
    };
};
            
</script>
 <script type="text/javascript">
//     구글차트 
    google.charts.load('current', {'packages':['corechart']}); 
    google.charts.setOnLoadCallback(drawAgeChart);
    
    function drawAgeChart() {
//         Ajax 요청하기
        $.get('/BookDeliverySystem/ageChart.do', function(data) {
            var ageData = new google.visualization.DataTable();
            ageData.addColumn('string', 'Age');
            ageData.addColumn('number', 'Percent(%)');
            ageData.addColumn({type: 'string', role: 'style'});

            ageData.addRow([data[0].age_group,parseInt(data[0].percent),'#00b894']);
            ageData.addRow([data[1].age_group,parseInt(data[1].percent),'#00d2d3']);
            ageData.addRow([data[2].age_group,parseInt(data[2].percent),'#74b9ff']);
            ageData.addRow([data[3].age_group,parseInt(data[3].percent),'#55efc4']);
            ageData.addRow([data[4].age_group,parseInt(data[4].percent),'#81ecec']);
            
 //            차트 옵션 설정
           var options = {
			    title:'연령별 통계',
			    chartArea: {
			        width: '80%', 
			        height: '80%'
			    },
			    width: 400, 
			    height: 300,
			    titlePosition: 'out',
			    legend: { position: "none" },
			    colors: ['#00b894', '#00d2d3', '#74b9ff', '#55efc4', '#81ecec'],
	          	fontSize: 15,
	          	animation: {
	                 duration: 3000,
	                 easing: 'in',
	                startup: true
	          	}
				};

            var chart = new google.visualization.ColumnChart(document.getElementById('ageChart'));
            chart.draw(ageData, options);
        });
    };
</script>
</head>
<body>

<!-- <a href="./imgSelect.do">책이미지좀불러와라</a> -->
<!-- <a href="./genderList.do">성별통계불러와라</a> -->
<!-- <a href="./ageList.do">연령별통계불러와라</a> -->
<div class="container-md" style="background-image: url('./img/star.png'); width:500px; height:500px; background-size: cover; margin-top: 500px; margin-left: 20px;">
		<h2>실시간 베스트셀러!</h2>
		<h4>누구에게 인기가 많을까?</h4>
		<!-- Trigger the modal with a button -->
		<button id="showModal" type="button" class="btn btn-info btn-lg" data-toggle="modal"
			data-target="#myModal">
			지금보러가자!
		</button>

		<!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog modal-md">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">실시간 베스트셀러</h4>
					</div>
					<div class="modal-body">
						<h1 id="bookTitle" style="text-align: center;" onmouseover="showBookInfo()" onmouseout="hideBookInfo()"></h1>
						<div id="bookInfo">
							
						</div>
						<!-- 여기에 차트 뿌리기 -->
						<table>
							<tr>
								<td>
									<div id="genderChart" style="text-align: center; margin-left: 150px; margin-top: 25px"></div>
								</td>
								</tr>
								<tr>
								<td>
									<div id="ageChart" style="text-align: center; margin-left: 95px;"></div>
								</td>
							</tr>
						</table>
		
					</div>
					<button type="submit" class="btn btn-primary btn-lg"
						style="width: 500px; margin: 20px 50px;" onclick="location.href='./bookDetail.do?book_seq=${genderData.book_seq}'">상세보기</button>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	function showBookInfo(){
		$('#bookInfo').html('<img src="'+book_img+'" alt="bookImgLoading....">');
		$('#bookInfo').fadeIn();
// 		console.log("커서가 올라왔다");
	}
	function hideBookInfo(){
		$('#bookInfo').html('<img src="'+book_img+'" alt="bookImgLoading....">');
		$('#bookInfo').fadeOut();
// 		console.log("커서가 내려갔다");
	}
</script>
</html>
