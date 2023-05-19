package pds;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("*.pds")
public class PdsController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PdsInterface command = null;
		String viewPage = "/WEB-INF/pds";
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"),uri.lastIndexOf("."));
		
		// 세션이 끈겼다고한다면 작업의 진행을 중지시키고 홈으로 전송한다.
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel")==null ? 99 : (int) session.getAttribute("sLevel");
				
		if(level > 4) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/");
			dispatcher.forward(request, response);
		}
		else if(com.equals("/PdsList")) {
			command = new PdsListCommand();
			command.execute(request, response);
			viewPage += "/pdsList.jsp";
		}
		else if(com.equals("/PdsInput")) {
			command = new PdsInputCommand();
			command.execute(request, response);
			viewPage += "/pdsInput.jsp";
		}
		else if(com.equals("/PdsInputOk")) {
			command = new PdsInputOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/PdsDownNumCheck")) {
			command = new PdsDownNumCheckCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/PdsDeleteCheck")) {
			command = new PdsDeleteCheckCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/PdsTotalDown")) {
			command = new PdsTotalDownCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/PdsContent")) {
			command = new PdsContentCommand();
			command.execute(request, response);
			viewPage += "/pdsContent.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
