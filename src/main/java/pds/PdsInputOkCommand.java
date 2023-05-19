package pds;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import conn.SecurityUtil;

public class PdsInputOkCommand implements PdsInterface {

	@SuppressWarnings("rawtypes")
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/pds");
		int maxSize = 1024 * 1024 * 30;	// 서버에 저장할 최대용량을 10MByte로 제한한다.(1회저장용량)
		String encoding = "UTF-8";
		
		// 파일 업로드처리.....(객체가 생성되면서 파일이 업로드처리된다.)
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		// 업로드된 파일의 정보를 추출해보자...
		
		Enumeration fileNames = multipartRequest.getFileNames();
		String file = "";
		String originalFileName = "";
		String filesystemName = "";
		
		while(fileNames.hasMoreElements()) {
			file = (String) fileNames.nextElement();
			
			if(multipartRequest.getFilesystemName(file) != null) {
				originalFileName += multipartRequest.getOriginalFileName(file) + "/";
				filesystemName += multipartRequest.getFilesystemName(file) + "/";
			}
		}
		originalFileName = originalFileName.substring(0, originalFileName.length()-1);
		filesystemName = filesystemName.substring(0, filesystemName.length()-1);
		
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		String nickName = (String) session.getAttribute("sNickName");
		
		// 전송된 폼의 값들을 모두 받아준다.
		int fileSize = multipartRequest.getParameter("fileSize")==null ? 0 : Integer.parseInt(multipartRequest.getParameter("fileSize"));
		String title = multipartRequest.getParameter("title")==null ? "" : multipartRequest.getParameter("title");
		String part = multipartRequest.getParameter("part")==null ? "" : multipartRequest.getParameter("part");
		String pwd = multipartRequest.getParameter("pwd")==null ? "" : multipartRequest.getParameter("pwd");
		String openSw = multipartRequest.getParameter("openSw")==null ? "" : multipartRequest.getParameter("openSw");
		String content = multipartRequest.getParameter("content")==null ? "" : multipartRequest.getParameter("content");
		String hostIp = multipartRequest.getParameter("hostIp")==null ? "" : multipartRequest.getParameter("hostIp");
		
		// 비밀번호 암호화(sha-256)
		SecurityUtil security = new SecurityUtil();
		pwd = security.encryptSHA256(pwd);
		
		// 앞에서 전송된 자료와 가공된 자료들을 모두 vo에 담아서 DB에 저장할 수 있게 한다.
		PdsVO vo = new PdsVO();
		vo.setMid(mid);
		vo.setNickName(nickName);
		vo.setfName(originalFileName);
		vo.setfSName(filesystemName);
		vo.setfSize(fileSize);
		vo.setTitle(title);
		vo.setPart(part);
		vo.setPwd(pwd);
		vo.setOpenSw(openSw);
		vo.setContent(content);
		vo.setHostIp(hostIp);
		
		PdsDAO dao = new PdsDAO();
		int res = dao.setPdsInputOk(vo);
		
		if(res == 1) {
			request.setAttribute("msg", "자료실에 자료가 업로드 되었습니다.");
			request.setAttribute("url", request.getContextPath()+"/PdsList.pds");
		}
		else {
			request.setAttribute("msg", "자료실 업로드 실패~~");
			request.setAttribute("url", request.getContextPath()+"/PdsInput.pds");
		}
	}

}
