<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="css/font.css">
<link rel="stylesheet" href="css/header.css">
  <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>자유게시판 게시글 상세페이지</title>
</head>
<body>
	<div class="container">
		<h1>게시글상세</h1>
		<div>
			<div class="form-control">아이디:${dto.user_name}</div>
			<div class="form-control">제목:${dto.free_title}</div>
			<div class="form-control">내용:${dto.free_content}</div>
			<div class="form-control">작성일:${dto.free_regdate}</div>
		</div>
		<div>
		<p>${loginDto}</p>
		<p>${dto}</p>
			<c:if test="${loginDto.user_name eq dto.user_name}">
    		<input class="btn btn-success" type="button" value="삭제" onclick="boardDel()">
			</c:if>
			<input class="btn btn-success" type="button" value="수정" >
			<input class="btn btn-success" type="button" value="답글" >
			<input class="btn btn-success" type="button" value="뒤로가기" onclick="history.back(-1);">
		</div>
		</div>
</body>
<script type="text/javascript">
	function boardDel(){
		 var result = confirm("선택하신 게시글을 정말 삭제하시겠습니까?");

         if (result === true) {
             alert("게시글이 삭제되었습니다.");
             window.location.href="./freeBoardDel.do?free_bseq=${dto.free_bseq}";
         } else {
             alert("게시글 삭제가 취소되었습니다.");
         }
	}
</script>
</html>