package pds;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PdsTotalDownCommand implements PdsInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
		
		PdsDAO dao = new PdsDAO();
		PdsVO vo = dao.getIdxSearch(idx);
		
		String[] fNames = vo.getfName().split("/");
		String[] fSNames = vo.getfSName().split("/");
		
		// 파일 압축에 필요한 객체들.....선언....준비....
		FileInputStream fis = null;
		FileOutputStream fos = null;
		ZipOutputStream zos = null;
		ServletOutputStream sos = null;
		
		String realPath = request.getServletContext().getRealPath("/images/pds/");
		String zipPath = request.getServletContext().getRealPath("/images/pds/temp/");
		String zipName = vo.getTitle() + ".zip";
		
		fos = new FileOutputStream(zipPath + zipName);
		zos = new ZipOutputStream(fos);
		
		byte[] b = new byte[2048];
		int data = 0;
		
		for(int i=0; i<fNames.length; i++) {
			File file = new File(realPath + fSNames[i]);
			
			fis = new FileInputStream(file);
			zos.putNextEntry(new ZipEntry(fNames[i]));			
		
		  while((data = fis.read(b, 0, b.length)) != -1) {
		  	zos.write(b, 0, data);
		  }
		  zos.flush();
		  zos.closeEntry();
		  fis.close();
		}
		zos.close();
	
		// 서버에서 압축작업이 완료되면, 압축파일을 클라이언트로 전송하고, 서버에 존재하는 압축화일을 삭제한다.
		/* 프로토콜형식에 맞도록 헤더에 정보를 제공해 준다. */
		String mimeType = request.getServletContext().getMimeType(zipName.toString());
		if(mimeType == null) {
			response.setContentType("application/octet-stream");	// 2진 바이너리형식
		}
		
		// 사용하는 브라우저에 대한 정보 : 만약 인터넷익스플로러(IE)에서는 인코딩방식을 'euc-kr'로, 나머지는 'utf-8'로 전송처리한다.
		String downLoadName = "";
		if(request.getHeader("user-agent").indexOf("MSIE") == -1) {
			downLoadName = new String(zipName.getBytes("UTF-8"), "8859_1");
		}
		else {
			downLoadName = new String(zipName.getBytes("EUC-KR"), "8859_1");
		}
		
		// 헤더 정보를 첨부하여 클라이언트에 전송할 준비를 한다.
		response.setHeader("Content-Disposition", "attachment;filename="+downLoadName);
		
		// Java에 의해서 실제로 파일을 다운(업)로드 처리시켜준다.(FileInputStream/FileOutputStream/ServletOutputStream)
		fis = new FileInputStream(zipPath + zipName);
		sos = response.getOutputStream();
		
		// 전송할 객체를 생성한후에는 실제로 파일을 객체에 Byte단위로 담아서 처리시켜준다.
		while((data = fis.read(b, 0, b.length)) != -1) {
			sos.write(b, 0, data);
		}
		sos.flush();
		// 여기까지가 다운로드가 완료된다. 이후 사용된 객체를 모두 반납한다.
		
		sos.close();
		fis.close();
		// 이곳까지가 클라이언트로 전송완료됨....
		
		// 서버에 존재하는 zip파일을 삭제처리한다.
		new File(zipPath + zipName).delete();
		
		// 다운로드횟수를 증가....
		dao.setPdsDownNumCheck(idx);
	}
}
