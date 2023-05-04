package study2.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import conn.PasswordSecurity;

public class UpdateOkCommand implements LoginInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String mid = (String) session.getAttribute("sMid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd").toUpperCase();
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");

		// 넘어온 비밀번호가 저장된 비밀번호와 같지않으면 비밀번호를 다시 암호화해서 저장시켜준다.
		LoginDAO dao = new LoginDAO();
		
		LoginVO vo2 = dao.getMidCheck(mid);
		
		if(!pwd.equals(vo2.getPwd())) {
			// 비밀번호를 변경했다면, 비밀번호를 다시 암호화해서 돌려받기
			int hashKeyCount = dao.getHashKeyCount();
			
			int randomKey = (int)(Math.random()*hashKeyCount)+1;
			
			PasswordSecurity passwordSecurity = new PasswordSecurity();
			pwd = passwordSecurity.passwordEncryption(pwd, randomKey);
			// 키와 키값을 조합해서 pwd를 다시 만들었다.
			pwd = randomKey + "_" + pwd;
		}
		
		LoginVO vo = new LoginVO();
		
		vo.setMid(mid);
		vo.setPwd(pwd);
		vo.setName(name);
		
		int res = dao.setUpdateOk(vo);
		
		if(res == 1) {
			session.setAttribute("sName", name);
			request.setAttribute("msg", "개인정보가 수정되었습니다.");
		}
		else {
			request.setAttribute("msg", "개인정보가 수정 실패~~~");
		}
		request.setAttribute("url", request.getContextPath()+"/MemberMain.re");
	}

}
