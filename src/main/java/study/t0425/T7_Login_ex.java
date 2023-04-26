package study.t0425;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet(urlPatterns = "/t0425/T7_Login_ex", initParams = {@WebInitParam(name="totalVisitCount", value="0")})
public class T7_Login_ex extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int totalVisitCount = Integer.parseInt(getInitParameter("totalVisitCount"));
		
		ServletContext application = request.getServletContext();
		
		application.setAttribute("totalVisitCount", totalVisitCount);
		
		String viewPage = "/study/0425_storage/t7_Login_ex.jsp";
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
}
