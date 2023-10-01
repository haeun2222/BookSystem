<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Alert</title>
</head>
<body>
<script>
    var errorMessage = "<c:out value='${errorMessage}'/>";
    var url = "<c:out value='${url}'/>";
    alert(errorMessage);
    window.location.href = url;
</script>
</body>
</html>