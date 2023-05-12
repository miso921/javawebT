package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberMainCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String mid = (String) session.getAttribute("sMid");
		
		MemberDAO dao = new MemberDAO();
		
		MemberVO vo = dao.getMemberMidCheck(mid);
		
		// 레벨을 문자로 처리해서 넘겨준다.
		String strLevel = "";
		if(vo.getLevel() == 0) strLevel = "관리자";
		else if(vo.getLevel() == 1) strLevel = "준회원";
		else if(vo.getLevel() == 2) strLevel = "정회원";
		else if(vo.getLevel() == 3) strLevel = "우수회원";
		else if(vo.getLevel() == 4) strLevel = "운영자";
		
		request.setAttribute("point", vo.getPoint());
		request.setAttribute("todayCnt", vo.getTodayCnt());
		request.setAttribute("visitCnt", vo.getVisitCnt());
		request.setAttribute("strLevel", strLevel);
		request.setAttribute("photo", vo.getPhoto());
		
		// 사용자가 방명록에서 글쓴 회수 가져오기.....
		int guestCnt = dao.getGuestWrite(mid, vo.getName(), vo.getNickName());
		request.setAttribute("guestCnt", guestCnt);
		
		// 사용자가 게시판에서 글쓴 회수 가져오기.....
		int boardCnt = dao.getBoardWrite(mid);
		request.setAttribute("boardCnt", boardCnt);
		
		// 준회원 자동등업처리(방문횟수 10이상 이면서 방명록에 글을 5개 이상 올렸을때는 정회원으로 등업처리한다.)
		if(vo.getLevel()==1 && vo.getVisitCnt()>=10 && guestCnt >= 5) {
			dao.setLevelUpCheck(mid, 2);
			session.setAttribute("sLevel", 2);
			request.setAttribute("strLevel", "정회원");
		}
	}

}
