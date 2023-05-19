package study2.photoView;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study2.StudyInterface;

public class PhotoViewDeleteAllCommond implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] delItems = request.getParameter("delItems").split("/");
		
		String realPath = request.getServletContext().getRealPath("/images/photoView/");
		
		String res = "0";
		for(String item : delItems) {
			File file = new File(realPath + item);
			
			if(file.exists()) {
				file.delete();
				res = "1";
			}
		}
		
		response.getWriter().write(res);
	}

}
