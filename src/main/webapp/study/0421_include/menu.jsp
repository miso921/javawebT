<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  String member2 = request.getParameter("member")==null? "" : request.getParameter("member");
%>
<%-- <%@ include file="../../include/bs4.jsp" %> --%>
<%-- <%@ include file="<%=request.getContextPath()%>/include/bs4.jsp" %> --%>
<%-- <jsp:include page="<%=request.getContextPath()%>/include/bs4.jsp"></jsp:include> --%>
<div style="height: 130px; text-align:center;">
  <br/><br/>
	<a href="main.jsp?member=<%=member2%>" class="btn btn-outline-primary">홈으로</a> |
	<a href="main.jsp?sw=guest&member=<%=member2%>" class="btn btn-outline-primary">방명록</a> |
	<a href="main.jsp?sw=board&member=<%=member2%>" class="btn btn-outline-primary">게시판</a> |
<%if(member2.equals("OK")) { %>
	  <a href="main.jsp?sw=pds&member=<%=member2%>" class="btn btn-outline-primary">자료실</a> |
	  <a href="main.jsp?sw=schedule&member=<%=member2%>" class="btn btn-outline-primary">스케줄관리</a>
	  <a href="main.jsp?sw=photo&member=<%=member2%>" class="btn btn-outline-primary">포토갤러리</a>
		<a href="main.jsp?sw=logout" class="btn btn-outline-primary">로그아웃</a>
<%} else { %>
		<a href="main.jsp?sw=login" class="btn btn-outline-primary">로그인</a>
<%} %>
</div>