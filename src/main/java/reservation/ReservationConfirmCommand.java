package reservation;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;

public class ReservationConfirmCommand implements ReservationInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int resInforIdx = request.getParameter("resInforIdx")==null ? 0 : Integer.parseInt(request.getParameter("resInforIdx"));
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		int reservationNum = request.getParameter("reservationNum")==null ? 0 : Integer.parseInt(request.getParameter("reservationNum"));
		String reservationDate = request.getParameter("reservationDate")==null ? "" : request.getParameter("reservationDate");
		
		ReservationDAO dao = new ReservationDAO();
		
		// 날짜비교..
		ReservationInforVO inforVo = dao.getReservationIdxSearch(resInforIdx);
		String startDate = inforVo.getStartDate().substring(0,10);
		String endDate = inforVo.getEndDate().substring(0,10);
		String resDate = reservationDate.substring(0,10);
		String today = java.time.LocalDate.now().toString().substring(0,10);
		
		// a.compareTo(b) : a==b 는 0, a>b 는 1, a<b는 -1
		if(today.compareTo(resDate) == 1 || startDate.compareTo(resDate) == 1 || resDate.compareTo(endDate) == 1) {
			response.getWriter().write("선택하신 날짜는 예약날짜 조건에 해당되지 않습니다.\\n 다시 예약해 주세요.");
			return;
		}
				
		// 예약조건에 맞으면 필요한 값을 가져와서 vo에 담아준다.
		MemberDAO memberDao = new MemberDAO();
		int memberIdx = memberDao.getMemberMidCheck(mid).getIdx();
		
		ReservationVO vo = new ReservationVO();
		vo.setResInforIdx(resInforIdx);
		vo.setMemberIdx(memberIdx);
		vo.setMid(mid);
		vo.setReservationNum(reservationNum);
		vo.setReservationDate(reservationDate);
		
		
		// 예약 신청하기
		int res = dao.setReservationConfirmOk(vo);
		if(res == 1) {
			dao.setReservationNumUpdate(reservationNum, resInforIdx);	// 예약인원수만큼 기존 모집인원에서 제외하기
			response.getWriter().write("예약 되셨습니다. 감사합니다.");
		}
		else {
			response.getWriter().write("예약 실패~ 다시 예약해 주세요.");
		}
		
	}

}
