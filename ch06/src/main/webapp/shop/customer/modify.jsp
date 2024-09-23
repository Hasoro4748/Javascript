<%@page import="shop.CustomerVO"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	//데이터베이스 처리
	String custid = request.getParameter("custid");
	
	CustomerVO vo = null;
try{
//1단계 - JDBC 드라이버 로드
Context initCtx = new InitialContext();
Context ctx = (Context) initCtx.lookup("java:comp/env"); // JNDI 기본 환경 이름(고정값)
//2단계 - 데이터베이스 접속
DataSource ds = (DataSource) ctx.lookup("jdbc/shop"); // <-- 톰캣 설정 파일(Servers > context.xml)에 설정한 커넥션풀 이름   
Connection conn = ds.getConnection();
//3단계 - SQL 실행 객체 생성
String sql = "select * from `customer` where `custid` = ?";
PreparedStatement psmt = conn.prepareStatement(sql);
psmt.setString(1, custid);
//4단계 - SQL 실행

ResultSet rs = psmt.executeQuery();
//5단계 - 결과처리
if(rs.next()){
	vo = new CustomerVO();
	vo.setCustId(rs.getString(1));
	vo.setName(rs.getString(2));
	vo.setHp(rs.getString(3));
	vo.setAddr(rs.getString(4));
	vo.setRdate(rs.getString(5));
}
	

//6단계 - 데이터베이스 종료
rs.close();
psmt.close();
conn.close();
}catch(Exception e){
e.printStackTrace();
}	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>register</title>
</head>
<body>
	<h3>Customer 목록</h3>
	<a href="/ch06/2.DBCPTest.jsp">처음으로</a>
	<a href="/ch06/shop/customer/list.jsp">목록</a>
	
	<form action="/ch06/shop/customer/modifyProc.jsp" method="post">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name = "custid" value = "<%= vo.getCustId()%>" readonly/> </td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name = "name" value = "<%= vo.getName()%>"/> </td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><input type="text" name = "hp" value = "<%= vo.getHp()%>"/> </td>
			</tr>
			<tr>
				<td>휴대폰</td>
				<td><input type="text" name = "addr" value = "<%= vo.getAddr()%>"/> </td>
			</tr>
			<tr>
				<td>나이</td>
				<td><input type="date" name = "rdate" value = "<%= vo.getRdate()%>"/> </td>
			</tr>
			<tr>
				<td colspan="2" align = "right">
					<input type="submit" value = "등록하기"/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>