package study2.ajax;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import study2.StudyInterface;

public class Ajax6Commond implements StudyInterface {

	@SuppressWarnings("unchecked")
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		JSONObject jsonObject = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		
		for(int i=1; i<=3; i++) {
			JSONObject data = new JSONObject();
			
			data.put("name", "인간_"+i);
			data.put("age", 10+i);
			data.put("address", "청주 가로수"+i+"길");
			jsonArray.add(data);
		}
		
		jsonObject.put("data", jsonArray);
		System.out.println("jsonObject : " + jsonObject);
		
		response.getWriter().write(jsonObject.toJSONString());
	}

}
