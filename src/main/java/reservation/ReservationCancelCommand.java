package reservation;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ReservationCancelCommand implements ReservationInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
		int resInforIdx = request.getParameter("resInforIdx")==null ? 0 : Integer.parseInt(request.getParameter("resInforIdx"));
		int reservationNum = request.getParameter("reservationNum")==null ? 0 : Integer.parseInt(request.getParameter("reservationNum"));

		ReservationDAO dao = new ReservationDAO();
		
		String res = dao.setReservationCancel(idx, resInforIdx, reservationNum);
		
		response.getWriter().write(res);
	}

}
