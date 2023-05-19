package study2.photoView;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import study2.StudyInterface;

public class PhotoViewListCommond implements StudyInterface {

	@SuppressWarnings("unchecked")
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/photoView");
		
		String[] files = new File(realPath).list();
		
		// JSON형식으로 변경처리하기..
		// 여러개의 데이터(vos)의 처리는 JSONArray객체를 만들어놓고, 개별자료를 JSONObject객체에 담아서 JSONArray배열객체에 모두 넣은후, 이것을 다시, JSONObject객체에 담아서 문자화시켜서 넘겨주면 된다.
		
		// 여러개의 자료를 JSON객체로 변경하기위해 필요한 객체(JSONObject, JSONArray)를 만들어준다.(준비)
		JSONObject jsonObject = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		
		// 담을 자료의 필요한 개수만큼 반복하면서 개별자료를 모두 JSONObject객체로 변환시켜서담은후, 이것을 JSONArray에 다시 담아준다.
		for(int i=0; i<files.length; i++) {
			JSONObject jso = new JSONObject();
			
			jso.put("key", files[i]);
			jsonArray.add(jso);
		}
		
		jsonObject.put("data", jsonArray);		// 앞에서 JSONObject객체를 담아놓은 JSONArray객체를 다시 JSONObject객체에 담아준다.
		// System.out.println("jsonObject : " + jsonObject);
		response.getWriter().write(jsonObject.toString());		// JSON객체로 변환된것을 문자화시켜서 전송시켜준다.
	}

}
