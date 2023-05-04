package study2.password;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study2.StudyInterface;
import study2.login.LoginDAO;

public class PassOk1Commond implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd").toUpperCase();
		int idx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
		
		System.out.println("== 원본 자료 ==");
		System.out.println("mid : " + mid);
		System.out.println("pwd : " + pwd);
		System.out.println("idx : " + idx);
		System.out.println();
		
		if(idx == 1) {
			// 숫자만을 암호화 하는 경우
			// 암호화를 위한 키 설정(0x1234ABCD)
			int key = 0x1234ABCD;
			
			int encPwd, decPwd;
			
			// 암호화...(EOR(^) 암호화)
			encPwd = Integer.parseInt(pwd) ^ key;
			
			System.out.println("== 암호화된 비밀번호 ==");
			System.out.println("pwd : " + encPwd);
			System.out.println("~~~~~~~~~DB에 암호화된 비밀번호 저장처리~~~~~~~~~~~");
			System.out.println("암호화된 비밀번호를 DB에 저장시킨후...... 인증을 위해 다시 불러와서 디코딩처리한다.");
			
			decPwd = encPwd ^ key;
			System.out.println("== 복호화된 비밀번호 ==");
			System.out.println("pwd : " + decPwd);
			System.out.println();
		}
		else {
			// 숫자/문자(혼합) 암호화 하는 경우...(영문 소문자 입력시는 대문자로 변경해서 처리)
			System.out.println("1.원본 비밀번호 : " + pwd);
			long intPwd;
			String strPwd = "";
			for(int i=0; i<pwd.length(); i++) {
				intPwd = pwd.charAt(i);
				strPwd += intPwd;
			}
			System.out.println("2.아스키코드문자로 변환된 비밀번호 : " + strPwd);
			
			intPwd = Long.parseLong(strPwd);
			
			long encPwd;
			long key;
			
			// idx가 2일때는 64번행에 지정된 hashKey값으로 암호화처리하고, 4일경우는 DB에 저장된 hashKey값으로 암호화 처리한다.
			if(idx == 2) {
				key = 0x1234ABCD;
			}
			else {
				key = (int)(Math.random()*50)+1;
				System.out.println("선별된 key는 : " + key);
				LoginDAO dao = new LoginDAO();
				key = dao.getHashTableSearch(key);
			}
			
			encPwd = intPwd ^ key;
			strPwd = String.valueOf(encPwd);
			System.out.println("3.인코딩된 비밀번호로 DB에 저장시킬 비밀번호가 된다. : " + strPwd);
			System.out.println("~~~~~~~~~~~~~~DB 저장중...~~~~~~~~~~~~~~~~~~~~~~~~~~~");
			
			// DB에 저장된 암호를 다시 불러와서 복호와(디코딩) 시켜준다.
			long decPwd;
			intPwd = Long.parseLong(strPwd);
			decPwd = intPwd ^ key;
			System.out.println("4.복호화(디코딩)된 비밀번호 : " + decPwd);
			
			// 복원된 비번은 숫자이기에 문자로 변환후 2자리씩(2개) 분리 처리시켜준다.
			strPwd = String.valueOf(decPwd);
			
			char ch;
			String result = "";
			for(int i=0; i<strPwd.length(); i+=2) {
				ch = (char) Integer.parseInt(strPwd.substring(i, i+2));
				result += ch;
			}
			System.out.println("5.최종적으로 복호화된 비밀번호 : " + result);
		}
	}

}
