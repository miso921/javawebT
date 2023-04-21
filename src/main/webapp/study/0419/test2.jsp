<!-- 지시자(디렉티브(directive)) -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>test2.jsp</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script> -->
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>JSP 문법</h2>
  <%-- JSP 주석 --%>
  <%
  	// 스크립틀릿(자바코드를 작성하는 영역)
  	/*
  	  자바에서 여러줄 주석처리
  	*/
  	
  	System.out.println("이곳은 jsp파일 안입니다.");
  
    out.println("<font color='red'>이곳은 JSP안에서의 html코드 입니다.</font>");
  %>
  <hr/>
  <%="안녕하세요. 이곳은 <b>표현식(Expression)</b> 내부입니다." %>
</div>
<p><br/></p>
</body>
</html>