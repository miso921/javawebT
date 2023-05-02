<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
  String content = request.getParameter("content")==null ? "" : request.getParameter("content");
  String searchString = request.getParameter("searchString")==null ? "" : request.getParameter("searchString");
	pageContext.setAttribute("content", content);
	pageContext.setAttribute("contentReal", content);
	pageContext.setAttribute("searchString", searchString);
%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>jstl3.jpg</title>
  <jsp:include page="/include/bs4.jsp" />
  <style>
    div {margin: 10px;}
  </style>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>특정문자값 3번째위치 검색하기</h2>
  <pre>
    -숙제1-
	String atom = "Welcome to My Homepage!";
	① 찾고자 하는 문자를 입력받는다.
	② '찾고자하는 문자'가 atom변수에서 포함된 3번째 위치를 찾아서 출력하시오.(출력시는 검색한 위치값을 모두 출력할것)
	단, 찾고자 하는 문자가 없다면 '검색문자 없음'이라고 출력하시오. 3번째문자까지를 모두 검색하였다면 더이상 수행하지 않도록 프로그램을 제작하시오.
  </pre>
  <form>
    문장 :
    <textarea name="content" rows="3" class="form-control" required>${content}</textarea>
    <div>
	    <input type="text" name="searchString" value="o" />
	    <input type="submit" value="3번째문자 검색" class="btn-btn-success"/>
    </div>
    <hr/>
    <!-- el에서의 empty연산자는 null과 공백을 같은것으로본다. 즉 null이나 공백이면 true으로 처리됨. null이나 공백이 아닌것을 참으로 처리하려면 !empty 를 이용한다. -->
    <c:if test="${!empty content && !empty searchString}">
      <c:set var="strCnt" value="${fn:split(content,'o')}"/>
      <c:set var="position" value="0"/>
      <c:set var="cnt" value="0"/>
      <c:forEach var="i" begin="0" end="${fn:length(strCnt)-1}">
	      <c:if test="${fn:indexOf(content,'o') ne -1 && i < 3}">
		      <c:set var="pos" value="${fn:indexOf(content,'o')}"/>
		    	<c:set var="position" value="${position + (pos + 1)}"/>
		    	<c:set var="cnt" value="${cnt + 1}"/>
		    	<%-- <c:set var="str1" value="${fn:substring(content,fn:indexOf(content,'o')+1,fn:length(content))}"/> --%>
		    	<c:set var="content" value="${fn:substringAfter(content,'o')}"/>
		    	- ${i+1}번째 ${searchString}문자의 위치? <font color='red'><b>${position}</b></font> 번째<br/>
	    	</c:if>
    	</c:forEach>
    	<br/>
      입력된 문자 : ${contentReal}<br/>
      찾고자 하는 문자 : ${searchString}<br/>
      '${searchString}'문자가 입력된 3번째 위치 :
      <c:if test="${cnt >= 3}"><font color="red"><b>${position}</b></font> 번째</c:if>
      <c:if test="${cnt < 3}"><font color="red"><b>3까지 존재하지 않습니다.</b></font></c:if>
    </c:if>
  </form>
</div>
<p><br/></p>
</body>
</html>














