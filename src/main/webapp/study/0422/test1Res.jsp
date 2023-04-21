<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
  String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
  String flag = request.getParameter("flag")==null ? "" : request.getParameter("flag");
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>title</title>
  <jsp:include page="/include/bs4.jsp" />
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>이곳은 관리자 인증후 도착한 화면입니다.</h2>
  <p>아이디 : <%=mid%></p>
  <p>비밀번호 : <%=pwd%></p>
  <hr/>
  <p><a href="test1.jsp" class="btn btn-info">돌아가기</a></p>
  
<% if(flag.equals("insa")) { %>
		 <jsp:forward page="test1ResInsa.jsp">
		   <jsp:param name="mid" value="<%=mid%>" />
		 </jsp:forward>
<% } else if(flag.equals("jaje")){ %>
     <jsp:forward page="test1ResJaje.jsp">
		   <jsp:param name="mid" value="<%=mid%>" />
		 </jsp:forward>
<% } %>
</div>
<p><br/></p>
</body>
</html>