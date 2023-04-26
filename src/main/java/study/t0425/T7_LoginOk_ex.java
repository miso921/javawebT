package study.t0425;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/t0425/T7_LoginOk_ex")
public class T7_LoginOk_ex extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		String idSave = request.getParameter("idSave")==null ? "off" : "on";
		
		HttpSession session = request.getSession();
		
		PrintWriter out = response.getWriter();
		
		if((mid.equals("admin") && pwd.equals("1234")) || (mid.equals("hkd1234") && pwd.equals("1234"))) {
			session.setAttribute("sMid", mid);
			
			Cookie cookieMid = new Cookie("cMid", mid);
			cookieMid.setPath("/");
			if(idSave.equals("on")) {
				cookieMid.setMaxAge(60*60*24*7);
			}
			else {
				cookieMid.setMaxAge(0);
			}
			response.addCookie(cookieMid);

			// 방문횟수 카운트하기
			ServletContext application = request.getServletContext();
			int totalVisitCount = application.getAttribute("totalVisitCount")==null ? 0 : (int) application.getAttribute("totalVisitCount");
		  application.setAttribute("totalVisitCount", totalVisitCount + 1);
			
			out.print("<script>");
			out.print("alert('"+mid+"님 로그인 되었습니다.');");
			out.print("location.href='"+request.getContextPath()+"/study/0425_storage/t7_member_ex.jsp';");
			out.print("</script>");
		}
		else {
			out.print("<script>");
			out.print("alert('아이디와 비밀번호를 확인하세요.');");
			out.print("location.href='"+request.getContextPath()+"/study/0425_storage/t7_Login_ex.jsp';");
			out.print("</script>");
		}
	}
}
