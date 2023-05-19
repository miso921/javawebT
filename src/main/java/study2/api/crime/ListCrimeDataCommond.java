package study2.api.crime;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study2.StudyInterface;

public class ListCrimeDataCommond implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int year = request.getParameter("year")==null ? 0 : Integer.parseInt(request.getParameter("year"));
		
		CrimeDAO dao = new CrimeDAO();
		
		ArrayList<CrimeVO> vos = dao.getListYear(year);
		
		CrimeVO analyzeVo = dao.getAnalyze(year);
		//System.out.println("analyzeVo : " + analyzeVo);

		request.setAttribute("vos", vos);
		request.setAttribute("year", year);
		request.setAttribute("analyzeVo", analyzeVo);
	}

}
