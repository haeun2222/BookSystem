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
${detailBook}
<style type="text/css">
.tg  {border-collapse:collapse;border-spacing:0;}
.tg td{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
  overflow:hidden;padding:10px 5px;word-break:normal;}
.tg th{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
  font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
.tg .tg-0pky{border-color:inherit;text-align:left;vertical-align:top}
.tg .tg-0lax{text-align:left;vertical-align:top}
</style>
<table class="tg">
<thead>
  <tr>
    <th class="tg-0pky" rowspan="5">이미지영역<br></th>
    <th class="tg-0pky">도서 제목</th>
  </tr>
  <tr>
    <th class="tg-0pky">저자명</th>
  </tr>
  <tr>
    <th class="tg-0pky">isbn</th>
  </tr>
  <tr>
    <th class="tg-0lax">book_publisher</th>
  </tr>
  <tr>
    <th class="tg-0lax">book_publisher_date</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td class="tg-0lax" colspan="2">book_intro</td>
  </tr>
  <tr>
    <td class="tg-0lax" colspan="2">book_index</td>
  </tr>
  <tr>
    <td class="tg-0lax" colspan="2">book_summary</td>
  </tr>
</tbody>
</table>


</body>
<%@ include file="footer.jsp" %>
</html>