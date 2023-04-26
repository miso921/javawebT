<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>t_initRes.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>이곳은 init(Servlet)에서 보낸 값을 찍어봅니다.</h2>
  <p>
    부서명 : ${logoName}<br/>
    홈페이지주소 : ${homeAddress}
  </p>
</div>
<p><br/></p>
</body>
</html>