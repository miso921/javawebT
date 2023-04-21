package study.t0419;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet({"/t8Post","/t8p"})
public class Test8Post extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		
		System.out.println("성명 : " + name);
		System.out.println("나이 : " + age);
		
		PrintWriter out = response.getWriter();
		out.print("성명 : " + name + "<br/>");
		out.print("나이 : " + age + "<br/>");
		// out.print("<a href='/javaweb/study/0419/test8.jsp'>돌아가기</a>");
		out.print("<a href='"+request.getContextPath()+"/study/0419/test8.jsp'>돌아가기</a>");
	}
}
