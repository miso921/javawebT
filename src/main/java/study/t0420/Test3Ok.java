package study.t0420;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/t0420/Test3Ok")
public class Test3Ok extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		String gender = request.getParameter("gender");
		
		String[] hobbys = request.getParameterValues("hobby");
	  String strHobby = "";
	  for(String hobby : hobbys) strHobby += hobby + "/";
	  strHobby = strHobby.substring(0, strHobby.length()-1);
	  
	  System.out.println("성명 : " + name);
	  System.out.println("나이 : " + age);
	  System.out.println("성별 : " + gender);
	  System.out.println("취미 : " + strHobby);
	  
	  
//	  PrintWriter out = response.getWriter();
//	  
//	  out.print("<script>");
//	  out.print("alert('자료가 저장되었습니다.');");
//	  out.print("location.href = '"+request.getContextPath()+"/study/0420/test3.jsp';");
//	  out.print("</script>");
	  
	  // DB에 자료 저장후 view로 이동하기
	  name = URLEncoder.encode(name,"utf-8");	// 한글 성명이 왔을때는 utf-8로 인코딩한다.
	  response.sendRedirect(request.getContextPath()+"/study/0420/test3Res.jsp?name="+name);
//	  RequestDispatcher dispatcher = request.getRequestDispatcher("/study/0420/test3Res.jsp");
//	  dispatcher.forward(request, response);
	}
}
