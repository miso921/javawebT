package conn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class GetConn {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String driver = "com.mysql.jdbc.Driver";
	private String url = "jdbc:mysql://localhost:3306/javaweb";
	private String user = "root";
	private String password = "1234";
	
	private static GetConn instance = new GetConn();
	
	// GetConn객체를 싱클톤으로 사용하고자한다. 따라서 외부에서 생성할수 없도록 한다.
	// public GetConn() {
	private GetConn() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 검색 실패~~");
		} catch (SQLException e) {
			System.out.println("Database 연동 실패~~");
		}
	}
	
	// GetConn객체를 외부에서 연결해서 사용해주기위한 메소드를 만들어준다.
	public Connection getConn() {
		return conn;
	}
	
	public void pstmtClose() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {}
		}
	}
	
	public void rsClose() {
		if(rs != null) {
			try {
				rs.close();
				pstmtClose();
			} catch (SQLException e) {}
		}
	}
	
	public static GetConn getInstance() {
		return instance;
	}
}
