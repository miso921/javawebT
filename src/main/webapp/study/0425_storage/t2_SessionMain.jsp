<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>t2_SessionMain.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>세션 연습 메인메뉴</h2>
  <form name="myform" method="post" action="t2_SessionSave.jsp">
    <div>
      아이디 :
      <input type="text" name="mid" value="${sMid}" autofocus class="form-control"/>
    </div>
    <div>
      닉네임 :
      <input type="text" name="nickName" value="${sNickName}" class="form-control"/>
    </div>
    <div>
      성명 :
      <input type="text" name="name" value="${sName}" class="form-control"/>
    </div>
    <div>
      세션 ID : <%=session.getId() %>
    </div>
    <hr/>
	  <div class="row">
	    <div class="col"><a href="t2_SessionSave.jsp" class="btn btn-success form-control">세션 저장1</a></div>
	    <div class="col"><button type="submit" class="btn btn-success form-control">세션 저장2</button></div>
	    <!-- <div class="col"><a href="t2_SessionCheck.jsp" class="btn btn-success form-control">세션 확인</a></div> -->
	    <div class="col"><a href="t2_SessionDelete.jsp" class="btn btn-success form-control">세션 삭제</a></div>
	    <div class="col"><a href="t2_SessionMidDelete.jsp" class="btn btn-success form-control">세션 아이디 삭제</a></div>
	    <div class="col"><a href="t2_SessionGroup.jsp" class="btn btn-success form-control">세션 그룹확인</a></div>
	  </div>
  </form>
</div>
<p><br/></p>
</body>
</html>