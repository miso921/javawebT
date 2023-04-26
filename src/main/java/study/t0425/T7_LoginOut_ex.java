package study.t0425;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/t0425/T7_LoginOut_ex")
public class T7_LoginOut_ex extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String mid = (String) session.getAttribute("sMid");
		
		session.invalidate();
		
		PrintWriter out = response.getWriter();
		out.print("<script>");
		out.print("alert('"+mid+"님 로그아웃 되었습니다.');");
		out.print("location.href='"+request.getContextPath()+"/study/0425_storage/t7_Login_ex.jsp';");
		out.print("</script>");
	}
}
