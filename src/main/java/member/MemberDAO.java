package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.GetConn;

public class MemberDAO {
	GetConn getConn = GetConn.getInstance();
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	
	MemberVO vo = null;

	// 아이디체크후 자료가 있으면 vo에 개인정보를 모두 담는다.
	public MemberVO getMemberMidCheck(String mid) {
		vo = new MemberVO();
		try {
			sql = "select * from member where mid = ?";
			pstmt = conn.prepareStatement(sql);
		  pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setNickName(rs.getString("nickName"));
				vo.setName(rs.getString("name"));
				vo.setGender(rs.getString("gender"));
				vo.setBirthday(rs.getString("birthday"));
				vo.setTel(rs.getString("tel"));
				vo.setAddress(rs.getString("address"));
				vo.setEmail(rs.getString("email"));
				vo.setHomePage(rs.getString("homePage"));
				vo.setJob(rs.getString("job"));
				vo.setHobby(rs.getString("hobby"));
				vo.setPhoto(rs.getString("photo"));
				vo.setContent(rs.getString("content"));
				vo.setUserInfor(rs.getString("userInfor"));
				vo.setUserDel(rs.getString("userDel"));
				vo.setPoint(rs.getInt("point"));
				vo.setLevel(rs.getInt("level"));
				vo.setVisitCnt(rs.getInt("visitCnt"));
				vo.setStartDate(rs.getString("startDate"));
				vo.setLastDate(rs.getString("lastDate"));
				vo.setTodayCnt(rs.getInt("todayCnt"));
				vo.setSalt(rs.getString("salt"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vo;
	}

	// 닉네임 중복 체크
	public MemberVO getMemberNickCheck(String nickName) {
		vo = new MemberVO();
		try {
			sql = "select * from member where nickName = ?";
			pstmt = conn.prepareStatement(sql);
		  pstmt.setString(1, nickName);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setNickName(rs.getString("nickName"));
				vo.setName(rs.getString("name"));
				vo.setGender(rs.getString("gender"));
				vo.setBirthday(rs.getString("birthday"));
				vo.setTel(rs.getString("tel"));
				vo.setAddress(rs.getString("address"));
				vo.setEmail(rs.getString("email"));
				vo.setHomePage(rs.getString("homePage"));
				vo.setJob(rs.getString("job"));
				vo.setHobby(rs.getString("hobby"));
				vo.setPhoto(rs.getString("photo"));
				vo.setContent(rs.getString("content"));
				vo.setUserInfor(rs.getString("userInfor"));
				vo.setUserDel(rs.getString("userDel"));
				vo.setPoint(rs.getInt("point"));
				vo.setLevel(rs.getInt("level"));
				vo.setVisitCnt(rs.getInt("visitCnt"));
				vo.setStartDate(rs.getString("startDate"));
				vo.setLastDate(rs.getString("lastDate"));
				vo.setTodayCnt(rs.getInt("todayCnt"));
				vo.setSalt(rs.getString("salt"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vo;
	}

	// 신규회원 가입처리
	public int setMemberJoinOk(MemberVO vo) {
		int res = 0;
		try {
			sql = "insert into member values (default,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,default,default,default,default,default,default,default,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getPwd());
			pstmt.setString(3, vo.getNickName());
			pstmt.setString(4, vo.getName());
			pstmt.setString(5, vo.getGender());
			pstmt.setString(6, vo.getBirthday());
			pstmt.setString(7, vo.getTel());
			pstmt.setString(8, vo.getAddress());
			pstmt.setString(9, vo.getEmail());
			pstmt.setString(10, vo.getHomePage());
			pstmt.setString(11, vo.getJob());
			pstmt.setString(12, vo.getHobby());
			pstmt.setString(13, vo.getPhoto());
			pstmt.setString(14, vo.getContent());
			pstmt.setString(15, vo.getUserInfor());
			pstmt.setString(16, vo.getSalt());
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

	// 오늘 처음 방문시에 방문카운트를 0으로 초기화.
	public void setTodayCntUpdate(String mid) {
		try {
			sql = "update member set todayCnt = 0 where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
	}

	// 방문시, '총방문수', '오늘방문수','포인트','최종접속일' 누적처리
	public void setMemberTotalUpdate(String mid, int nowTodayPoint) {
		try {
			sql = "update member set visitCnt=visitCnt+1, todayCnt=todayCnt+1, point=?, lastDate=now() where mid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, nowTodayPoint);
			pstmt.setString(2, mid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
	}

  // 현재 로그인한 회원이 방명록에 올린 글의 개수 가져오기
	public int getGuestWrite(String mid, String name, String nickName) {
		int guestCnt = 0;
		try {
			// sql = "select count(*) as cnt from guest where name = ? or name = ? or name = ?";
			sql = "select count(*) as cnt from guest where name in (?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, name);
			pstmt.setString(3, nickName);
			rs = pstmt.executeQuery();
			rs.next();
			guestCnt = rs.getInt("cnt");
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return guestCnt;
	}

	// 회원 전체 리스트처리
	public ArrayList<MemberVO> getMemberList(int startIndexNo, int pageSize) {
		ArrayList<MemberVO> vos = new ArrayList<>();
		try {
			sql = "select *, timestampdiff(day, lastDate, now()) as deleteDiff from member order by idx desc limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startIndexNo);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new MemberVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setNickName(rs.getString("nickName"));
				vo.setName(rs.getString("name"));
				vo.setGender(rs.getString("gender"));
				vo.setBirthday(rs.getString("birthday"));
				vo.setTel(rs.getString("tel"));
				vo.setAddress(rs.getString("address"));
				vo.setEmail(rs.getString("email"));
				vo.setHomePage(rs.getString("homePage"));
				vo.setJob(rs.getString("job"));
				vo.setHobby(rs.getString("hobby"));
				vo.setPhoto(rs.getString("photo"));
				vo.setContent(rs.getString("content"));
				vo.setUserInfor(rs.getString("userInfor"));
				vo.setUserDel(rs.getString("userDel"));
				vo.setPoint(rs.getInt("point"));
				vo.setLevel(rs.getInt("level"));
				vo.setVisitCnt(rs.getInt("visitCnt"));
				vo.setStartDate(rs.getString("startDate"));
				vo.setLastDate(rs.getString("lastDate"));
				vo.setTodayCnt(rs.getInt("todayCnt"));
				vo.setSalt(rs.getString("salt"));
				
				vo.setDeleteDiff(rs.getInt("deleteDiff"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vos;
	}

	// 등업처리 시켜주기
	public void setLevelUpCheck(String mid, int level) {
		try {
			sql = "update member set level = ? where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, level);
			pstmt.setString(2, mid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
	}

	// 회원 전체 건수 구하기
	public int getTotRecCnt() {
		int totRecCnt = 0;
		try {
			sql = "select count(idx) as cnt from member";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			totRecCnt = rs.getInt("cnt");
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return totRecCnt;
	}

	// 게시판에 올린 글수 구하기
	public int getBoardWrite(String mid) {
		int boardCnt = 0;
		try {
			sql = "select count(*) as cnt from board where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			rs.next();
			boardCnt = rs.getInt("cnt");
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return boardCnt;
	}

	// 비밀번호 변경처리.
	public int setMemberPwdUpdateOk(String mid, String newPwd) {
		int res = 0;
		try {
			sql = "update member set pwd = ? where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newPwd);
			pstmt.setString(2, mid);
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

	// 회원 정보수정
	public int setMemberUpdateOk(MemberVO vo) {
		int res = 0;
		try {
			sql = "update member set nickName=?, name=?, gender=?, birthday=?,"
					+ "tel=?, address=?, email=?, homePage=?, job=?, hobby=?,"
					+ "photo=?, content=?, userInfor=?  where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getNickName());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getGender());
			pstmt.setString(4, vo.getBirthday());
			pstmt.setString(5, vo.getTel());
			pstmt.setString(6, vo.getAddress());
			pstmt.setString(7, vo.getEmail());
			pstmt.setString(8, vo.getHomePage());
			pstmt.setString(9, vo.getJob());
			pstmt.setString(10, vo.getHobby());
			pstmt.setString(11, vo.getPhoto());
			pstmt.setString(12, vo.getContent());
			pstmt.setString(13, vo.getUserInfor());
			pstmt.setString(14, vo.getMid());
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

	// 회원 탈퇴 신청하기.
	public void setDeleteAskOk(String mid) {
		try {
			sql = "update member set userDel = 'OK' where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}	
	}

	public void setMemberDelete(int idx) {
		try {
			sql = "delete from member where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}	
	}

	// 등급별로 전체자료 불러오기
	public ArrayList<MemberVO> getMemberList(int level) {
		ArrayList<MemberVO> vos = new ArrayList<>();
		try {
			sql = "select *, timestampdiff(day, lastDate, now()) as deleteDiff from member where level = ? order by idx desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, level);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new MemberVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setNickName(rs.getString("nickName"));
				vo.setName(rs.getString("name"));
				vo.setGender(rs.getString("gender"));
				vo.setBirthday(rs.getString("birthday"));
				vo.setTel(rs.getString("tel"));
				vo.setAddress(rs.getString("address"));
				vo.setEmail(rs.getString("email"));
				vo.setHomePage(rs.getString("homePage"));
				vo.setJob(rs.getString("job"));
				vo.setHobby(rs.getString("hobby"));
				vo.setPhoto(rs.getString("photo"));
				vo.setContent(rs.getString("content"));
				vo.setUserInfor(rs.getString("userInfor"));
				vo.setUserDel(rs.getString("userDel"));
				vo.setPoint(rs.getInt("point"));
				vo.setLevel(rs.getInt("level"));
				vo.setVisitCnt(rs.getInt("visitCnt"));
				vo.setStartDate(rs.getString("startDate"));
				vo.setLastDate(rs.getString("lastDate"));
				vo.setTodayCnt(rs.getInt("todayCnt"));
				vo.setSalt(rs.getString("salt"));
				
				vo.setDeleteDiff(rs.getInt("deleteDiff"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vos;
	}

	// 회원 고유번호(idx)를 이용하여 회원 정보 가져오기
	public MemberVO getIdxSearch(int idx) {
		vo = new MemberVO();
		try {
			sql = "select * from member where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setNickName(rs.getString("nickName"));
				vo.setName(rs.getString("name"));
				vo.setGender(rs.getString("gender"));
				vo.setBirthday(rs.getString("birthday"));
				vo.setTel(rs.getString("tel"));
				vo.setAddress(rs.getString("address"));
				vo.setEmail(rs.getString("email"));
				vo.setHomePage(rs.getString("homePage"));
				vo.setJob(rs.getString("job"));
				vo.setHobby(rs.getString("hobby"));
				vo.setPhoto(rs.getString("photo"));
				vo.setContent(rs.getString("content"));
				vo.setUserInfor(rs.getString("userInfor"));
				vo.setUserDel(rs.getString("userDel"));
				vo.setPoint(rs.getInt("point"));
				vo.setLevel(rs.getInt("level"));
				vo.setVisitCnt(rs.getInt("visitCnt"));
				vo.setStartDate(rs.getString("startDate"));
				vo.setLastDate(rs.getString("lastDate"));
				vo.setTodayCnt(rs.getInt("todayCnt"));
				vo.setSalt(rs.getString("salt"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vo;
	}

	// 회원 대화방 내용 DB에 저장하기
	public void setMemberMessageInputOk(MemberChatVO vo) {
		try {
			sql = "insert into memberChat values (default,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getNickName());
			pstmt.setString(2, vo.getChat());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
	}
	
	// 회원 대화방 내용 DB에 꺼내오기
	public ArrayList<MemberChatVO> getMemberMessage() {
		ArrayList<MemberChatVO> vos = new ArrayList<>();
		try {
			sql = "select chat.* from (select * from memberChat order by idx desc limit 50) chat order by idx asc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberChatVO vo = new MemberChatVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setNickName(rs.getString("nickName"));
				vo.setChat(rs.getString("chat"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return vos;
	}

}
