package study2.photoView;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import study2.StudyInterface;

public class PhotoView2OkCommond implements StudyInterface {

	@SuppressWarnings({ "unused", "rawtypes" })
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/photoView");
		int maxSize = 1024 * 1024 * 20;	// 서버 저장을 위해 한번에 올리는 그림파일의 용량을 20MByte로 한정.
		String encoding = "utf-8";
		
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		Enumeration fileNames = multipartRequest.getFileNames();
		String file = "";
		String orinalFileName = "";
		String filesystemName = "";
		
		while(fileNames.hasMoreElements()) {
			file = (String) fileNames.nextElement();
			orinalFileName = multipartRequest.getOriginalFileName(file);
			filesystemName = multipartRequest.getFilesystemName(file);
		}

		if(filesystemName.equals("")) {
			request.setAttribute("msg", "저장된 파일이 존재하지 않습니다.");
		}
		else {
			request.setAttribute("msg", "서버에 파일을 저장했습니다.");
		}
		request.setAttribute("url", request.getContextPath() + "/PhotoView2.st");
	}

}
