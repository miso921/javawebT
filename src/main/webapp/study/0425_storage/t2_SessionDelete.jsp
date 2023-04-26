<!-- t2_SessionDelete.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	session.invalidate();	// 현재 브라우저를통해서 저장된 세션은 모두 삭제...
%>
<script>
  alert("세션값 모두 삭제 완료!!! 세션값 : ${sMid}");
  location.href = "t2_SessionMain.jsp";
</script>