package admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("*.ad")
public class AdminController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminInterface command = null;
		String viewPage = "/WEB-INF/admin";
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"),uri.lastIndexOf("."));
		
		// 세션이 끈겼다고한다면 작업의 진행을 중지시키고 홈으로 전송한다.
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel")==null ? 99 : (int) session.getAttribute("sLevel");
				
		if(level > 0) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/");
			dispatcher.forward(request, response);
		}
		else if(com.equals("/AdminMain")) {
			viewPage += "/adminMain.jsp";
		}
		else if(com.equals("/AdminLeft")) {
			viewPage += "/adminLeft.jsp";
		}
		else if(com.equals("/AdminContent")) {
			command = new AdminContentCommand();
			command.execute(request, response);
			viewPage += "/adminContent.jsp";
		}
		else if(com.equals("/AdminMemberList")) {
			command = new AdminMemberListCommand();
			command.execute(request, response);
			viewPage += "/member/adminMemberList.jsp";
		}
		else if(com.equals("/AdminMemberLevelChange")) {
			command = new AdminMemberLevelChangeCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/AdminMemberLevelTotalChange")) {
			command = new AdminMemberLevelTotalChangeCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/AdminMemberInfor")) {
			command = new AdminMemberInforCommand();
			command.execute(request, response);
			viewPage += "/member/adminMemberInfor.jsp";
		}
		else if(com.equals("/AdminMemberDelete")) {
			command = new AdminMemberDeleteCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/AdminMemberLevelShow")) {
			command = new AdminMemberLevelShowCommand();
			command.execute(request, response);
			viewPage += "/member/adminMemberList.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
