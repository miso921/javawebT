package study.t0424;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/t0424/T5_LoginOk")
public class T5_LoginOk extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
//		String viewPage = "";
		
		HttpSession session = request.getSession();
		
		PrintWriter out = response.getWriter();
		
		if((mid.equals("admin") && pwd.equals("1234")) || (mid.equals("hkd1234") && pwd.equals("1234"))) {
			// request.setAttribute("mid", mid);
			session.setAttribute("sMid", mid);
			
			out.print("<script>");
			out.print("alert('"+mid+"님 로그인 되었습니다.');");
			out.print("location.href='"+request.getContextPath()+"/study/0425_storage/t5_member.jsp';");
			out.print("</script>");
//			viewPage = "/study/0425_storage/t5_member.jsp";
//			request.getRequestDispatcher(viewPage).forward(request, response);
		}
		else {
			out.print("<script>");
			out.print("alert('아이디와 비밀번호를 확인하세요.');");
			out.print("location.href='"+request.getContextPath()+"/study/0425_storage/t5_Login.jsp';");
			out.print("</script>");
//			viewPage = "/study/0425_storage/t5_Login.jsp";
//			request.getRequestDispatcher(viewPage).forward(request, response);
		}
	}
}
