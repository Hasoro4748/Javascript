<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//데이터 수신
	String uid = request.getParameter("uid");	
	String name= request.getParameter("name");
	String birth = request.getParameter("birth");
	String addr = request.getParameter("addr");
	
	// 데이터 처리
	String host = "jdbc:mysql://127.0.0.1:3306/studydb";
	String user = "root";
	String pass = "1234";
	
	
	try{
		//드라이버 로드
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		//1단계 - 데이터베이스 접속
		Connection conn = DriverManager.getConnection(host, user,  pass);
		
		//2단계 - SQL 실행 객체 생성
		String sql = "update `user2` set `name`=?, `birth` = ?, `addr` = ? WHERE `uid`=?";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(4, uid);
		psmt.setString(1, name);
		psmt.setString(2, birth);
		psmt.setString(3, addr);
		
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
	response.sendRedirect("/ch06/user2/list.jsp");
%>