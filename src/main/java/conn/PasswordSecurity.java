package conn;

import study2.login.LoginDAO;

public class PasswordSecurity {
	
	public String passwordEncryption(String pwd, int randomKey) {
		// EOR을 이용한 비밀번호 암호화처리.
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
		
		//int randomKey = (int)(Math.random()*50)+1;
		System.out.println("선별된 randomkey는 : " + randomKey);
		
		// DB에 저장시켜놓은 hashTable에서 보내준 키에 따른 키값을 가져오고 있다.
		LoginDAO dao = new LoginDAO();
		key = dao.getHashTableSearch(randomKey);
		
		encPwd = intPwd ^ key;
		strPwd = String.valueOf(encPwd);
		System.out.println("3.인코딩된 비밀번호로 DB에 저장시킬 비밀번호가 된다. : " + strPwd);

		// 아래는 확인차 수행시켜봤다.....(34~51번행)
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
		
		return strPwd;
	}
	
}
