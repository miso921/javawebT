package reservation;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ReservationInforInputOkCommand implements ReservationInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/reservation");
		int maxSize = 1024 * 1024 * 10;	// 서버에 저장할 최대용량을 10MByte로 제한한다.(1회저장용량)
		String encoding = "UTF-8";
		
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		// 업로드된 파일의 정보를 추출해보자...
		String filesystemName = multipartRequest.getFilesystemName("photo");
		
		String title = multipartRequest.getParameter("title")==null ? "" : multipartRequest.getParameter("title");
		String content = multipartRequest.getParameter("content")==null ? "" : multipartRequest.getParameter("content");
		int totalNum = multipartRequest.getParameter("totalNum")==null ? 20 : Integer.parseInt(multipartRequest.getParameter("totalNum"));
		String progressle = multipartRequest.getParameter("progress")==null ? "" : multipartRequest.getParameter("progress");
		String startDate = multipartRequest.getParameter("startDate")==null ? "" : multipartRequest.getParameter("startDate");
		String endDate = multipartRequest.getParameter("endDate")==null ? "" : multipartRequest.getParameter("endDate");
		String popup = multipartRequest.getParameter("popup")==null ? "" : multipartRequest.getParameter("popup");
		
		ReservationInforVO vo = new ReservationInforVO();
		
		vo.setTitle(title);
		vo.setContent(content);
		vo.setTotalNum(totalNum);
		vo.setProgress(progressle);
		vo.setStartDate(startDate);
		vo.setEndDate(endDate);
		vo.setPopup(popup);
		vo.setPhoto(filesystemName);
		
		ReservationDAO dao = new ReservationDAO();
		
		int res = dao.setReservationInputOk(vo);
		
		if(res == 1) {
			request.setAttribute("msg", "예약정보가 등록되었습니다.");
			request.setAttribute("url", request.getContextPath()+"/AdminReservationList.res");
		}
		else {
			request.setAttribute("msg", "예약정보가 등록실패~~");
			request.setAttribute("url", request.getContextPath()+"/AdminReservationInforInput.res");			
		}
	}

}
