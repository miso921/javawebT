<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="/include/memberCheck.jsp" />
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>memberList.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <script>
    'use strict';
    
    function pageCheck() {
    	let pageSize = document.getElementById("pageSize").value;
    	location.href = "${ctp}/List.re?pag=${pag}&pageSize="+pageSize;
    }
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br/></p>
<div class="container">
  <h2 class="text-center">전 체 회 원 리 스 트</h2>
	<table class="table table-borderless mb-0 p-0">
    <tr>
      <td>
        <select name="pageSize" id="pageSize" onchange="pageCheck()">
          <option <c:if test="${pageSize == 3}">selected</c:if>>3</option>
          <option <c:if test="${pageSize == 5}">selected</c:if>>5</option>
          <option <c:if test="${pageSize == 10}">selected</c:if>>10</option>
          <option <c:if test="${pageSize == 15}">selected</c:if>>15</option>
          <option <c:if test="${pageSize == 20}">selected</c:if>>20</option>
        </select> 건
      </td>
      <td class="text-right">
        <!-- 첫페이지 / 이전페이지 / (현재페이지번호/총페이지수) / 다음페이지 / 마지막페이지 -->
        <c:if test="${pag > 1}">
          <a href="${ctp}/List.re?pageSize=${pageSize}&pag=1" title="첫페이지로">◁◁</a>
          <a href="${ctp}/List.re?pageSize=${pageSize}&pag=${pag-1}" title="이전페이지로">◀</a>
        </c:if>
        ${pag}/${totPage}
        <c:if test="${pag < totPage}">
          <a href="${ctp}/List.re?pageSize=${pageSize}&pag=${pag+1}" title="다음페이지로">▶</a>
          <a href="${ctp}/List.re?pageSize=${pageSize}&pag=${totPage}" title="마지막페이지로">▷▷</a>
        </c:if>
      </td>
    </tr>
  </table>
  <table class="table table-hover text-center">
    <tr class="table-dark text-dark">
      <th>번호</th>
      <th>아이디</th>
      <th>성명</th>
      <c:if test="${sMid == 'admin'}">
	      <th>비밀번호</th>
	      <th>포인트</th>
	      <th>최종방문일</th>
      </c:if>
      <th>오늘방문횟수</th>
    </tr>
    <c:forEach var="vo" items="${vos}" varStatus="st">
	    <tr>
	      <td>${vo.idx}</td>
	      <td>${vo.mid}</td>
	      <td>${vo.name}</td>
	      <c:if test="${sMid == 'admin'}">
		      <td>${vo.pwd}</td>
		      <td>${vo.point}</td>
		      <td>${fn:substring(vo.lastDate,0,16)}</td>
	      </c:if>
	      <td>${vo.todayCount}</td>
	    </tr>
    </c:forEach>
    <tr><td colspan="7" class="m-0 p-0"></td></tr>
  </table>
  <br/>
  <div>
    <a href="${ctp}/MemberMain.re" class="btn btn-success">돌아가기</a>
  </div>
  <br/>
  <!-- 블록페이징처리 -->
  <div class="text-center">
    <c:if test="${pag > 1}">[<a href="${ctp}/List.re?pageSize=${pageSize}&pag=1">첫페이지</a>]</c:if>
    <c:if test="${curBlock > 0}">[<a href="${ctp}/List.re?pageSize=${pageSize}&pag=${(curBlock-1)*blockSize + 1}">이전블록</a>]</c:if>
    <c:forEach var="i" begin="${curBlock*blockSize + 1}" end="${curBlock*blockSize + blockSize}" varStatus="st">
      <c:if test="${i <= totPage && i == pag}">[<font color="red">${i}</font>]</c:if>
      <c:if test="${i <= totPage && i != pag}">[<a href="${ctp}/List.re?pageSize=${pageSize}&pag=${i}">${i}</a>]</c:if>
    </c:forEach>
    <c:if test="${curBlock < lastBlock}">[<a href="${ctp}/List.re?pageSize=${pageSize}&pag=${(curBlock+1)*blockSize + 1}">다음블록</a>]</c:if>
    <c:if test="${pag < totPage}">[<a href="${ctp}/List.re?pageSize=${pageSize}&pag=${totPage}">마지막페이지</a>]</c:if>
  </div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>