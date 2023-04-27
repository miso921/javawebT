package study.database;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/database/JoinOk")
public class JoinOk extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		
		LoginVO vo = new LoginVO();
		
		vo.setMid(mid);
		vo.setPwd(pwd);
		vo.setName(name);
		
		LoginDAO dao = new LoginDAO();
		
		LoginVO vo2 = dao.getMidCheck(mid);
		
		PrintWriter out = response.getWriter();
		
		if(vo2.getMid() != null) {
			// 아이디가 중복되었음.
			out.print("<script>");
			out.print("alert('아이디가 중복되었습니다.');");
			out.print("location.href='"+request.getContextPath()+"/study/0428_database/join.jsp';");
			out.print("</script>");
		}
		else {
			// 아이디가 중복되어 있지 않기에 DB에 정보를 저장시킨다.
			dao.setJoinOk(vo);
			out.print("<script>");
			out.print("alert('회원에 가입되셨습니다.');");
			out.print("location.href='"+request.getContextPath()+"/study/0428_database/login.jsp';");
			out.print("</script>");
			//out.print("회원가입완료!!");
		}
	}
}
