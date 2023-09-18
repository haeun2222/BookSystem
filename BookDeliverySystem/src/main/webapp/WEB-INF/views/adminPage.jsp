<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link rel="stylesheet" href="css/adminPage.css"/>
<script type="text/javascript"src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script src="js/adminUser.js"></script>
<script src="js/adminBook.js"></script>

</head>
<body>

<h1>비대면 도서 대출 시스템 [관리자페이지]</h1>

<body>
		<button onclick="getAllUsers()">회원관리</button>
		<button onclick="getAllBooks()">도서관리</button>
		<button onclick="getAllRentLists()">대출관리</button>
		
		<div id="userInfoTable"></div>
		<div id="bookinfoTable"></div>
		
<!-- 	    <input type="text" id="bookName" placeholder="도서명 입력"> -->
<!--     <button id="search">검색</button> -->

<!--     <table class="book-table" style="width: 1200px"> -->
<!--         <thead> -->
<!--             <tr> -->
<!--                 <th>도서이미지</th> -->
<!--                 <th>도서제목</th> -->
<!--                 <th>도서내용</th> -->
<!--                 <th>저자</th> -->
<!--                 <th>출판사</th> -->
<!--                 <th>도서등록하기</th> -->
<!--             </tr> -->
<!--         </thead> -->
<!--         <tbody id="tableBody"> -->
  
<!--         </tbody> -->
<!--      </table> --> 
</body>


</html>