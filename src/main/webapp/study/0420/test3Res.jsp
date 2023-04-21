<!-- test3Res.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  String name = request.getParameter("name");
%>
<script>
	alert('<%=name%>님 자료가 저장되었습니다.');
	location.href = '<%=request.getContextPath()%>/study/0420/test3.jsp';
</script>