package study2.api.crime;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study2.StudyInterface;

public class DeleteCrimeDataCommond implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int year = request.getParameter("year")==null ? 0 : Integer.parseInt(request.getParameter("year"));

		CrimeDAO dao = new CrimeDAO();
		
		String res = dao.getSearchYear(year);
		
		if(res.equals("0")) res = "찾고자 하는 자료가 없습니다.";
		else res = dao.setCrimeDeleteOk(year);
		
		response.getWriter().write(res);
	}

}
