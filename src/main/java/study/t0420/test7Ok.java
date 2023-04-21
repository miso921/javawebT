package study.t0420;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/t0420/test7Ok")
public class test7Ok extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String name = request.getParameter("name");
		String part = request.getParameter("part");
		String[] products  = request.getParameterValues("product");
		String[] prices  = request.getParameterValues("price");
		String[] sus  = request.getParameterValues("su");
		int[] res = new int[products.length];
		int totPrice = 0;
		
		// 계산 결과를 콘솔에 출력하자
		for(int i=0; i<products.length; i++) {
			res[i] = Integer.parseInt(prices[i]) * Integer.parseInt(sus[i]);
			totPrice += res[i];
			
			System.out.print((i+1) + ".상품명" + products[i] + "\t");
			System.out.print("가격" + prices[i] + "\t");
			System.out.print("수량" + sus[i] + "\t");
			System.out.print("가격" + res[i] + "\n");
		}
		System.out.println("총 가격 합계 : " + totPrice);
		
		PrintWriter out = response.getWriter();
		
		out.print("<script>");
		out.print("alert('작업완료!');");
		out.print("location.href = '"+request.getContextPath()+"/study/0420/test7.jsp';");
		out.print("</script>");
	}
}
