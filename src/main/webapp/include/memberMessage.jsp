<%@page import="member.MemberChatVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
  request.setCharacterEncoding("utf-8");
  MemberDAO dao = new MemberDAO();
  ArrayList<MemberChatVO> vos = dao.getMemberMessage();
  pageContext.setAttribute("vos", vos);
%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>memberMessage.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <script>
    setTimeout("location.reload()", 1000*10);		// 10초에 한번식 Refresh 한다.
    
    $(document).ready(function(){
    	document.body.scrollIntoView(false);	// 스크롤바를 강제로 Body태그의 마지막으로 위치시켜준다.
    });
  </script>
</head>
<body>
<div class="container mt-2">
	<c:forEach var="vo" items="${vos}" varStatus="st">
	  <c:if test="${sNickName == vo.nickName}"><font color="bule">${vo.nickName} : ${vo.chat}</font></c:if>
	  <c:if test="${sNickName != vo.nickName}"> ${vo.nickName} : ${vo.chat}</c:if><br/>
	</c:forEach>
</div>
</body>
</html>