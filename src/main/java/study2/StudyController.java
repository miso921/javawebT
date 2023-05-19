package study2;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import study2.ajax.Ajax6Commond;
import study2.ajax2.UserDeleteCommond;
import study2.ajax2.UserInputCommond;
import study2.ajax2.UserListCommond;
import study2.ajax2.UserSearchCommond;
import study2.ajax2.UserUpdateCommond;
import study2.api.crime.DeleteCrimeDataCommond;
import study2.api.crime.ListCrimeDataCommond;
import study2.api.crime.PoliceCrimeDataSearchCommond;
import study2.api.crime.SaveCrimeDataCommond;
import study2.calendar.Calendar2Commond;
import study2.calendar.CalendarCommond;
import study2.modal.ModalTest2Commond;
import study2.password.PassOk1Commond;
import study2.password.PassOk2Commond;
import study2.pdstest.DownLoadCommond;
import study2.pdstest.FileDeleteCommond;
import study2.pdstest.FileDownLoadCommond;
import study2.pdstest.FileUpLoad1OkCommond;
import study2.pdstest.FileUpLoad2OkCommond;
import study2.pdstest.FileUpLoad3OkCommond;
import study2.pdstest.FileUpLoad4OkCommond;
import study2.photoView.PhotoView1OkCommond;
import study2.photoView.PhotoView2OkCommond;
import study2.photoView.PhotoViewDeleteAllCommond;
import study2.photoView.PhotoViewDeleteCommond;
import study2.photoView.PhotoViewListCommond;
import study2.uuid.UuidCommond;

@SuppressWarnings("serial")
@WebServlet("*.st")
public class StudyController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StudyInterface command = null;
		String viewPage = "/WEB-INF/study2";
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"),uri.lastIndexOf("."));
		
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel")==null ? 99 : (int) session.getAttribute("sLevel");
				
		if(level > 4) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/");
			dispatcher.forward(request, response);
		}
		else if(com.equals("/Password")) {
			viewPage += "/password/password.jsp";
		}
		else if(com.equals("/PassOk1")){
			command = new PassOk1Commond();
			command.execute(request, response);
			viewPage += "/password/password.jsp";
		}
		else if(com.equals("/PassOk2")){
			command = new PassOk2Commond();
			command.execute(request, response);
			viewPage += "/password/password2.jsp";
		}
		else if(com.equals("/UuidForm")){
			viewPage += "/uuid/uuidForm.jsp";
		}
		else if(com.equals("/Uuid")){
			command = new UuidCommond();
			command.execute(request, response);
			viewPage += "/uuid/uuidOk.jsp";
		}
		else if(com.equals("/AjaxTest1")){
			viewPage += "/ajax/ajaxTest1.jsp";
		}
		else if(com.equals("/Ajax6")){
			command = new Ajax6Commond();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/UserList")){
			command = new UserListCommond();
			command.execute(request, response);
			viewPage += "/ajax2/userList.jsp";
		}
		else if(com.equals("/UserInput")){
			command = new UserInputCommond();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/UserDelete")){
			command = new UserDeleteCommond();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/UserSearch")){
			command = new UserSearchCommond();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/UserUpdate")){
			command = new UserUpdateCommond();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/FileUpLoad1")){
			viewPage += "/pdstest/upLoad1.jsp";
		}
		else if(com.equals("/FileUpLoad1Ok")){
			command = new FileUpLoad1OkCommond();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/FileUpLoad2")){
			viewPage += "/pdstest/upLoad2.jsp";
		}
		else if(com.equals("/FileUpLoad2Ok")){
			command = new FileUpLoad2OkCommond();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/FileUpLoad3")){
			viewPage += "/pdstest/upLoad3.jsp";
		}
		else if(com.equals("/FileUpLoad3Ok")){
			command = new FileUpLoad3OkCommond();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/FileUpLoad4")){
			viewPage += "/pdstest/upLoad4.jsp";
		}
		else if(com.equals("/FileUpLoad4Ok")){
			command = new FileUpLoad4OkCommond();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/DownLoad")){
			command = new DownLoadCommond();
			command.execute(request, response);
			viewPage += "/pdstest/downLoad.jsp";
		}
		else if(com.equals("/FileDownLoad")){
			command = new FileDownLoadCommond();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/FileDelete")){
			command = new FileDeleteCommond();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/ModalTest1")){
			viewPage += "/modal/modalTest1.jsp";
		}
		else if(com.equals("/ModalTest2")){
			command = new ModalTest2Commond();
			command.execute(request, response);
			viewPage += "/modal/modalTest2.jsp";
		}
		else if(com.equals("/Calendar")){
			command = new CalendarCommond();
			command.execute(request, response);
			viewPage += "/calendar/calendar.jsp";
		}
		else if(com.equals("/Calendar2")){
			command = new Calendar2Commond();
			command.execute(request, response);
			viewPage += "/calendar/calendar2.jsp";
		}
		else if(com.equals("/ApiTest")){
			viewPage += "/api/apiTest.jsp";
		}
		else if(com.equals("/CrimeApi")){
			viewPage += "/api/crime/crimeApi.jsp";
		}
		else if(com.equals("/SaveCrimeData")){
			command = new SaveCrimeDataCommond();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/DeleteCrimeData")){
			command = new DeleteCrimeDataCommond();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/ListCrimeData")){
			command = new ListCrimeDataCommond();
			command.execute(request, response);
			viewPage += "/api/crime/crimeApi.jsp";
		}
		else if(com.equals("/PoliceCrimeDataSearch")){
			command = new PoliceCrimeDataSearchCommond();
			command.execute(request, response);
			viewPage += "/api/crime/crimeApi.jsp";
		}
		else if(com.equals("/PhotoView1")){
			viewPage += "/photo/photoView1.jsp";
		}
		else if(com.equals("/PhotoView1Ok")){
			command = new PhotoView1OkCommond();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/PhotoView2")){
			viewPage += "/photo/photoView2.jsp";
		}
		else if(com.equals("/PhotoView2Ok")){
			command = new PhotoView2OkCommond();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/PhotoViewList")){
			command = new PhotoViewListCommond();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/PhotoViewDelete")){
			command = new PhotoViewDeleteCommond();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/PhotoViewDeleteAll")){
			command = new PhotoViewDeleteAllCommond();
			command.execute(request, response);
			return;
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
