package member;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import conn.SecurityUtil;

public class MemberJoinOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/member");
		int maxSize = 1024 * 1024 * 2;	// 서버에 저장할 최대용량을 2MByte로 한다.(1회 저장)
		String encoding = "UTF-8";

		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
	  // 회원 사진이 업로드 되었는지의 여부 처리? 업로드된 파일이 있으면 서버에 저장된 이름을, 없으면 'noimage.jpg'파일명을 filesystemName변수에 저장시켜준다.
		// String originalFileName = multipartRequest.getOriginalFileName("fName");  // 업로드 시킬때의 업로드 파일명이다.
		String filesystemName = multipartRequest.getFilesystemName("fName");			// 실제 서버에 저장된 파일명.
		// if(filesystemName == null) filesystemName = "noimage.jpg";	
		if(filesystemName == null) filesystemName = multipartRequest.getParameter("photo");	
		
		// 나머지 값들을 모두 multipartRequest객체를 통해서 받아온다.
		String mid = multipartRequest.getParameter("mid")==null ? "" : multipartRequest.getParameter("mid");
		String pwd = multipartRequest.getParameter("pwd")==null ? "" : multipartRequest.getParameter("pwd");
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
		
		MemberVO vo = dao.getMemberMidCheck(mid);
		if(vo.getMid() != null) {
			request.setAttribute("msg", "이미 사용중인 아이디입니다.");
			request.setAttribute("url", request.getContextPath()+"/MemberJoin.mem");
			return;
		}
		
		vo = dao.getMemberMidCheck(nickName);
		if(vo.getNickName() != null) {
			request.setAttribute("msg", "이미 사용중인 닉네임입니다.");
			request.setAttribute("url", request.getContextPath()+"/MemberJoin.mem");
			return;
		}
		
		// 비밀번호 암호화처리(sha256)
		UUID uid = UUID.randomUUID();
		String salt = uid.toString().substring(0,8);
		pwd = salt + pwd;
		
		SecurityUtil security = new SecurityUtil();
		pwd = security.encryptSHA256(pwd);
		
		// 모든 체크가 완료되었다면 회원정보를 vo에 담아서 DB(DAO객체)로 넘겨준다.
		vo = new MemberVO();
		vo.setMid(mid);
		vo.setPwd(pwd);
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
		vo.setSalt(salt);
		
		int res = dao.setMemberJoinOk(vo);
		
		if(res == 1) {
			request.setAttribute("msg", "회원에 가입되셨습니다. \\n다시 로그인해 주세요.");
			request.setAttribute("url", request.getContextPath()+"/MemberLogin.mem");
		}
		else {
			request.setAttribute("msg", "회원가입 실패~~");
			request.setAttribute("url", request.getContextPath()+"/MemberJoin.mem");
		}
	}

}
