<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>el1.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>EL(Expression Language)</h2>
  <p>저장소에 기록되어 있는 자료에 대한 처리를 담당한다.</p>
  <pre>
    용도 : 사용자가 '값/변수/수식/객체'등을 전송받은후에 저장 또는 처리하는 용도로 사용
    표기법 : $ {값/변수/수식/객체/제어문}
    저장소 : request / pageContext / session / application
  </pre>
  <hr/>
<%
  String atom = "Seoul";
  String name = "홍길동";
  int su1 = 100, su2 = 200;
%>
  <h4>스크립틀릿을 이용하는 방법과 EL 방법의 비교</h4>
  <div>스크립틀릿방법</div>
  atom = <%=atom %><br/>
  name = <%=name %><br/>
  su1 = <%=su1%><br/>
  su2 = <%=su2%><br/>
  <br/>
<%
  pageContext.setAttribute("atom", atom);
  pageContext.setAttribute("name", name);
  pageContext.setAttribute("su1", su1);
  pageContext.setAttribute("su2", su2);
%>
  <div>EL 방법</div>
		atom = ${atom}<br/>
	  name = ${name}<br/>
	  su1 = ${su1}<br/>
	  su2 = ${su2}<br/>
  <hr/>
  <h4>파라메터를 통해서 넘어온 값의 처리</h4>
  <div>From태그의 get/post 방식으로의 전송이나, url(주소?변수명1=값1&변수명2=값2)을 통한 get방식의 모든 전송값들의 처리</div>
  mbc = ${param.mbc}<br/>
  kbs = ${param.kbs}<br/>
  <hr/>
<%
  String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
	pageContext.setAttribute("mid", mid);
%>
  <form>
    <div>
      아이디 : <input type="text" name="mid" value="${mid}" />
      <input type="submit" value="전송" class="btn btn-success" />
    </div>
  </form>
</div>
<p><br/></p>
</body>
</html>





