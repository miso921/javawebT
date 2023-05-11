package study2.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;
import member.MemberVO;

@SuppressWarnings("serial")
@WebServlet("/AjaxTest2")
public class AjaxTest2 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		
		MemberDAO dao = new MemberDAO();
		
		MemberVO vo = dao.getMemberMidCheck(mid);
		
		String str = "";
		if(vo.getName() == null) {
			str = "찾는 자료가 없습니다.";
		}
		else {
			str = vo.getMid() + "/" + vo.getName() + "/" + vo.getNickName() + "/" + vo.getGender() + "/" + vo.getPoint();
		}
		
		response.getWriter().write(str);
	}
}
