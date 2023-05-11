package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BoGoodPlusMinusCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = Integer.parseInt(request.getParameter("idx"));
		int goodCnt = Integer.parseInt(request.getParameter("goodCnt"));
		
		BoardDAO dao = new BoardDAO();
		
		dao.setGoodPlusMinus(idx, goodCnt);
		
		// 토글 스위치값(+1/-1) 처리시에 수행할 부분 추가함.(뮨제점 발견으로 다시 주석처리함)
//		HttpSession session = request.getSession();
//		int goodCount = (int) session.getAttribute("sGoodSwitch");
//		session.setAttribute("sGoodSwitch", goodCount*(-1));
	}

}
