package study.t0427;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/t0427/Jstl_Ex2_2Ok")
public class Jstl_Ex2_2Ok extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String picture = request.getParameter("pictureArray");
		String pictureName = request.getParameter("pictureNameArray")==null ? "" : request.getParameter("pictureNameArray");
		
		if(pictureName.equals("")) {
			//request.getRequestDispatcher("/study/0427/jstl_Ex2_2.jsp").forward(request, response);
			response.sendRedirect(request.getContextPath()+"/study/0427/jstl_Ex2_2.jsp");
			return;
		}
		
		String[] pictureArray = picture.split(",");
		String[] pictureNameArray = pictureName.split(",");
		
		ArrayList<Jstl_Ex2_2VO> vos = new ArrayList<>();
		Jstl_Ex2_2VO vo = null;
		
		for(int i=0; i<pictureArray.length; i++) {
			vo = new Jstl_Ex2_2VO();
			
			vo.setPicture(pictureArray[i]);
			vo.setPictureName(pictureNameArray[i]);
			
			vos.add(vo);
		}
		request.setAttribute("vos", vos);
		
		String viewPage = "/study/0427/jstl_Ex2_2Res.jsp";
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
}
