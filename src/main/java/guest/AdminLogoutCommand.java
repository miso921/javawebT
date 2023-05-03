package guest;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AdminLogoutCommand implements GuestInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		session.removeAttribute("sAdmin");
		
		request.setAttribute("msg", "관리자 로그아웃처리 되었습니다.");
		request.setAttribute("url", request.getContextPath()+"/GuestList.gu");
	}

}
