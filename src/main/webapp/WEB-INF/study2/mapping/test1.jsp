<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>test1.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br/></p>
<div class="container">
  <h2>이곳은 /WEB-INF/studt2/mapping/test1.jsp</h2>
  <div>
    <div>두수의 합 : ${hap}</div>
    <div>두수의 합 : ${cha}</div>
  </div>
  <p><img src="${ctp}/images/1.jpg" width="300px"/></p>
  <p>
    <a href="${ctp}/mapping/Test2" class="btn btn-secondary">test2.jsp로 가기</a>
    <a href="${ctp}/mapping/Test3" class="btn btn-success">test3.jsp로 가기</a>
    <a href="${ctp}/mapping/Test4?su1=100&su2=50" class="btn btn-warning">test4.jsp로 가기</a>
  </p>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>