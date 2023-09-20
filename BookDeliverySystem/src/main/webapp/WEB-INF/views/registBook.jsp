<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>registBookForm</title>
</head>
<style>
    /* CSS로 입력란의 크기를 조절 */
    input[type="text"] {
        width: 100%; /* 가로 폭을 100%로 설정하여 부모 요소에 맞게 조절 */
        height: 100px; /* 원하는 높이를 설정 */
    }
</style>
<body>

<form action="./registBook.do" method="post">
    <table class="tg">
        <tbody>
            <tr>
                <td rowspan="5">
                    <img src="${registBook.book_img}" alt="도서 이미지"><br>
                </td>
                <td><div class="book-info">도서 제목:</div></td>
                <td><div class="book-info">${registBook.book_title}</div></td>
            </tr>
            <tr>
                <td><div class="book-info">저자:</div></td>
                <td><div class="book-info">${registBook.book_writer}</div></td>
            </tr>
            <tr>
                <td><div class="book-info">도서 ISBN:</div></td>
                <td><div class="book-info">${registBook.book_isbn}</div></td>
            </tr>
            <tr>
                <td><div class="book-info">출판사:</div></td>
                <td><div class="book-info">${registBook.book_publisher}</div></td>
            </tr>
            <tr>
                <td><div class="book-info">출판일:</div></td>
                <td><div class="book-info">${registBook.book_published_date}</div></td>
            </tr>
            <tr>
                <td colspan="3">
                    <div class="book-info">도서 내용:</div><br>
                    <div class="book-info" name="book_intro">${registBook.book_intro}</div>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <div class="book-info">도서 인덱스:</div><br>
                    <input type="text" name="book_index" placeholder="book_index 값을 넣어주세요.">
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <div class="book-info">도서 요약:</div><br>
                    <input type="text" name="book_summary" placeholder="book_summary 내용을 넣어주세요.">
                </td>
            </tr>
        </tbody>
    </table>
    <input type="submit" value="도서 등록하기"> 
</form>

</body>
</html>