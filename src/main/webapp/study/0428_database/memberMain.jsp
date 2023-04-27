<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="/include/memberCheck.jsp" />
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>memberMain.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <script>
    'use strict';
    
    function searchCehck() {
    	let temp = '';
    	temp += '검색할 아이디 : ';
    	temp += '<input type="text" name="mid" id="mid" class="mr-3"/>';
    	temp += '<input type="button" value="아이디검색" onclick="idCheck()" class="btn btn-secondary"/>';
    	
    	demo.innerHTML = temp;
    }
    
    function idCheck() {
    	let mid = document.getElementById("mid").value;
    	location.href = "${ctp}/database/LoginSearch?mid="+mid;
    }
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br/></p>
<div class="container text-center">
  <h2>회원 전용방</h2>
  <br/>
  <p>현재 ${sMid}(${sName})님 로그인 중이십니다.</p>
  <hr/>
  <p>보유 포인트 : ${sPoint} / 최종 접속인 ${fn:substring(sLastDate,0,16)} / 오늘 접속횟수 : ${sTodayCount}회</p>
  <hr/>
  <c:set var="random"><%=(int)(Math.random()*6)+1%></c:set>
  <p><img src="${ctp}/images/${random}.jpg" width="300px"/></p>
  <hr/>
  <div class="row">
    <div class="col"></div>
    <div class="col"><button type="button" onclick="searchCehck()" class="btn btn-primary">개별조회</button></div>
    <div class="col"><a href="${ctp}/database/List" class="btn btn-success">전체조회</a></div>
    <div class="col"><a href="${ctp}/database/Logout" class="btn btn-danger">로그아웃</a></div>
    <div class="col"></div>
  </div>
  <hr/>
  <div id="demo"></div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>