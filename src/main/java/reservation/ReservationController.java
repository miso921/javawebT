package reservation;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("*.res")
public class ReservationController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ReservationInterface command = null;
		String viewPage = "/WEB-INF";
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"),uri.lastIndexOf("."));
		
		// 세션이 끈겼다고한다면 작업의 진행을 중지시키고 홈으로 전송한다.
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel")==null ? 99 : (int) session.getAttribute("sLevel");
				
		if(level > 4) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/");
			dispatcher.forward(request, response);
		}
		else if(com.equals("/AdminReservationList")) {
			command = new ReservationListCommand();
			command.execute(request, response);
			viewPage += "/admin/reservation/adminReservationList.jsp";
		}
		else if(com.equals("/AdminReservationInforInput")) {
			viewPage += "/admin/reservation/adminReservationInforInput.jsp";
		}
		else if(com.equals("/AdminReservationInforInputOk")) {
			command = new ReservationInforInputOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/AdminReservationPopupUpdate")) {
			command = new AdminReservationPopupUpdateCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/AdminReservationProcessList")) {
			command = new AdminReservationProcessListCommand();
			command.execute(request, response);
			viewPage += "/admin/reservation/adminReservationProcessList.jsp";
		}
		else if(com.equals("/ReservationList")) {
			command = new ReservationListCommand();
			command.execute(request, response);
			viewPage += "/reservation/reservationList.jsp";
		}
		else if(com.equals("/Reservation")) {
			command = new ReservationCommand();
			command.execute(request, response);
			viewPage += "/reservation/reservation.jsp";
		}
		else if(com.equals("/ReservationConfirm")) {
			command = new ReservationConfirmCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/ReservationMyList")) {
			command = new ReservationMyListCommand();
			command.execute(request, response);
			viewPage += "/reservation/reservationMyList.jsp";
		}
		else if(com.equals("/ReservationCancel")) {
			command = new ReservationCancelCommand();
			command.execute(request, response);
			return;
		}
				
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
