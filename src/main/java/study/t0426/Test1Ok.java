package study.t0426;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.RequestContext;

@SuppressWarnings("serial")
@WebServlet("/t0426/Test1Ok")
public class Test1Ok extends HttpServlet {
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("이곳은 doGet() 입니다.");
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		System.out.println("title(doGet) : " + title);
		System.out.println("content(doGet) : " + content);
		
		request.setAttribute("title", title);
		request.setAttribute("content", content);
		
		String viewPage = "/study/0426/test1Res.jsp";
		request.getRequestDispatcher(viewPage).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("이곳은 doPost() 입니다.");
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		System.out.println("title(doPost) : " + title);
		System.out.println("content(doPost) : " + content);
		
		doGet(request, response);
	}
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("이곳은 service() 입니다.");
		
		doPost(request, response);
	}

	@Override
	public void init() throws ServletException {
		System.out.println("이곳은 init() 입니다.");
	}

	@Override
	public void destroy() {
		System.out.println("이곳은 destroy() 입니다.");
	}
}
