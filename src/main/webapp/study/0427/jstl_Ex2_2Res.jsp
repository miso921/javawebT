<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>jstl_Ex2_2Res.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
</head>
<body>
<p><br/></p>
<div class="container">
  <h2 class="text-center mb-3">저장된 그림/그림명 출력하기</h2>
  <table class="table table-hover text-center">
    <tr class="table-dark text-dark">
      <th>순번</th>
      <th>그림파일</th>
      <th>그림파일명</th>
    </tr>
    <c:forEach var="vo" items="${vos}" varStatus="st">
      <tr>
        <td>${st.count}</td>
        <td><img src="${pageContext.request.contextPath}/images/${vo.picture}.jpg" width="150px"/></td>
        <td>${vo.pictureName}</td>
      </tr>
    </c:forEach>
    <tr><td colspan="3" class="m-0 p-0"></td></tr>
  </table>
  <hr/>
  <p class="text-center"><a href="${pageContext.request.contextPath}/study/0427/jstl_Ex2_2.jsp" class="btn btn-info">돌아가기</a></p>
</div>
<p><br/></p>
</body>
</html>