package admin;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;
import member.MemberVO;

public class AdminMemberDeleteCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		MemberDAO dao = new MemberDAO();
		
		// DB에서 회원 삭제전에 파일을 먼저 지운다.
		MemberVO vo = dao.getIdxSearch(idx);
		String photo = vo.getPhoto();
		if(!photo.equals("noimage.jpg")) {
			String realPath = request.getServletContext().getRealPath("/images/member/");
			File file = new File(realPath + photo);
			if(file.exists()) file.delete();
		}
		
		// 사진 삭제후 DB에서 회원의 정보도 삭제처리한다.
		dao.setMemberDelete(idx);
	}

}
