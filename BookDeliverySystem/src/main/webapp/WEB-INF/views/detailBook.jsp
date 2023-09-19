<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/font.css">
<link rel="stylesheet" href="css/header.css">
</head>
<%@ include file="header.jsp" %>
<body>
<table class="tg">
<thead>
  <tr>
    <th class="tg-0pky" rowspan="5"><img src="./img/bamin_1.png" width="50%"></th>
    <th class="tg-0pky">${detailBook.book_title}</th>
  </tr>
  <tr>
    <th class="tg-0pky">${detailBook.book_writer}</th>
  </tr>
  <tr>
    <th class="tg-0pky">${detailBook.book_isbn}</th>
  </tr>
  <tr>
    <th class="tg-0lax">${detailBook.book_publisher}</th>
  </tr>
  <tr>
    <th class="tg-0lax">${detailBook.book_published_date}</th>
  </tr>
 
</thead>
<tbody style="text-align: center;">
  <tr>
    <td class="tg-0lax" colspan="2">${detailBook.book_intro}</td>
  </tr>
  <tr>
    <td class="tg-0lax" colspan="2">${detailBook.book_index}</td>
  </tr>
  <tr>
    <td class="tg-0lax" colspan="2">${detailBook.book_summary}</td>
  </tr>
</tbody>
</table>


</body>
<%@ include file="footer.jsp" %>
</html>