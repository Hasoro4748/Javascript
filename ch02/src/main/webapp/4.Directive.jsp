<%@page import="sub1.Account" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>4.Directive</title>
</head>
<body>
	<h3>4.지시자</h3>
	<h4>page 지시자</h4>
	<%
		Account kb = new Account();
	%>
	<h4>include 지시자</h4>
	<%@ include file= "./inc/header.jsp" %>
	<%@ include file= "./inc/footer.jsp" %>
</body>
</html>