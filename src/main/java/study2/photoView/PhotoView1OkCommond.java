package study2.photoView;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import study2.StudyInterface;

public class PhotoView1OkCommond implements StudyInterface {

	@SuppressWarnings("unused")
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/photoView");
		int maxSize = 1024 * 1024 * 20;	// 서버 저장을 위해 한번에 올리는 그림파일의 용량을 20MByte로 한정.
		String encoding = "utf-8";
		
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		// String fName = request.getParameter("fName");
		String orinalFileName = multipartRequest.getOriginalFileName("fName");
		String filesystemName = multipartRequest.getFilesystemName("fName");
		
		request.setAttribute("msg", "서버에 파일이 업로드 되었습니다.");
		request.setAttribute("url", request.getContextPath() + "/PhotoView1.st");
	}

}
