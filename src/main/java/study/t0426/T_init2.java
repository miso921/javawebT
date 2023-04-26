package study.t0426;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet(urlPatterns="/t0426/T_init2", initParams= {@WebInitParam(name="iMid",value="admin"), @WebInitParam(name="iPwd",value="4321")})
public class T_init2 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("이곳은 service()입니다.");
		
		String mid = getInitParameter("iMid");
		String pwd = getInitParameter("iPwd");
		
		System.out.println("mid : " + mid);
		System.out.println("pwd : " + pwd);
		
		HttpSession session = request.getSession();
		
		session.setAttribute("iMid", mid);
		session.setAttribute("iPwd", pwd);
		
		String viewPage = "/study/0426/t_initRes2.jsp";
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
}
