<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>파일 다운로드</h3>
	<%
		//해당 페이지를 파일 다운로드
		response.setHeader("Content-Type","application/octet-stream");
	%>
</body>
</html>