package member;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class MemberUpdateOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/member");
		int maxSize = 1024 * 1024 * 10;	// 서버에 저장할 최대용량을 10MByte로 한다.(1회 저장)
		String encoding = "UTF-8";

		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
	  // 회원 사진이 업로드 되었는지의 여부 처리? 업로드된 파일이 있으면 서버에 저장된 이름을, 없으면 기존파일명을 filesystemName변수에 저장시켜준다.
		String filesystemName = multipartRequest.getFilesystemName("fName");			// 실제 서버에 저장된 파일명.
		if(filesystemName == null) filesystemName = multipartRequest.getParameter("photo");
		else {
			if(!multipartRequest.getParameter("photo").equals("noimage.jpg")) {
				File file = new File(realPath + "/" + multipartRequest.getParameter("photo"));
				if(file.exists()) file.delete();
			}
		}
		
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		String sNickName = (String) session.getAttribute("sNickName");
		
		String nickName = multipartRequest.getParameter("nickName")==null ? "" : multipartRequest.getParameter("nickName");
		String name = multipartRequest.getParameter("name")==null ? "" : multipartRequest.getParameter("name");
		String gender = multipartRequest.getParameter("gender")==null ? "" : multipartRequest.getParameter("gender");
		String birthday = multipartRequest.getParameter("birthday")==null ? "" : multipartRequest.getParameter("birthday");
		String tel = multipartRequest.getParameter("tel")==null ? "" : multipartRequest.getParameter("tel");
		String address = multipartRequest.getParameter("address")==null ? "" : multipartRequest.getParameter("address");
		String email = multipartRequest.getParameter("email")==null ? "" : multipartRequest.getParameter("email");
		String homePage = multipartRequest.getParameter("homePage")==null ? "" : multipartRequest.getParameter("homePage");
		String job = multipartRequest.getParameter("job")==null ? "" : multipartRequest.getParameter("job");
		String content = multipartRequest.getParameter("content")==null ? "" : multipartRequest.getParameter("content");
		String userInfor = multipartRequest.getParameter("userInfor")==null ? "" : multipartRequest.getParameter("userInfor");
		
		// 취미 전송에 대한 처리
		String[] hobbys = multipartRequest.getParameterValues("hobby");
		String hobby = "";
		if(hobbys.length != 0) {
			for(String strHobby : hobbys) {
				hobby += strHobby + "/";
			}
		}
		hobby = hobby.substring(0, hobby.lastIndexOf("/"));
		
		// Back End 체크.....(DB에 저장되는 자료들의 Null값과 길이체크.... 또, 중복여부(아이디,닉네임)체크)
		
		// 아이디와 닉네임 중복체크...
		MemberDAO dao = new MemberDAO();
		
		if(!nickName.equals(sNickName)) {
			String tempNickName = dao.getMemberNickCheck(nickName).getNickName();
			if(tempNickName != null) {
				request.setAttribute("msg", "이미 사용중인 닉네임입니다.");
				request.setAttribute("url", request.getContextPath()+"/MemberUpdate.mem");
				return;
			}
		}
		
		// 모든 체크가 완료되었다면 회원정보를 vo에 담아서 DB(DAO객체)로 넘겨준다.
		MemberVO vo = new MemberVO();
		vo.setMid(mid);
		vo.setNickName(nickName);
		vo.setName(name);
		vo.setGender(gender);
		vo.setBirthday(birthday);
		vo.setTel(tel);
		vo.setAddress(address);
		vo.setEmail(email);
		vo.setHomePage(homePage);
		vo.setJob(job);
		vo.setHobby(hobby);
		vo.setPhoto(filesystemName);
		vo.setContent(content);
		vo.setUserInfor(userInfor);
		
		int res = dao.setMemberUpdateOk(vo);
		
		if(res == 1) {
			session.setAttribute("sNickName", nickName);
			request.setAttribute("msg", "회원정보가 수정되셨습니다.");
			request.setAttribute("url", request.getContextPath()+"/MemberMain.mem");
		}
		else {
			request.setAttribute("msg", "회원정보 수정실패~~");
			request.setAttribute("url", request.getContextPath()+"/MemberUpdate.mem");
		}
	}

}
