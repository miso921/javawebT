<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>test5_5.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br/></p>
<div class="container">
  <h2>이곳은 test5_5.jsp</h2>
  <hr/>
  <p><img src="${ctp}/images/6.jpg" width="350px"/></p>
  <p>
    <a href="${ctp}/mapping/Test5.mi" class="btn btn-success">test5호출</a>
    <a href="${ctp}/mapping/Test5_2.mi" class="btn btn-primary">test5_2호출</a>
    <a href="${ctp}/mapping/Test5_3.mi" class="btn btn-secondary">test5_3호출</a>
    <a href="${ctp}/mapping/Test5_4.mi" class="btn btn-danger">test5_4호출</a>
  </p>
  <hr/>
  <div>
    <h4>연산결과</h4>
    <div>${su1} ${op} ${su2} = ${res}</div>
  </div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>