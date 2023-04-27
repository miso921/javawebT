<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 로그인창에 아이디 체크 유무에 대한 처리
	// 쿠키를 검색해서 cMid가 있을때 가져와서 아이디입력창에 뿌릴수 있게 한다.
	Cookie[] cookies = request.getCookies();

  if(cookies != null) {
  	for(int i=0; i<cookies.length; i++) {
  		if(cookies[i].getName().equals("cMid")) {
  			pageContext.setAttribute("mid", cookies[i].getValue());
  			break;
  		}
  	}
  }
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>t7_Login_ex.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <style>
    div {
      margin: 10px;
    }
  </style>
</head>
<body>
<p><br/></p>
<div class="container">
  <form name="myform" method="post" action="<%=request.getContextPath()%>/t0425/T7_LoginOk_ex">
	  <h2>로 그 인</h2>
	  <p>샘플 : admin(1234), hkd1234(1234)</p>
	  <div>
	    아이디
	    <input type="text" name="mid" value="${mid}" class="form-control"/>
	  </div>
	  <div>
	    비밀번호
	    <input type="password" name="pwd" class="form-control"/>
	  </div>
	  <div class="text-center">
	    <input type="submit" value="로그인" class="btn btn-success"/> &nbsp;
	    <input type="reset" value="다시입력" class="btn btn-warning"/> &nbsp; &nbsp; &nbsp;
	    <input type="checkbox" name="idSave" checked /> 아이디 저장
	  </div>
  </form>
</div>
<p><br/></p>
</body>
</html>