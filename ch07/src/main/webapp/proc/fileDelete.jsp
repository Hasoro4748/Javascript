<%@page import="sub1.FileVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
//파일번호 수신
	String no = request.getParameter("no");
	FileVO vo = null;
//1단계
	try{
	Context ctx = (Context) new InitialContext().lookup("java:comp/env");
	DataSource ds = (DataSource) ctx.lookup("jdbc/studydb");
	
	//2단계
	Connection conn = ds.getConnection();
	
	//3단계
	Statement stmt = conn.createStatement();
	
	//4단계
	ResultSet rs =  stmt.executeQuery ("select * from `fileTest` where `no` =  "+ no);
	
	if(rs.next()){
		vo = new FileVO();
		vo.setNo(rs.getInt(1));
		vo.setUid(rs.getString(2));
		vo.setName(rs.getString(3));
		vo.setOname(rs.getString(4));
		vo.setSname(rs.getString(5));
		vo.setRdate(rs.getString(6));
	}
	
	stmt.executeUpdate("delete from `fileTest` where `no` =  "+ no);
	
	stmt.close();
	conn.close();
	

	}catch(Exception e){
	e.printStackTrace();
	}

	String path = application.getRealPath("/uploads");
	File file = new File(path + File.separator + vo.getSname());
	file.delete();
	
	//리다이렉트
	response.sendRedirect("../2.fileDownloadTest.jsp");
	
	
%>