package study2.ajax2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.GetConn;

public class UserDAO {
	GetConn getConn = GetConn.getInstance();
	
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	
	UserVO vo = null;

	// User 전체 조회처리
	public ArrayList<UserVO> getUserList() {
		ArrayList<UserVO> vos = new ArrayList<>();
		try {
			sql = "select * from user order by idx desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new UserVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setName(rs.getString("name"));
				vo.setAge(rs.getInt("age"));
				vo.setAddress(rs.getString("address"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("sql오류 : " + e.getMessage());
		}	finally {
			getConn.rsClose();
		}
		return vos;
	}

	// 회원 등록하기.
	public String setUserInput(UserVO vo) {
		String res = "0";
		try {
			sql = "insert into user values (default,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getName());
			pstmt.setInt(3, vo.getAge());
			pstmt.setString(4, vo.getAddress());
			pstmt.executeUpdate();
			res = "1";
		} catch (SQLException e) {
			System.out.println("sql오류 : " + e.getMessage());
		}	finally {
			getConn.pstmtClose();
		}
		return res;
	}

	// user 검색하기
	public String getMidSearch(String mid) {
		String res = "0";
		try {
			sql = "select * from user where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			if(!rs.next()) res = "1";
		} catch (SQLException e) {
			System.out.println("sql오류 : " + e.getMessage());
		}	finally {
			getConn.rsClose();
		}
		return res;
	}

	// User 삭제처리
	public String setUserDelete(int idx) {
		String res = "0";
		try {
			sql = "delete from user where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
			res = "1";
		} catch (SQLException e) {
			System.out.println("sql오류 : " + e.getMessage());
		}	finally {
			getConn.pstmtClose();
		}
		return res;
	}

	// 아이디로 검색처리
	public UserVO getIdxSearch(int idx) {
		vo = new UserVO();
		try {
			sql = "select * from user where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setName(rs.getString("name"));
				vo.setAge(rs.getInt("age"));
				vo.setAddress(rs.getString("address"));
			}
		} catch (SQLException e) {
			System.out.println("sql오류 : " + e.getMessage());
		}	finally {
			getConn.rsClose();
		}
		return vo;
	}

	// user 수정하기
	public String setUserUpdate(UserVO vo) {
		String res = "0";
		try {
			sql = "update user set mid=?,name=?,age=?,address=? where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getName());
			pstmt.setInt(3, vo.getAge());
			pstmt.setString(4, vo.getAddress());
			pstmt.setInt(5, vo.getIdx());
			pstmt.executeUpdate();
			res = "1";
		} catch (SQLException e) {
			System.out.println("sql오류 : " + e.getMessage());
		}	finally {
			getConn.pstmtClose();
		}
		return res;
	}
	
}
