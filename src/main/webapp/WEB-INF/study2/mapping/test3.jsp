<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>test2.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br/></p>
<div class="container">
  <h2>이곳은 test3.jsp입니다.</h2>
  <p><img src="${ctp}/images/3.jpg" width="300px"/></p>
  <p>
    <a href="${ctp}/mapping/Test1" class="btn btn-primary">test1.jsp로 가기</a>
    <a href="${ctp}/mapping/Test2" class="btn btn-secondary">test2.jsp로 가기</a>
    <a href="${ctp}/mapping/Test4?su1=100&su2=50" class="btn btn-warning">test4.jsp로 가기</a>
  </p>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>