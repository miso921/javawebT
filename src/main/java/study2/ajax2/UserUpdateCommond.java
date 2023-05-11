package study2.ajax2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import study2.StudyInterface;

public class UserUpdateCommond implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		int age = request.getParameter("age")==null ? 0 : Integer.parseInt(request.getParameter("age"));
		String address = request.getParameter("address")==null ? "" : request.getParameter("address");
		
		UserVO vo = new UserVO();
		
		vo.setIdx(idx);
		vo.setMid(mid);
		vo.setName(name);
		vo.setAge(age);
		vo.setAddress(address);
		
		UserDAO dao = new UserDAO();
		
		HttpSession session = request.getSession();
		String tempMid = (String) session.getAttribute("sTempMid");
		int sw = 0;
		String res;
		if(!tempMid.equals(mid)) {
			res = dao.getMidSearch(mid);
			if(res.equals("0")) {
				response.getWriter().write("아이디가 중복되었습니다. 다시 입력하세요.");
				sw = 1;
			}
		}
		if(sw == 0) {
			res = dao.setUserUpdate(vo);
			response.getWriter().write(res);
		}
	}

}
