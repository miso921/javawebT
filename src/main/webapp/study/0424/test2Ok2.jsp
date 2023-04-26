<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  String name = request.getParameter("name")==null ? "" : request.getParameter("name");
  int age = request.getParameter("age")==null ? 0 : Integer.parseInt(request.getParameter("age"));
  String gender = request.getParameter("gender")==null ? "" : request.getParameter("gender");
  String job = request.getParameter("job")==null ? "" : request.getParameter("job");
  String address = request.getParameter("address")==null ? "" : request.getParameter("address");
  
  pageContext.setAttribute("name", name);
  pageContext.setAttribute("age", age);
  pageContext.setAttribute("gender", gender);
  pageContext.setAttribute("job", job);
  pageContext.setAttribute("address", address);
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>test2Ok2.jsp</title>
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
        <td>${name}</td>		<%-- <%=vo.getName()%> --%>
      </tr>
      <tr>
        <th>나이</th>
        <td>${age}</td>
      </tr>
      <tr>
        <th>성별</th>
        <td>${gender}</td>
      </tr>
      <tr>
        <th>직업</th>
        <td>${job}</td>
      </tr>
      <tr>
        <th>주소</th>
        <td>${address}</td>
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