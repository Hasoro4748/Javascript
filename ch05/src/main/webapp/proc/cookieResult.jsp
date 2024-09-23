<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>쿠키 확인</h3>
	<%
		Cookie[]  cookies =request.getCookies();
		for(Cookie ck : cookies){
	%>
	<p>
		쿠키명 : <%= ck.getName()%><br>
		쿠키값 : <%= ck.getValue()%><br>
	</p>
	<%
		}
	%>
</body>
</html>