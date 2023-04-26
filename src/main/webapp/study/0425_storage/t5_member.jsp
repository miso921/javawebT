<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  String mid = session.getAttribute("sMid")==null ? "" : (String) session.getAttribute("sMid");
  if(mid.equals("")) {
  	out.print("<script>");
  	out.print("alert('로그인후 사용하세요.');");
  	out.print("location.href='"+request.getContextPath()+"/study/0425_storage/t5_Login.jsp';");
  	out.print("</script>");
  }
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>t5_member.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>이곳은 회원방입니다.</h2>
  <hr/>
  ${sMid}님 로그인 중이십니다.
  <hr/>
  <p><a href="<%=request.getContextPath()%>/t0424/T5_LoginOut" class="btn btn-danger">로그아웃</a></p>
</div>
<p><br/></p>
</body>
</html>