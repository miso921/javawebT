<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  String sw = request.getParameter("sw")==null? "" : request.getParameter("sw"); 
  String member = request.getParameter("member")==null? "" : request.getParameter("member");
  
  if(member.equals("OK")) member = "정회원";
  else member = "비회원";
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>main.jsp</title>
  <%-- <jsp:include page="../../include/bs4.jsp" /> --%>
  <jsp:include page="/include/bs4.jsp" />		<!-- jsp액션태그 안에서의 '/'는 ContextPath명으로 간주된다. -->
</head>
<body>
<!-- 헤더영역(로고/메뉴)를 표시 -->
<div id="header" class="text-center" style="background-color:skyblue">
	<%@ include file="menu.jsp" %>
</div>
<br/>
<div class="container">
  <!-- 본문영역 -->
  <!-- <div id="content" class="text-center" style="height:700px"> -->
  <div id="content" class="text-center">
<%  if(sw.equals("guest")) { %>
  		<%@ include file="guest.jsp" %>
<%  } else if(sw.equals("board")) { %>
			<%@ include file="board.jsp" %>
<%  } else if(sw.equals("pds")) { %>
			<%@ include file="pds.jsp" %>
<%  } else if(sw.equals("schedule")) { %>
			<%@ include file="schedule.jsp" %>
<%  } else if(sw.equals("photo")) { %>
			<%@ include file="photo.jsp" %>
<%  } else if(sw.equals("login")) { %>
			<%@ include file="login.jsp" %>
<%  } else { %>
	  	<h2>이곳은 메인입니다.(<%=member%>)</h2>
	  	<hr/>
	  	<p><img src="../../images/1.jpg" width="600px" /></p>
	  	<hr/>
<%   } %>
  </div>
</div>
<p><br/></p>
<!-- 푸터(footer)영역 : Copyright/주소/소속/이메일/작성자....등.. -->
<div id="footer">
  <%@ include file="footer.jsp" %>
</div>
</body>
</html>