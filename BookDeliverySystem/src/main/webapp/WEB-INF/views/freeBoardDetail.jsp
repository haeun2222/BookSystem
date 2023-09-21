<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="css/font.css">
<link rel="stylesheet" href="css/header.css">
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>자유게시판 게시글 상세페이지</title>
<%@ include file="header.jsp" %>
</head>
<body>
	<div class="container">
		<h1>제목: ${dto.free_title}<input style="float: right;" class="btn btn-success" type="button" value="이전" onclick="history.back(-1);">
			<c:if test="${loginDto.user_name eq dto.user_name or loginDto.user_auth eq 'A'}">
    		<input style="float: right;" class="btn btn-danger" type="button" value="삭제" onclick="boardDel()">
			<input style="float: right;" class="btn btn-info" type="button" value="수정" onclick="location.href='./updateBoard.do?free_bseq=${dto.free_bseq}'">
			
			</c:if>
		</h1>
		<div>
			작성자<div class="form-control" style="font-size: 20px;">${dto.user_name}</div>
			내용<div class="form-control" style="height: 100px; font-size: 20px;">${dto.free_content}</div>
			작성일<div class="form-control" style="font-size: 20px;"><fmt:formatDate value="${dto.free_regdate}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></div>
		</div><br>
		<div>
<%-- 		<p>${loginDto}</p> --%>
<%-- 		<p>${dto}</p> --%>
<%-- 		<p>${CommentAll}</p> --%>
			
			</div>
			<hr>
				<h1 style="margin-top: 10px;">-답글목록</h1>
<%-- 				<button class="btn btn-warning" id="toggleComment" onclick="location.href='./freeBoardDetail.do?free_bseq=${dto.free_bseq}'">답글보기</button> --%>
			<table class="table" id="commentTable">
				<c:forEach var="comment" items="${CommentAll}">
				<tr>
					<th>${comment.user_name}: ${comment.comment_content}
					<span style="float: right; color: red;">작성일:${comment.comment_regdate}</span>
					</th>
				<c:if test="${loginDto.user_name == comment.user_name}">
					<td><button class="btn btn-danger" onclick="commentDel(${comment.comment_seq})">삭제</button></td>
				</c:if>
				</tr>
				</c:forEach>
			</table>
			
			<form action="./CommentInsert.do" method="post">
			    <input type="hidden" name="free_bseq" value="${dto.free_bseq}">
			    <input type="hidden" name="user_seq" value="${loginDto.user_seq}">
			    <div class="form-group">
			        <label for="comment_content">답글:</label>
			        <textarea placeholder="로그인 후 이용가능합니다." class="form-control" id="comment_content" name="comment_content"></textarea>
			    </div>
			    <c:if test="${loginDto.user_name != null}">
			    <input class="btn btn-success" type="submit" value="답글작성">
			    </c:if>
			</form>
		</div>
</body>



<%@ include file="footer.jsp" %>
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
<script type="text/javascript">
	function commentDel(comment_seq){
		var result = confirm("선택하신 답글을 정말 삭제하시겠습니까?");
		
		if(result === true){
			alert("답글이 삭제되었습니다.");
			window.location.href="./CommentDel.do?comment_seq="+comment_seq;
		}else{
			alert("답글 삭제가 취소되었습니다.");
		}
	}
</script>
</html>