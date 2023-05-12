package member;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import conn.SecurityUtil;

public class MemberLoginOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		String idSave = request.getParameter("idSave")==null ? "" : request.getParameter("idSave");
		
		MemberDAO dao = new MemberDAO();
		
		MemberVO vo = dao.getMemberMidCheck(mid);
		
		if(vo.getSalt() == null || vo.getUserDel().equals("OK")) {
			request.setAttribute("msg", "회원정보가 없습니다. \\n다시 입력하세요.");
			request.setAttribute("url", request.getContextPath()+"/MemberLogin.mem");
			return;
		}
		
		String salt = vo.getSalt();
		pwd = salt + pwd;
		
		SecurityUtil security = new SecurityUtil();
		pwd = security.encryptSHA256(pwd);
		
		if(!pwd.equals(vo.getPwd())) {
			request.setAttribute("msg", "비밀번호를 확인해보세요.");
			request.setAttribute("url", request.getContextPath()+"/MemberLogin.mem");
			return;
		}
		
		// 로그인 성공시에 처리할 내용들을 기술한다.(1.주요필드를 세션에 저장, 2.오늘방문횟수처리, 3. 총방문수와 방문포인트처리, 4.쿠키에 아이디저장유무)
		// 1.
		HttpSession session = request.getSession();
		session.setAttribute("sMid", mid);
		session.setAttribute("sNickName", vo.getNickName());
		session.setAttribute("sLevel", vo.getLevel());
		session.setAttribute("sLastDate", vo.getLastDate());
		
		// 2~3.
		Date now = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String strNow = sdf.format(now);
		
		// 오늘 처음 방문시는 오늘방문카운트(todayCnt)를 0으로 셋팅한다.
		if(!vo.getLastDate().substring(0,10).equals(strNow)) {
			dao.setTodayCntUpdate(mid);
			vo.setTodayCnt(0);
		}
		
		// 방문포인트를 최대 50점(5회방문)까지 줄수 있도록 처리....
		int nowTodayPoint = 0;
		if(vo.getTodayCnt() >= 5) {
			nowTodayPoint = vo.getPoint();
		}
		else {
			nowTodayPoint = vo.getPoint() + 10;
		}
		dao.setMemberTotalUpdate(mid, nowTodayPoint);
		
		// 4.
		Cookie cMid = new Cookie("cMid", mid);
		if(idSave.equals("on")) {
			cMid.setMaxAge(60*60*24*7);
		}
		else {
			cMid.setMaxAge(0);
		}
		response.addCookie(cMid);
		
		request.setAttribute("msg", vo.getNickName() + "님 로그인되었습니다.");
		request.setAttribute("url", request.getContextPath()+"/MemberMain.mem");
	}

}
