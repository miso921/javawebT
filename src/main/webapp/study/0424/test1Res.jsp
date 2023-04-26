<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>test1Res.jsp</title>
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
        <td>${vo.name}</td>		<%-- <%=vo.getName()%> --%>
      </tr>
      <tr>
        <th>나이</th>
        <td>${vo.age}</td>
      </tr>
      <tr>
        <th>성별</th>
        <td>${vo.gender}</td>
      </tr>
      <tr>
        <th>직업</th>
        <td>${vo.job}</td>
      </tr>
      <tr>
        <th>주소</th>
        <td>${vo.address}</td>
      </tr>
    </table>
    <p>
      <%-- <a href="<%=request.getContextPath()%>/study/0424/test1.jsp" class="btn btn-warning">돌아가기</a> --%>
      <a href="${pageContext.request.contextPath}/study/0424/test1.jsp" class="btn btn-warning">돌아가기</a>
    </p>
  </div>
</div>
<p><br/></p>
</body>
</html>