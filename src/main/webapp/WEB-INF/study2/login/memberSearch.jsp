<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/include/memberCheck.jsp" />
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>memberSearch.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <style>
    th {
      background-color: #eee;
      text-align: center;
    }
  </style>
  <script>
    'use strict';
    
    function deleteCheck() {
    	let ans = confirm("정말 탈퇴하시겠습니까?");
    	if(ans) location.href = "${ctp}/DeleteOk.re"; 
    }
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br/></p>
<div class="container">
  <h2>개별 회원 조회</h2>
  <table class="table table-bordered">
    <tr>
      <th>고유번호</th>
      <td>${vo.idx}</td>
    </tr>
    <tr>
      <th>아이디</th>
      <td>${vo.mid}</td>
    </tr>
    <tr>
      <th>비밀번호</th>
      <td>${vo.pwd}</td>
    </tr>
    <tr>
      <th>성명</th>
      <td>${vo.name}</td>
    </tr>
    <tr>
      <th>포인트</th>
      <td>${vo.point}</td>
    </tr>
    <tr>
      <th>최종방문일</th>
      <td>${vo.lastDate}</td>
    </tr>
    <tr>
      <th>오늘방문횟수</th>
      <td>${vo.todayCount}</td>
    </tr>
  </table>
  <br/>
  <p>
    <a href="${ctp}/MemberMain.re" class="btn btn-success mr-3">돌아가기</a>
    <c:if test="${vo.mid == sMid}">
	    <a href="${ctp}/Update.re" class="btn btn-success mr-3">정보수정</a>
	    <a href="javascript:deleteCheck()" class="btn btn-success mr-3">회원탈퇴</a>
    </c:if>
  </p>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>



