package study2.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginOkCommand implements LoginInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		
		LoginDAO dao = new LoginDAO();
		
		LoginVO vo = dao.getLoginCheck(mid, pwd);
		
		if(vo.getName() != null) {
			// 회원 인증 성공시 처리...
			// 회원인증후 처리(1.자주사용하는자료를 세션에 저장(아이디,성명,닉네임),  2.쿠키에 아이디 저장또는 제거하기)
			
			/*
			 방문포인트 처리하기('최종접속일처리'/'방문카운트'도 함께한다.)
			 db의 최종접속일(10자리)와 시스템날짜(10자리)를 비교하여 같으면 todaCount = vo.getTodayCount()+1, 같지않으면 todayCount = 0
			 이때 접속일이 다르다면 point=vo.getPoint()+10, 같지않으면 다시 방문카운트를 비교해서 5이내면 point=vo.getPoint()+10, 5이상이면 point=vo.getPoint() 처리한다.
			 작업처리후 다음과같이 메소드호출하여 DB처리한다.
			 dao.setPointPlus(mid, todayCount, point);
			*/
			
			// 날짜 비교
			Date today = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String strToday = sdf.format(today);
			
			int todayCount = vo.getTodayCount();
			int point = 0;
			String lastDate = vo.getLastDate();
			if(strToday.equals(lastDate.substring(0,10))) {
				todayCount++;
				if(vo.getTodayCount() < 5) point = vo.getPoint() + 10;
				else point = vo.getPoint();
			}
			else {
				todayCount = 1;
				point = vo.getPoint() + 10;
			}
			
			// 변경된 사항을 update한다.
			dao.setPointPlus(mid, point, todayCount);
			
			// 변경된 사항을 다시 불러온다.
			vo = dao.getLoginCheck(mid, pwd);			
			
			// 1.세션처리
			HttpSession session = request.getSession();
			session.setAttribute("sMid", mid);
			session.setAttribute("sName", vo.getName());
			session.setAttribute("sPoint", vo.getPoint());
			session.setAttribute("sLastDate", lastDate);
			session.setAttribute("sTodayCount", vo.getTodayCount());
			
			
			// 2.쿠키에 아이디를 저장/해제 처리한다.
			// 로그인시 아이디저장시킨다고 체크하면 쿠키에 아이디 저장하고, 그렇지 않으면 쿠키에서 아이디를 제거한다.
			String idSave = request.getParameter("idSave")==null ? "off" : "on";
			Cookie cookieMid = new Cookie("cMid", mid);
			cookieMid.setPath("/");
			if(idSave.equals("on")) {
				cookieMid.setMaxAge(60*60*24*7);
			}
			else {
				cookieMid.setMaxAge(0);
			}
			response.addCookie(cookieMid);
			
			
			// 정상 로그인Ok이후에 모든 처리가 끝나면 memberMain.jsp로 보내준다.
			request.setAttribute("msg", mid + "님 로그인 되었습니다.");
			request.setAttribute("url", request.getContextPath()+"/MemberMain.re");
		}
		else {
			// 회원 인증 실패시 처리... 다시 로그인창으로 보내준다.
			request.setAttribute("msg", "로그인 실패~~~");
			request.setAttribute("url", request.getContextPath()+"/Login.re");
		}
	}

}
