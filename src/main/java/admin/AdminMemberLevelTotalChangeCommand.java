package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminMemberLevelTotalChangeCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int level = request.getParameter("level")==null ? 0 : Integer.parseInt(request.getParameter("level"));
		String changeItem = request.getParameter("changeItems")==null ? "" : request.getParameter("changeItems");
		
		String[] changeItems = changeItem.split("/");
		
		AdminDAO dao = new AdminDAO();
		
		for(String item : changeItems) {
			dao.setMemberLevelChange(level, Integer.parseInt(item));
		}
	}

}
