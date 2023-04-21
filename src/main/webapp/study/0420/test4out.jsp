<!-- test4out.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  String name = request.getParameter("name");
  pageContext.setAttribute("name", name);
%>
	<script>
		alert('${name}님 로그아웃 되었습니다.');
		<%-- location.href = '<%=request.getContextPath()%>/study/0420/test4.jsp'; --%>
		location.href = '${pageContext.request.contextPath}/study/0420/test4.jsp';
	</script>