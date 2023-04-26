<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>form2.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
</head>
<body>
<p><br/></p>
<div class="container">
  <form name="myform" method="post" action="${pageContext.request.contextPath}/0427/el2Ok">
    <h2>자료 전송 연습</h2>
    <div>성명 : <input type="text" name="name" value="홍길동" class="form-control"/></div>
    <div>취미 : 
      <input type="checkbox" name="hobby" value="등산" checked />등산
      <input type="checkbox" name="hobby" value="낚시" />낚시
      <input type="checkbox" name="hobby" value="수영" />수영
      <input type="checkbox" name="hobby" value="바둑" />바둑
      <input type="checkbox" name="hobby" value="승마" />승마
      <input type="checkbox" name="hobby" value="독서" />독서
    </div>
    <input type="submit" value="전송" class="btn btn-success"/>
  </form>
</div>
<p><br/></p>
</body>
</html>