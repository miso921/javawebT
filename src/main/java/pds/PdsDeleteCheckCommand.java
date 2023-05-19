package pds;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import conn.SecurityUtil;

public class PdsDeleteCheckCommand implements PdsInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		String fSName_ = request.getParameter("fSName")==null ? "" : request.getParameter("fSName");
		String[] fSNames = fSName_.split("/");
		
		// 암호화된 비밀번호와 일치할 경우에 삭제처리한다.
		SecurityUtil security = new SecurityUtil();
		pwd = security.encryptSHA256(pwd);
		
		PdsDAO dao = new PdsDAO();
		
		PdsVO vo = dao.getIdxSearch(idx);
		
		String res = "0";
		if(vo.getPwd().equals(pwd)) {
			// 서버에 저장된 파일을 삭제처리한다.
			String realPath = request.getServletContext().getRealPath("/images/pds/");
			for(String fSName : fSNames) {
				/*
				File file = new File(realPath+fSName);
				file.delete();
				*/
				new File(realPath+fSName).delete();
			}
			
			// 파일 삭제후 삭제된 자료를 DB에서 찾아서 삭제처리한다.
			res = dao.setPdsDelete(idx);
		}
		response.getWriter().write(res);
	}

}
