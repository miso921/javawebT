<!-- schedule.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<h2>이곳은 포토갤러리 입니다.</h2>
<hr/>
<% for(int i=1; i<=6; i++) { %>
     <img src="<%=request.getContextPath()%>/images/<%=i%>.jpg" width="200px" />
<% } %>
<hr/>
<p>더 멋진 시간 되세요</p>