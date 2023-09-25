<%@page import="com.dowon.bds.dto.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="css/font.css">
<link rel="stylesheet" href="css/header.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<title>FAQ 게시판입니다.</title>
</head>
<%@ include file="header.jsp" %>
<body>
<div class="container">
	<h1>자주묻는질문</h1>
	<input style="float: right; background-color: #00fff5; color: #000;" class="btn" type="submit" onclick="location.href='./faqInsertView.do'" value="새글작성">
    <table class="table" border="1">
        <tr>
<!--             <th>번호</th> -->
<!--             <th>자주묻는 질문</th> -->
        </tr>
    
<c:forEach var="faqBoard" items="${faqList}">
   <tr data-category="${faqBoard.faq_category}">
<%--         <td>${faqBoard.faq_seq}</td> --%>
        <td>
            <button class="faq-title-button" style="color: black;"> 
                ${faqBoard.faq_title}
            </button>
            <div class="faq-content" style="display: none;">
                ${faqBoard.faq_content}
            </div>
           <c:if test="${loginDto != null && loginDto.user_seq == faqBoard.user_seq}">
            <button class="btn btn-info" onclick="location.href='./faqBoardDetail.do?faq_seq=${faqBoard.faq_seq}'">관리</button>
           </c:if>
        </td>
    </tr>
</c:forEach>
</table>
</div>


   
 <div class="faq_search_wrap text-center">
    <div class="inner">
        <form action="#">
            <div class="result_info">
                   </div>
                     <div class="category_search_wrap">
		                 <div class="input_select_wrap2">
		                     <select title="컨텐츠 카테고리" name="faq_category" id="faq_category" style="color: black;">
		                         <option value="" style="color: black;">카테고리 전체</option>
									<option value="1" style="color: black;">도서관이용일반</option>
									<option value="2" style="color: black;">비치희망자료신청</option>
									<option value="3" style="color: black;">자료검색및대출</option>
									<option value="4" style="color: black;">회원가입관련</option>
							</select>
		            <button class="btn_view" style="color: black;">검색</button>
		                 </div>
		          </div>
</form>
</div>
</div>
   


</body>
<%@ include file="footer.jsp" %>
</body>
<script>
$(document).ready(function() {
    // FAQ 제목 버튼 클릭 이벤트
    $(".faq-title-button").click(function() {
        var content = $(this).next(".faq-content");
        if (content.css("display") === "none") {
            content.slideDown();
        } else {
            content.slideUp();
        }
        
    });
     // 컨텐츠 카테고리 선택하여 해당글만 나타내기
        $("#faq_category").change(function() {
            var selectedCategory = $(this).val();
            
            // 모든 FAQ 글 숨기기
            $("tr[data-category]").hide();
            
            // 선택한 카테고리에 해당하는 FAQ 글만 보이기
            if (selectedCategory === "") {
                $("tr[data-category]").show();
            } else {
                $("tr[data-category='" + selectedCategory + "']").show();
            }
        });
    });
</script>
</html>