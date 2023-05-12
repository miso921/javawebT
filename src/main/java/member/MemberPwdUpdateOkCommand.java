package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import conn.SecurityUtil;

public class MemberPwdUpdateOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String mid = (String) session.getAttribute("sMid");
		String oldPwd = request.getParameter("oldPwd")==null ? "" : request.getParameter("oldPwd");
		String newPwd = request.getParameter("newPwd")==null ? "" : request.getParameter("newPwd");
		
		MemberDAO dao = new MemberDAO();
		MemberVO vo = dao.getMemberMidCheck(mid);
		
		SecurityUtil security = new SecurityUtil();
		oldPwd = security.encryptSHA256(vo.getSalt()+oldPwd);
		newPwd = security.encryptSHA256(vo.getSalt()+newPwd);
		
		if(!oldPwd.equals(vo.getPwd())) {
			request.setAttribute("msg", "비밀번호를 확인하세요");
			request.setAttribute("url", request.getContextPath()+"/MemberPwdUpdate.mem");
			return;
		}
		
		int res = dao.setMemberPwdUpdateOk(mid, newPwd);
		
		if(res == 1) {
			request.setAttribute("msg", "비밀번호가 변경 되었습니다.");
			request.setAttribute("url", request.getContextPath()+"/MemberMain.mem");
		}
		else {
			request.setAttribute("msg", "비밀번호 변경 실패~~");
			request.setAttribute("url", request.getContextPath()+"/MemberPwdUpdate.mem");
		}
	}

}
