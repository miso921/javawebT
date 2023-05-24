package reservation;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminReservationPopupUpdateCommand implements ReservationInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
		String popup = request.getParameter("popup")==null ? "false" : request.getParameter("popup");
		
		ReservationDAO dao = new ReservationDAO();
		
		dao.setPopupUpdate(idx, popup);
	}

}
