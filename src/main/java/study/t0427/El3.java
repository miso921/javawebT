package study.t0427;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/t0427/El3")
public class El3 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<El3VO> vos = new ArrayList<>();
		
		El3VO vo = new El3VO();
		
		vo.setName("홍길동");
		vo.setAge(25);
		vo.setGender("남자");
		vo.setJob("학생");
		vo.setAddress("서울");
		vos.add(vo);
		
		vo.setName("김말숙");
		vo.setAge(22);
		vo.setGender("여자");
		vo.setJob("회사원");
		vo.setAddress("청주");
		vos.add(vo);
		
		vo.setName("이기자");
		vo.setAge(35);
		vo.setGender("남자");
		vo.setJob("의사");
		vo.setAddress("제주");
		vos.add(vo);
		
		System.out.println("vos의 자료들...");
		for(int i=0; i<vos.size(); i++) {
			System.out.print("vos["+i+"] : " + vos.get(i).getName() + "/");
			System.out.print("vos["+i+"] : " + vos.get(i).getAge() + "/");
			System.out.print("vos["+i+"] : " + vos.get(i).getGender() + "/");
			System.out.print("vos["+i+"] : " + vos.get(i).getJob() + "/");
			System.out.print("vos["+i+"] : " + vos.get(i).getAddress());
			System.out.println();
		}
		
		request.setAttribute("vos", vos);
		
		String viewPage = "/study/0427/el3Res.jsp";
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
}
