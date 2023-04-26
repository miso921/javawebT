<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>t3_ApplicationMain.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>Application 연습 메인메뉴</h2>
  <form name="myform" method="post" action="t3_ApplicationSave.jsp">
    <div>
      아이디 :
      <input type="text" name="mid" value="${aMid}" autofocus class="form-control"/>
    </div>
    <div>
      닉네임 :
      <input type="text" name="nickName" value="${aNickName}" class="form-control"/>
    </div>
    <div>
      성명 :
      <input type="text" name="name" value="${aName}" class="form-control"/>
    </div>
    <hr/>
	  <div class="row">
	    <div class="col"><a href="t3_ApplicationSave.jsp" class="btn btn-success form-control">어플리케이션 저장(Get)</a></div>
	    <div class="col"><button type="submit" class="btn btn-success form-control">어플리케이션 저장(Post)</button></div>
	    <!-- <div class="col"><a href="t2_SessionCheck.jsp" class="btn btn-success form-control">세션 확인</a></div> -->
	  </div>
  </form>
</div>
<p><br/></p>
</body>
</html>