<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>registBookForm</title>
    <style>
        /* 전체 페이지 스타일 */
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }

        /* 폼 컨테이너 스타일 */
        .form-container {
            max-width: 800px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        /* 도서 이미지 스타일 */
        .book-image {
            text-align: center;
        }

        .book-image img {
            max-width: 100%;
            height: auto;
        }

        /* 도서 정보 스타일 */
        .book-info {
            font-weight: bold;
            margin-top: 10px;
        }

        /* 입력 필드 스타일 */
        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        /* 도서 내용 입력란 스타일 */
        textarea {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        /* 버튼 스타일 */
        .btn-container {
            text-align: center;
            margin-top: 20px;
        }

        input[type="submit"] {
            padding: 10px 20px;
            font-size: 18px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <form action="./registbutton.do" method="post">

			<div class="book-image">
				<input type="hidden" name="book_img" value="${registBook.book_img}">
				<img src="${registBook.book_img}" alt="도서 이미지">
			</div>
			<!-- 도서 정보 입력란 -->
            <div class="book-info">도서 제목:</div>
            <input type="text" name="book_title" value="${registBook.book_title}">
            
            <div class="book-info">저자:</div>
            <input type="text" name="book_writer" value="${registBook.book_writer}">
            
            <div class="book-info">도서 ISBN:</div>
            <input type="text" name="book_isbn" value="${registBook.book_isbn}">
            
            <div class="book-info">출판사:</div>
            <input type="text" name="book_publisher" value="${registBook.book_publisher}">
            
            <div class="book-info">출판일:</div>
            <input type="text" name="book_published_dateStr" 
            value='<fmt:formatDate pattern="yyyy-MM-dd" value="${registBook.book_published_date}" />'>
            
            <div class="book-info">도서 내용:</div>
            <textarea name="book_intro" rows="5">${registBook.book_intro}</textarea>
            
            <!-- 도서 인덱스 및 도서 요약 입력란 -->
            <div class="book-info">도서 인덱스:</div>
            <input type="text" name="book_index" placeholder="book_index 값을 넣어주세요.">
            
            <div class="book-info">도서 요약:</div>
            <input type="text" name="book_summary" placeholder="book_summary 내용을 넣어주세요.">
            
            <!-- 폼 버튼 -->
            <div class="btn-container">
                <input type="submit" value="도서 등록하기">
            </div>
        </form>
    </div>
</body>
</html>
