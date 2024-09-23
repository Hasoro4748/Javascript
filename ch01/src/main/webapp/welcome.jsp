<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>title</title>
</head>
<body>
	
 <%
        ServletContext context = pageContext.getServletContext();
        String servletVersion = context.getMajorVersion() + "." + context.getMinorVersion();
        out.println("Servlet API Version: " + servletVersion);
    %>
</body>
</html>