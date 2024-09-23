<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String custid = request.getParameter("custid");

	try{
		Context initCtx = new InitialContext();
		Context ctx = (Context) initCtx.lookup("java:comp/env"); // JNDI 기본 환경 이름(고정값)
		
		// 2단계 - 커넥션 풀에서 커넥션 객체 가져오기
		DataSource ds = (DataSource) ctx.lookup("jdbc/shop"); // <-- 톰캣 설정 파일(Servers > context.xml)에 설정한 커넥션풀 이름   
		Connection conn = ds.getConnection();
		
		String sql = "delete from `customer` where `custid` = ?";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, custid);
		
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	response.sendRedirect("/ch06/shop/customer/list.jsp");
%>