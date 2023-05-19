<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>calendar2.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <style>
    #td1,#td8,#td15,#td22,#td29,#td36 {color:red}
    #td7,#td14,#td21,#td28,#td35 {color:blue}
    .today {
      background-color: pink;
      color: #fff;
      font-weight: bolder;
    }
  </style>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br/></p>
<div class="container">
  <div class="text-center">
	  <button type="button" onclick="location.href='${ctp}/Calendar2.st?yy=${yy-1}&mm=${mm}';" class="btn btn-secondary btn-sm" title="이전년도">◁◁</button>
	  <button type="button" onclick="location.href='${ctp}/Calendar2.st?yy=${yy}&mm=${mm-1}';" class="btn btn-secondary btn-sm" title="이전월">◀</button>
	  <font size="5">${yy}년 ${mm+1}월</font>
	  <button type="button" onclick="location.href='${ctp}/Calendar2.st?yy=${yy}&mm=${mm+1}';" class="btn btn-secondary btn-sm" title="다음월">▶</button>
		<button type="button" onclick="location.href='${ctp}/Calendar2.st?yy=${yy+1}&mm=${mm}';" class="btn btn-secondary btn-sm" title="다음년도">▷▷</button>
		&nbsp;&nbsp;
		<button type="button" onclick="location.href='${ctp}/Calendar2.st';" class="btn btn-secondary btn-sm" title="오늘날짜">홈</button>
  </div>
  <br/>
  <div class="text-center">
    <table class="table table-bordered" style="height:450px">
      <tr class="table-dark text-dark">
        <th style="width:14%; vertical-align:middle; color:red">일</th>
        <th style="width:14%; vertical-align:middle;">월</th>
        <th style="width:14%; vertical-align:middle;">화</th>
        <th style="width:14%; vertical-align:middle;">수</th>
        <th style="width:14%; vertical-align:middle;">목</th>
        <th style="width:14%; vertical-align:middle;">금</th>
        <th  style="width:14%; vertical-align:middle; color:blue">토</th>
      </tr>
      <tr>
      	<!-- 시작월 이전의 공백을 이던달의 날짜로 채워준다. -->
      	<c:set var="gap" value="${1}"/>
      	<c:forEach var="prevDay" begin="${preLastDay - (startWeek - 2)}" end="${preLastDay}" varStatus="st">
      	  <td style="color:#ccc;font-size:0.6em; text-align:left;">${prevYear}-${prevMonth+1}-${prevDay}</td>
	      	<c:set var="gap" value="${gap + 1}"/>
      	</c:forEach>
      	
      	<!-- 해당월에 대한 첫째주 날짜부터 출력하되, gap이 7이되면 줄바꿈한다. -->
      	<c:forEach begin="1" end="${lastDay}" varStatus="st">
      	  <c:set var="todaySw" value="${toYear==yy && toMonth==mm && toDay==st.count ? 1 : 0}" />
      	  <td id="td${gap}" ${todaySw==1 ? 'class=today' : ''}>${st.count}</td>
      	  <c:if test="${gap % 7 == 0}"></tr><tr></c:if>
      	  <c:set var="gap" value="${gap + 1}"/>
      	</c:forEach>
      	
      	<!-- 마지막일 이후를 다음달의 시작일자부터 채워준다. -->
      	<c:forEach var="nextDay" begin="${nextStartWeek}" end="7" varStatus="st">
      		<td style="color:#ccc;font-size:0.6em; text-align:left;">${nextYear}-${nextMonth+1}-${st.count}</td>
      	</c:forEach>
      </tr>
    </table>
  </div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>