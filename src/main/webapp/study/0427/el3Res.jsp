<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>el3Res.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>ArrayList에 등록된 자료 출력하기</h2>
  <p>vos : ${vos}</p>
  <hr/>
  <p>0.vo : ${vos[0]}</p>
  <p>1.vo : ${vos[1]}</p>
  <p>2.vo : ${vos[2]}</p>
  <hr/>
  <p>
    0.vo의 자료들 : ${vos[0].name} / ${vos[0].age} / ${vos[0].gender} / ${vos[0].job} / ${vos[0].address}
  </p>
  <hr/>
  <p><a href="${pageContext.request.contextPath}/t0427/El3" class="btn btn-primary">돌아가기</a></p>
</div>
<p><br/></p>
</body>
</html>