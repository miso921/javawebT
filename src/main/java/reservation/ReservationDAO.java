package reservation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.GetConn;

public class ReservationDAO {
	// 싱클톤으로 선언된 DB연결객체(GetConn)을 연결한다.
	GetConn getConn = GetConn.getInstance();
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	
	ReservationInforVO inforVo = null;
	ReservationVO Vo = null;
	
	// 예약현환 전체보기
	public ArrayList<ReservationInforVO> getReservationList(int startIndexNo, int pageSize) {
		ArrayList<ReservationInforVO> vos = new ArrayList<>();
		try {
			sql = "select * from reservationInformation order by endDate limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startIndexNo);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				inforVo = new ReservationInforVO();
				inforVo.setIdx(rs.getInt("idx"));
				inforVo.setTitle(rs.getString("title"));
				inforVo.setContent(rs.getString("content"));
				inforVo.setTotalNum(rs.getInt("totalNum"));
				inforVo.setReservationNum(rs.getInt("reservationNum"));
				inforVo.setProgress(rs.getString("progress"));
				inforVo.setStartDate(rs.getString("startDate"));
				inforVo.setEndDate(rs.getString("endDate"));
				inforVo.setPopup(rs.getString("popup"));
				inforVo.setPhoto(rs.getString("photo"));
				
				vos.add(inforVo);
			}
		} catch (SQLException e) {
			System.out.println("sql 오류 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vos;
	}

	// 예약정보 등록하기
	public int setReservationInputOk(ReservationInforVO vo) {
		int res = 0;
		try {
			sql = "insert into reservationInformation values (default,?,?,?,default,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setInt(3, vo.getTotalNum());
			pstmt.setString(4, vo.getProgress());
			pstmt.setString(5, vo.getStartDate());
			pstmt.setString(6, vo.getEndDate());
			pstmt.setString(7, vo.getPopup());
			pstmt.setString(8, vo.getPhoto());
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("sql 오류 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

	// popup 초기화면에 고정시킬지 체크.
	public void setPopupUpdate(int idx, String popup) {
		try {
			sql = "update reservationInformation set popup = ? where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, popup);
			pstmt.setInt(2, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql 오류 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
	}

	// 전체 개수 구하기
	public int totRecCnt() {
		int totRecCnt = 0;
		try {
			sql = "select count(*) as cnt from reservationInformation";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			rs.next();
			totRecCnt = rs.getInt("cnt");
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return totRecCnt;
	}

	// 개별 검색
	public ReservationInforVO getReservationIdxSearch(int idx) {
		ReservationInforVO vo = new ReservationInforVO();
		try {
			sql = "select * from reservationInformation where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			rs.next();
			
			vo.setIdx(rs.getInt("idx"));
			vo.setTitle(rs.getString("title"));
			vo.setContent(rs.getString("content"));
			vo.setTotalNum(rs.getInt("totalNum"));
			vo.setReservationNum(rs.getInt("reservationNum"));
			vo.setProgress(rs.getString("progress"));
			vo.setStartDate(rs.getString("startDate"));
			vo.setEndDate(rs.getString("endDate"));
			vo.setPopup(rs.getString("popup"));
			vo.setPhoto(rs.getString("photo"));
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vo;
	}

	// 예약하기
	public int setReservationConfirmOk(ReservationVO vo) {
		int res = 0;
		try {
			sql = "insert into reservation values (default,?,?,?,?,?,default,default);";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getResInforIdx());
			pstmt.setInt(2, vo.getMemberIdx());
			pstmt.setString(3, vo.getMid());
			pstmt.setInt(4, vo.getReservationNum());
			pstmt.setString(5, vo.getReservationDate());
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

	// 예약인원을 더해주기
	public void setReservationNumUpdate(int reservationNum, int resInforIdx) {
		try {
			sql = "update reservationInformation set reservationNum = reservationNum + ? where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reservationNum);
			pstmt.setInt(2, resInforIdx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
	}

	// 개별 회원에 대한 예약 전체횟수 구하기
	public int totRecCntMid(String mid) {
		int totRecCnt = 0;
		try {
			if(mid.equals("")) {
				sql = "select count(*) as cnt from reservation";
				pstmt = conn.prepareStatement(sql);
			}
			else {
				sql = "select count(*) as cnt from reservation where mid = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mid);
			}
			rs = pstmt.executeQuery();
			
			rs.next();
			totRecCnt = rs.getInt("cnt");
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return totRecCnt;
	}
	
  // 개별회원이 예약한 모든내역들 가져오기.
	public ArrayList<ReservationVO> getReservationMidList(int startIndexNo, int pageSize, String mid) {
		ArrayList<ReservationVO> vos = new ArrayList<>();
		try {
//			sql = "select * from reservation r, reservationInformation i where r.mid = ? order by r.idx desc limit ?,?";
			if(mid.equals("")) {
				sql = "select *, "
						+ "(select title from reservationInformation where idx = r.resInforIdx) as title, "
						+ "(select startDate from reservationInformation where idx = r.resInforIdx) as startDate, "
						+ "(select endDate from reservationInformation where idx = r.resInforIdx) as endDate, "
						+ "(select content from reservationInformation where idx = r.resInforIdx) as content, "
						+ "(select photo from reservationInformation where idx = r.resInforIdx) as photo "
						+ " from reservation r order by r.idx desc limit ?,?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, startIndexNo);
				pstmt.setInt(2, pageSize);
			}
			else {
				sql = "select *, "
						+ "(select title from reservationInformation where idx = r.resInforIdx) as title, "
						+ "(select startDate from reservationInformation where idx = r.resInforIdx) as startDate, "
						+ "(select endDate from reservationInformation where idx = r.resInforIdx) as endDate, "
						+ "(select content from reservationInformation where idx = r.resInforIdx) as content, "
						+ "(select photo from reservationInformation where idx = r.resInforIdx) as photo "
						+ " from reservation r where r.mid = ? order by r.idx desc limit ?,?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mid);
				pstmt.setInt(2, startIndexNo);
				pstmt.setInt(3, pageSize);
			}
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ReservationVO vo = new ReservationVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setResInforIdx(rs.getInt("resInforIdx"));
				vo.setMemberIdx(rs.getInt("memberIdx"));
				vo.setMid(rs.getString("mid"));
				vo.setReservationNum(rs.getInt("reservationNum"));
				vo.setReservationDate(rs.getString("reservationDate"));
				vo.setrWDate(rs.getString("rWDate"));
				vo.setReservationFlag(rs.getString("reservationFlag"));
				
				vo.setTitle(rs.getString("title"));
				vo.setStartDate(rs.getString("startDate"));
				vo.setEndDate(rs.getString("endDate"));
				vo.setContent(rs.getString("content"));
				vo.setPhoto(rs.getString("photo"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("sql 오류 :: " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vos;
	}

	// 예약 취소하기
	public String setReservationCancel(int idx, int resInforIdx, int reservationNum) {
		String res = "0";
		try {
			sql = "update reservationInformation set reservationNum = reservationNum - ? where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reservationNum);
			pstmt.setInt(2, resInforIdx);
			pstmt.executeUpdate();
			pstmt.close();
			
			// sql = "delete from reservation where idx = ?";
			sql = "update reservation set reservationFlag = '예약취소', rWDate = now() where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
			res = "1";
		} catch (SQLException e) {
			System.out.println("sql 오류 :: " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

	// popup에 'OK' 적흰것만 가져오기
	public ArrayList<ReservationInforVO> getreservationPopupCheck() {
		ArrayList<ReservationInforVO> vos = new ArrayList<>();
		try {
			sql = "select * from reservationInformation where popup = 'OK' order by endDate";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				inforVo = new ReservationInforVO();
				inforVo.setIdx(rs.getInt("idx"));
				inforVo.setTitle(rs.getString("title"));
				inforVo.setContent(rs.getString("content"));
				inforVo.setTotalNum(rs.getInt("totalNum"));
				inforVo.setReservationNum(rs.getInt("reservationNum"));
				inforVo.setProgress(rs.getString("progress"));
				inforVo.setStartDate(rs.getString("startDate"));
				inforVo.setEndDate(rs.getString("endDate"));
				inforVo.setPopup(rs.getString("popup"));
				inforVo.setPhoto(rs.getString("photo"));
				
				vos.add(inforVo);
			}
		} catch (SQLException e) {
			System.out.println("sql 오류 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vos;
	}
}
