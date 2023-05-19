package study2.modal;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;
import member.MemberVO;
import study2.StudyInterface;

public class ModalTest2Commond implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDAO dao = new MemberDAO();
		
		MemberVO vo = dao.getMemberMidCheck("admin");
		
		request.setAttribute("vo", vo);
	}

}
