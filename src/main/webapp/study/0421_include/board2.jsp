<!-- board.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>board.jsp</title>
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
  	<h2>이곳은 게시판 입니다.</h2>
  	<hr/>
  	<p><img src="../../images/3.jpg" width="600px" /></p>
  	<hr/>
  </div>
</div>
<p><br/></p>
<!-- 푸터(footer)영역 : Copyright/주소/소속/이메일/작성자....등.. -->
<div id="footer">
  <%@ include file="footer.jsp" %>
</div>
</body>
</html>