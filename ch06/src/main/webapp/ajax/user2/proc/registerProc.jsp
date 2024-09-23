<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="ch06.User2VO"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.io.BufferedReader"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// JSON 문자열 스트림 처리
	BufferedReader reader = request.getReader();
	StringBuilder requestBody = new StringBuilder();
	
	String line;
	while((line = reader.readLine()) != null){
		requestBody.append(line);
	}
	reader.close();
	
	//JSON 파싱
	Gson gson = new Gson();
	User2VO user2 = gson.fromJson(requestBody.toString(), User2VO.class);
	
	int rowCount  = 0;
	
	try{
		// Stage 1
		Context ctx = (Context) new InitialContext().lookup("java:comp/env");
		
		// Stage 2
		DataSource ds = (DataSource) ctx.lookup("jdbc/studydb");
		Connection conn = ds.getConnection();
		
		// Stage 3
		String sql = "insert into `user2` value (?, ?, ?, ?)";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, user2.getUid());
		psmt.setString(2, user2.getName());
		psmt.setString(3, user2.getBirth());
		psmt.setString(4, user2.getAddr());
		
		// Stage 4
		rowCount = psmt.executeUpdate();
		// Stage 5
		psmt.close();
		conn.close();
	}catch(Exception e){
		e.printStackTrace();
	}
	
	//JSON출력
	JsonObject json = new JsonObject();
	json.addProperty("result", rowCount);
	
	out.print(json.toString());
%>