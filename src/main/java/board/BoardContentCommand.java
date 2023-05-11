package board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BoardContentCommand implements BoardInterface {

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
		int pag = request.getParameter("pag")==null ? 0 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize")==null ? 0 : Integer.parseInt(request.getParameter("pageSize"));
		String flag = request.getParameter("flag")==null ? "" : request.getParameter("flag");
		String search = request.getParameter("search")==null ? "" : request.getParameter("search");
		String searchString = request.getParameter("searchString")==null ? "" : request.getParameter("searchString");
		
		BoardDAO dao = new BoardDAO();
		
		// 글 조회수 1회 증가시키기(조회수 중복방지처리 - 세션사용 : "'board'+고유번호" 값을 객체배열(ArrayList)에 추가시킨다.)
		HttpSession session = request.getSession();
		ArrayList<String> contentIdx = (ArrayList) session.getAttribute("sContentIdx");
		if(contentIdx == null) {
			contentIdx = new ArrayList<String>();
		}
		String imsiContentIdx = "board" + idx;
		if(!contentIdx.contains(imsiContentIdx)) {
			dao.setReadNumUpdate(idx);
			contentIdx.add(imsiContentIdx);
		}
		session.setAttribute("sContentIdx", contentIdx);
		
		// 현재 선택된 게시글(idx)의 전체내용물을 가져오기
		BoardVO vo = dao.getBoardContent(idx);
		
		request.setAttribute("vo", vo);
		request.setAttribute("pag", pag);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("flag", flag);
		request.setAttribute("search", search);
		request.setAttribute("searchString", searchString);
		
		// 이전글과 다음글 처리
		BoardVO preVo = dao.getPreNextSearch(idx, "preVo");
		BoardVO nextVo = dao.getPreNextSearch(idx, "nextVo");
		request.setAttribute("preVo", preVo);
		request.setAttribute("nextVo", nextVo);
		
  	// 해당글에 좋아요 버튼을 클릭하였었다면 '좋아요세션'에 아이디를 저장시켜두었기에 찾아서 있다면 sSw값을 1로 보내어 하트색을 빨강색으로 변경유지하게한다.
		ArrayList<String> goodIdx = (ArrayList) session.getAttribute("sGoodIdx");
		if(goodIdx == null) {
			goodIdx = new ArrayList<String>();
		}
		String imsiGoodIdx = "boardGood" + idx;
		if(goodIdx.contains(imsiGoodIdx)) {
			session.setAttribute("sSw", "1");		// 로그인 사용자가 이미 좋아요를 클릭한 게시글이라면 빨강색으로 표시가히위해 sSw에 1을 전송하고 있다.
		}
		else {
			session.setAttribute("sSw", "0");
		}
		
		// 현재 부모글에 따려있는 댓글 가져오기.
		ArrayList<BoardReplyVO> replyVos = dao.getBoardReply(idx);
		request.setAttribute("replyVos", replyVos);
		
		
		
		// 좋아요 토글처리에 대한 부분....(처음들어온글이면 세션변수 sGoodSwitch에 -1을 주므로서, 초기 값이 👍 로 나올 수 있게 처리한다. 그후는 'BoGoodPlusMinusCommand'객체에서 '+1/-1' 로 토글처리했다.
		/*
		ArrayList<String> goodSwitchCheck = (ArrayList) session.getAttribute("sGoodSwitchCheck");
		if(goodSwitchCheck == null) {
			goodSwitchCheck = new ArrayList<String>();
		}
		String imsiGoodSwitchCheck = "boardGoodSwitchCheck" + idx;
		if(goodSwitchCheck.contains(imsiGoodSwitchCheck)) {		// 들어갔었던 게시글이면 세션의 값(sGoodSwitch)을 가져와서 셋팅시킨다.
			int goodCount = (int) session.getAttribute("sGoodSwitch");
			session.setAttribute("sGoodSwitch", goodCount);
		}
		else {
			goodSwitchCheck.add(imsiGoodSwitchCheck);
			session.setAttribute("sGoodSwitch", -1);	// 처음들어가는 글은 -1로 주어서 👍 로 나올 수 있게 처리한다.
		}
		session.setAttribute("sGoodSwitchCheck", goodSwitchCheck);
		*/
		/*
		ArrayList<String> goodSwitchCheck = (ArrayList) session.getAttribute("sGoodSwitchCheck");
		if(goodSwitchCheck == null) {
			goodSwitchCheck = new ArrayList<String>();
		}
		String imsiGoodSwitchCheck = "boardGoodSwitchCheck" + idx;
		if(goodSwitchCheck.contains(imsiGoodSwitchCheck)) {
			int loc = goodSwitchCheck.indexOf(imsiGoodSwitchCheck);
			goodSwitchCheck.remove(loc);
			session.setAttribute("sGoodSwitchCheck", goodSwitchCheck);
			session.setAttribute("sGoodSwitch", -1);
		}
		else {
			goodSwitchCheck.add(imsiGoodSwitchCheck);
			session.setAttribute("sGoodSwitchCheck", goodSwitchCheck);
			session.setAttribute("sGoodSwitch", 1);	// 처음들어가는 글은 -1로 주어서 👍 로 나올 수 있게 처리한다.
		}
		*/
		
	}

}
