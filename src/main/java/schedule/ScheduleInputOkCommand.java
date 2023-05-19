package schedule;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ScheduleInputOkCommand implements ScheduleInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String ymd = request.getParameter("ymd")==null ? "" : request.getParameter("ymd");
		String part = request.getParameter("part")==null ? "" : request.getParameter("part");
		String content = request.getParameter("content")==null ? "" : request.getParameter("content");
		
		ScheduleVO vo = new ScheduleVO();
		vo.setMid(mid);
		vo.setsDate(ymd);
		vo.setPart(part);
		vo.setContent(content);
		
		ScheduleDAO dao = new ScheduleDAO();
		
		String res = dao.setScheduleInputOk(vo);
		
		response.getWriter().write(res);
	}

}
