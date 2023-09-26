<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 수정 페이지</title>
</head>
<body>

<div class="form-container">
        <form id="updateBookForm" action="./registbutton.do" method="post">

			<div class="book-image">
				<input type="hidden" name="book_img" value="${updateBook.book_img}">
				<img src="${updateBook.book_img}" alt="도서 이미지">
			</div>
			<!-- 도서 정보 입력란 -->
            <div class="book-info">도서 제목:</div>
            <input type="text" name="book_title" value="${updateBook.book_title}">
            
            <div class="book-info">저자:</div>
            <input type="text" name="book_writer" value="${updateBook.book_writer}">
            
            <div class="book-info">도서 ISBN:</div>
            <input type="text" name="book_isbn" value="${updateBook.book_isbn}">
            
            <div class="book-info">출판사:</div>
            <input type="text" name="book_publisher" value="${updateBook.book_publisher}">
            
            <div class="book-info">출판일:</div>
            <input type="text" name="book_published_dateStr" 
            value='<fmt:formatDate pattern="yyyy-MM-dd" value="${updateBook.book_published_date}" />'>
            
            <div class="book-info">도서 내용:</div>
            <textarea name="book_intro" rows="5">${updateBook.book_intro}</textarea>
            
            <!-- 도서 인덱스 및 도서 요약 입력란 -->
            <div class="book-info">도서 인덱스:</div>
            <input type="text" name="book_index" placeholder="book_index 값을 넣어주세요.">
            
            <div class="book-info">도서 요약:</div>
            <input type="text" name="book_summary" placeholder="book_summary 내용을 넣어주세요.">
            
            <!--등록 폼 버튼 -->
            <div class="btn-container">
                <input type="submit" value="도서 수정하기">
            </div>
        </form>
	</div>
	
</body>
</html>