package study.t0427;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/0427/el2Ok")
public class El2Ok extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		String[] hobbys = request.getParameterValues("hobby");
		
		request.setAttribute("hobbys", hobbys);
		
		System.out.println("name : " + name);
		System.out.println("hobbys : " + hobbys);
		
		for(String hobby : hobbys) {
			System.out.println(hobby);
		}
		System.out.println();
		
		for(int i=0; i<hobbys.length; i++) {
			System.out.println(hobbys[i]);
		}
		
		String viewPage = "/study/0427/el2.jsp";
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
}
