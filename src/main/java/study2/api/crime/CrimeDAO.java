package study2.api.crime;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.GetConn;

public class CrimeDAO {
	// 싱클톤으로 선언된 DB연결객체(GetConn)을 연결한다.
	GetConn getConn = GetConn.getInstance();
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	
	CrimeVO vo = null;

	// 자료 저장하기
	public void setCrimeSaveOk(CrimeVO vo) {
		try {
			sql = "insert into crime values (default,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getYear());
			pstmt.setString(2, vo.getPolice());
			pstmt.setInt(3, vo.getRobbery());
			pstmt.setInt(4, vo.getMurder());
			pstmt.setInt(5, vo.getTheft());
			pstmt.setInt(6, vo.getViolence());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
	}

	// 해당 년 자료 삭제처리
	public String setCrimeDeleteOk(int year) {
		String res = "0";
		try {
			sql = "delete from crime where year = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, year);
			pstmt.executeUpdate();
			res = "1";
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

	// 년도 검색하기
	public String getSearchYear(int year) {
		String res = "0";
		try {
			sql = "select * from crime where year = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, year);
			rs = pstmt.executeQuery();
			if(rs.next()) res = "1";
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

	// 년도별 전체 자료 검색하기
	public ArrayList<CrimeVO> getListYear(int year) {
		ArrayList<CrimeVO> vos = new ArrayList<>();
		try {
			sql = "select * from crime where year = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, year);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CrimeVO vo = new CrimeVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setYear(rs.getInt("year"));
				vo.setPolice(rs.getString("police"));
				vo.setRobbery(rs.getInt("robbery"));
				vo.setMurder(rs.getInt("murder"));
				vo.setTheft(rs.getInt("theft"));
				vo.setViolence(rs.getInt("vioLence"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return vos;
	}

	// 날짜별 경찰서별 출력하기
	public ArrayList<CrimeVO> getPoliceCrimeDataSearch(int year, String crimeOrder) {
		ArrayList<CrimeVO> vos = new ArrayList<>();
		try {
			sql = "select * from crime where year = ? order by police " + crimeOrder;
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, year);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CrimeVO vo = new CrimeVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setYear(rs.getInt("year"));
				vo.setPolice(rs.getString("police"));
				vo.setRobbery(rs.getInt("robbery"));
				vo.setMurder(rs.getInt("murder"));
				vo.setTheft(rs.getInt("theft"));
				vo.setViolence(rs.getInt("vioLence"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return vos;
	}

	// 분석자료 가져오기
	public CrimeVO getAnalyze(int year) {
		CrimeVO analyzeVo = new CrimeVO();
		try {
			sql = "select year,sum(robbery) as totRobbery,sum(murder) as totMurder,sum(theft) as totTheft,sum(vioLence) as totViolence, "
					+ " avg(robbery) as avgRobbery,avg(murder) as avgMurder,avg(theft) as avgTheft,avg(vioLence) as avgViolence "
					+ "	from crime where year = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, year);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				analyzeVo.setYear(rs.getInt("year"));
				
				analyzeVo.setTotRobbery(rs.getInt("totRobbery"));
				analyzeVo.setTotMurder(rs.getInt("totMurder"));
				analyzeVo.setTotTheft(rs.getInt("totTheft"));
				analyzeVo.setTotViolence(rs.getInt("totViolence"));
				analyzeVo.setAvgRobbery(rs.getInt("avgRobbery"));
				analyzeVo.setAvgMurder(rs.getInt("avgMurder"));
				analyzeVo.setAvgTheft(rs.getInt("avgTheft"));
				analyzeVo.setAvgViolence(rs.getInt("avgViolence"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return analyzeVo;
	}

}
