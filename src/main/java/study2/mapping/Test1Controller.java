package study2.mapping;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/mapping/Test1")
// @WebServlet({"/mapping/Test1","/mapping/Test4"})
public class Test1Controller extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("이곳은....서블릿의 /mapping/Test1 입니다.");
		
		//                 /WEB-INF/study2/mapping/test1.jsp
		String viewPage = "/WEB-INF/study2/mapping/test1.jsp";
		
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
}
