<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 스크릿틀릿 대신에 jstl을 사용한다. -->
<!-- 앞에서 전송된 값들을 vo객체에 담아보자.... -->
<!-- jsp에서 객체를 사용하기위해선 해당 객체를 jsp액션태그(useBean)을 사용해서 생성해야 한다.  -->
<jsp:useBean id="vo" class="study.t0424.Test1VO" />

<!-- 서블릿에서는 getter()와 setter()을 이용해서 값을 불러오거나 저장시켜준다. -->
<!-- jsp에서는 getProperty와 setProperty을 이용해서 값을 불러오거나 저장시켜준다. -->


<!DOCTYPE html>
<html>
<head>
	<jsp:setProperty property="name" name="vo"/>
	<jsp:setProperty property="age" name="vo" value="25"/>
	<jsp:setProperty property="gender" name="vo"/>
	<jsp:setProperty property="job" name="vo"/>
	<jsp:setProperty property="address" name="vo"/>
  <meta charset="UTF-8">
  <title>test2Ok4.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
</head>
<body>
<p><br/></p>
<div class="container">
  <h3>처리된 자료를 view에 출력시켜본다.</h3>
  <div>
    <table class="table table-bordered">
      <tr>
        <th>성명</th>
        <td>${name} / <jsp:getProperty property="name" name="vo"/></td>
      </tr>
      <tr>
        <th>나이</th>
        <%-- <td><c:out value="${name}" /></td> --%>
        <td>${age + 1} / <jsp:getProperty property="age" name="vo"/></td>
      </tr>
      <tr>
        <th>성별</th>
        <td>${gender} / <jsp:getProperty property="gender" name="vo"/></td>
      </tr>
      <tr>
        <th>직업</th>
        <td>${job} / <jsp:getProperty property="job" name="vo"/></td>
      </tr>
      <tr>
        <th>주소</th>
        <td>${address} / <jsp:getProperty property="address" name="vo"/></td>
      </tr>
    </table>
    <p>
      <%-- <a href="<%=request.getContextPath()%>/study/0424/test1.jsp" class="btn btn-warning">돌아가기</a> --%>
      <a href="test2.jsp" class="btn btn-warning">돌아가기</a>
    </p>
  </div>
</div>
<p><br/></p>
</body>
</html>