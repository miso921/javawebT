package schedule;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("*.sc")
public class ScheduleController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ScheduleInterface command = null;
		String viewPage = "/WEB-INF/schedule";
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"),uri.lastIndexOf("."));
		
		// 세션이 끈겼다고한다면 작업의 진행을 중지시키고 홈으로 전송한다.
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel")==null ? 99 : (int) session.getAttribute("sLevel");
				
		if(level > 4) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/");
			dispatcher.forward(request, response);
		}
		else if(com.equals("/ScheduleList")) {
			command = new ScheduleListCommand();
			command.execute(request, response);
			viewPage += "/scheduleList.jsp";
		}
		else if(com.equals("/ScheduleMenu")) {
			command = new ScheduleMenuCommand();
			command.execute(request, response);
			viewPage += "/scheduleMenu.jsp";
		}
		else if(com.equals("/ScheduleInputOk")) {
			command = new ScheduleInputOkCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/ScheduleUpdateOk")) {
			command = new ScheduleUpdateOkCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/ScheduleDeleteOk")) {
			command = new ScheduleDeleteOkCommand();
			command.execute(request, response);
			return;
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
