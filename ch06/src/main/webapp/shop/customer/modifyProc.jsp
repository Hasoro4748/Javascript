<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//데이터 수신
	String custid = request.getParameter("custid");	
	String name= request.getParameter("name");
	String hp = request.getParameter("hp");
	String addr = request.getParameter("addr");
	String rdate = request.getParameter("rdate");
	
	// 데이터 처리
	
	
	try{
		//드라이버 로드
		Context initCtx = new InitialContext();
		Context ctx = (Context) initCtx.lookup("java:comp/env"); // JNDI 기본 환경 이름(고정값)
		
		//1단계 - 데이터베이스 접속
		DataSource ds = (DataSource) ctx.lookup("jdbc/shop"); // <-- 톰캣 설정 파일(Servers > context.xml)에 설정한 커넥션풀 이름   
		Connection conn = ds.getConnection();
		//2단계 - SQL 실행 객체 생성
		String sql = "update `customer` set `name`=?, `hp` = ?, `addr` = ?, `rdate` = ? WHERE `custid`=?";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(5, custid);
		psmt.setString(1, name);
		psmt.setString(2, hp);
		psmt.setString(3, addr);
		psmt.setString(4, rdate);
		
		//3단계 - SQL 실행
		psmt.executeUpdate();
		
		
		//4단계 - 결과처리(SELECT인 경우)
		//5단계 - 데이터베이스 종료
		psmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	//목록이동
	response.sendRedirect("/ch06/shop/customer/list.jsp");
%>