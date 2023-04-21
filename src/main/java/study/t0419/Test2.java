package study.t0419;

import java.io.IOException;
import java.io.PrintWriter;
import java.rmi.ServerException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class Test2 extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServerException, IOException {
		PrintWriter out = response.getWriter();
		out.println("서블릿에서의 출력입니다.<br/>");
		out.println("Welcome to Servlet!!!<br/>");
	}
	
}
