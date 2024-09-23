<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
    String param = request.getQueryString();
	String uid = request.getParameter("uid");
	String psw = request.getParameter("psw");
	String name = request.getParameter("name");
	String birth = request.getParameter("birth");
	String gender = request.getParameter("gender");
	String[] hobby = request.getParameterValues("hobby");
	String addr = request.getParameter("addr");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>정보</h3>
	<p>
		아이디 : <%= uid %><br>
		비밀번호 : <%= psw %><br>
		이름 : <%= name %><br>
		생년월일 : <%= birth %><br>
		성별 : <%= gender.equals("M") ? "남자" : "여자" %><br>
		취미 : <% for(String tmp : hobby){ out.print(tmp + ", ");} %><br>
		주소 : <%= addr %><br>
	</p>
	<a href="../1.request.jsp">뒤로가기 </a>
</body>
</html>