<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>jstl2.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>JSTL(Java Standard Tag Library)</h2>
  <h3>반복처리(core라이브러리를 사용... - forEach문)</h3>
  <pre>
    사용법1 : < c : forEach var="변수" begin="초기값" end="최종값" step="증감값" varStatus="매개변수" >
             < /c : forEach >
    사용법2 : < c : forEach var="변수" items="$ {배열/객체명}" varStatus="매개변수" >
             < /c : forEach >
    사용법3 : < c : forTokens var="변수" items="$ {배열/객체명}" delims="구분기호" >
             < /c : forEach >
  </pre>
  <hr/>
  <p>사용예 1-1:<br/>
    <c:forEach var="i" begin="1" end="10" step="1">
      ${i}. 안녕 / 
    </c:forEach>
  </p>
  <p>사용예 1-2:<br/>
    <c:forEach var="i" begin="5" end="10" step="1" varStatus="st">
      ${i} : ${st.index} : ${st.count} : ${st.first} : ${st.last} 안녕 / 
    </c:forEach>
  </p>
  <p>사용예 2-1:<br/>
<%
    String[] cards = {"국민","BC","농협","비자","LG","삼성"};
		pageContext.setAttribute("cards", cards);
%>
    <c:forEach var="card" items="${cards}">
    	${card} / 
    </c:forEach>
  </p>
  <p>사용예 2-2:<br/>
    <c:forEach var="card" items="${cards}" varStatus="st">
    	${st.index}.${card} / 
    	<%-- ${st.count}.${card} / --%> 
    </c:forEach>
  </p>
<%
  String hobbys = "등산/낚시/수영/바둑/영화감상/음악감상";
  pageContext.setAttribute("hobbys", hobbys);
%>
  <p>사용예 3-1:<br/>
    <c:forTokens var="hobby" items="${hobbys}" delims="/">
      ${hobby} :
    </c:forTokens>
  </p>
  <p>사용예 3-2:<br/>
    <c:forTokens var="hobby" items="${hobbys}" delims="/" varStatus="st">
      ${st.count}.${hobby} :
    </c:forTokens>
  </p>
  <hr/>
  <p>문제1: 전송된 취미중에서 '바둑'은 빨강색, '수영'은 파랑색, 나머지는 그대로 출력하시오.<br/>
    <c:forTokens var="hobby" items="${hobbys}" delims="/">
      <c:choose>
        <c:when test="${hobby == '바둑'}"><font color='red'>${hobby}</font></c:when>
        <c:when test="${hobby == '수영'}"><font color='blue'>${hobby}</font></c:when>
        <c:otherwise>${hobby}</c:otherwise>
      </c:choose>
    </c:forTokens>
  </p>
  <hr/>
  <h3>구구단 연습....</h3>
  <c:forEach var="i" begin="1" end="9">
    7 * ${i} = ${7 * i}<br/>
  </c:forEach>
  <hr/>
  <h3>이중 forEach문을 활용한 구구단</h3>
  <c:forEach var="dan" begin="2" end="7">
    ${dan}단<br/>
    <c:forEach var="j" begin="1" end="9">
      ${dan} * ${j} = ${dan * j}<br/>
    </c:forEach>
    <br/>
  </c:forEach>
  <hr/>
  <h3>그림 6장을 1줄에 3장씩 찍어보자</h3>
  <c:forEach var="i" begin="1" end="6">
    <img src="${pageContext.request.contextPath}/images/${i}.jpg" width="100px"> &nbsp;
    <c:if test="${i == 3}"><br/><br/></c:if>
  </c:forEach>
  <hr/>
  <h3>그림 6장을 1줄에 3장씩 찍어보자(이중for문)</h3>
  <c:set var="cnt" value="0" />
  <c:forEach var="i" begin="1" end="2">
    <c:forEach var="j" begin="1" end="3">
      <c:set var="cnt" value="${cnt + 1}"/>
    	<img src="${pageContext.request.contextPath}/images/${cnt}.jpg" width="100px"> &nbsp;
    </c:forEach>
    <br/><br/>
  </c:forEach>
  <p>작업끝~~~~~<br/></p>
</div>
<p><br/></p>
</body>
</html>







