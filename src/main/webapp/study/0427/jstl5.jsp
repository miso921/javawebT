<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>jstl5.html</title>
  <jsp:include page="/include/bs4.jsp" />
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>2차원 배열값을 출력하기</h2>
<%
  String[][] address = {
  		{"홍길동","서울"},
  		{"김말숙","청주"},
  		{"이기자","울산"},
  		{"소나무","제주"}	
  };
  pageContext.setAttribute("address", address);
%>
  <c:forEach var="temp" items="${address}">
    <c:forEach var="t" items="${temp}" begin="0" end="1">
      ${t} /
    </c:forEach>
    <br/>
  </c:forEach>
</div>
<p><br/></p>
</body>
</html>