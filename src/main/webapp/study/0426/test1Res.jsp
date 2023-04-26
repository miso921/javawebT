<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>test1Res.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>서블릿을 통해서 전달된 값 출력...</h2>
  <p>제목 : ${title}</p>
  <p>내용 : ${content}</p>
  <p><input type="button" value="돌아가기" onclick="location.href='${pageContext.request.contextPath}/study/0426/test1.jsp';" class="btn btn-warning"/></p>
</div>
<p><br/></p>
</body>
</html>