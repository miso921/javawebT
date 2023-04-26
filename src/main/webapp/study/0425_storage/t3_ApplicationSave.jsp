<!-- t3_ApplicationSave.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  String mid = request.getParameter("mid")==null ? "admin" : request.getParameter("mid");
  String nickName = request.getParameter("nickName")==null ? "관리맨" : request.getParameter("nickName");
  String name = request.getParameter("name")==null ? "관리자" : request.getParameter("name");
  
  System.out.println("mid : " + mid);
  
  application.setAttribute("aMid", mid);
  application.setAttribute("aNickName", nickName);
  application.setAttribute("aName", name);
%>
<script>
  alert("어플리케이션에 저장 완료!!! 세션값 : ${aMid}");
  location.href = "t3_ApplicationMain.jsp";
</script>