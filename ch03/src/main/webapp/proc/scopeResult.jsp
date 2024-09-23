<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ScopeResult</title>
</head>
<body>
	pageContext 값 :
	<%= pageContext.getAttribute("name") %><br> request 값 :
	<%= request.getAttribute("name") %><br> session 값 :
	<%= session.getAttribute("name") %><br> application 값 :
	<%= application.getAttribute("name") %><br>

	<a href="/ch03/proc/scopeResult.jsp"></a>
</body>
</html>