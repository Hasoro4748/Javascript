package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBHelper {
	protected Connection conn = null;
	protected PreparedStatement psmt = null;
	protected Statement stmt = null;
	protected ResultSet rs = null;
	
	public Connection getConnection() throws NamingException, SQLException {
		// 1단계 - JNDI 서비스 객체 생성
		Context initCtx = new InitialContext();
		Context ctx = (Context) initCtx.lookup("java:comp/env"); // JNDI 기본 환경 이름(고정값)
				
		// 2단계 - 커넥션 풀에서 커넥션 객체 가져오기
		DataSource ds = (DataSource) ctx.lookup("jdbc/shop"); // <-- 톰캣 설정 파일(Servers > context.xml)에 설정한 커넥션풀 이름   
		return ds.getConnection();
	}
	
	public void closeAll() throws SQLException {
		if(rs!=null) {
			rs.close();
		}
		if(stmt!= null) {
			stmt.close();
		}
		if(psmt!=null) {
			psmt.close();
		}
		if(conn!=null) {
			conn.close();
		}
	}

}
