package study.t0426;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
//@WebServlet()
public class T_init extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("이곳은 service()입니다.");
		
		String logoName = getServletContext().getInitParameter("logoName");
		String homeAddress = getServletContext().getInitParameter("homeAddress");
		
		System.out.println("logoName : " + logoName);
		System.out.println("homeAddress : " + homeAddress);
		
		HttpSession session = request.getSession();
		
		session.setAttribute("logoName", logoName);
		session.setAttribute("homeAddress", homeAddress);
		
		String viewPage = "/study/0426/t_initRes.jsp";
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
	
}
