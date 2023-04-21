package study.t0420;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/0420/test5_ExOk")
public class test5_ExOk extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] sus = request.getParameterValues("su");
		
		for(int i=0; i<sus.length; i++) {
			System.out.println("sus["+i+"] : " + sus[i]);
		}
		
		
	}
}
