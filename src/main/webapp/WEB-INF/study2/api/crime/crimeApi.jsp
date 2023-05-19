<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>crimeApi.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <script>
    'use strict';
    
    const API_KEY = 'V0sC01r5SrGj8fQpV6rU7gjEAA%2F%2F7PhasyuGhxJcwPQL%2Bq86d2Vp7E2be%2FOc4Z%2F4MiB%2FVcpv5dbMENEIQWVs7Q%3D%3D';
    
    // 외부 데이터를 가져오는 방식? fetch방식 -> JSON형식
    
    // 경찰청에서 제공해주는 api 이용한 자료 검색(화면출력)
    async function getCrimeData() {
    	let year = $("#year").val();
    	let apiYear = "";
    	
    	if(year == 2015) apiYear = "/15084592/v1/uddi:fbbfd36d-d528-4c8e-aa9b-d5cdbdeec669";
    	else if(year == 2016) apiYear = "/15084592/v1/uddi:21ec6fa1-a033-413b-b049-8433f5b446ff";
    	else if(year == 2017) apiYear = "/15084592/v1/uddi:67117bd9-5ee1-4e07-ae4a-bfe0861ee116";
    	else if(year == 2018) apiYear = "/15084592/v1/uddi:2d687e27-b5c3-4bdb-9b77-c644dcafcbc7";
    	else if(year == 2019) apiYear = "/15084592/v1/uddi:b6cc7731-181b-48e1-9a6c-ae81388e46b0";
    	else if(year == 2020) apiYear = "/15084592/v1/uddi:fdde1218-987c-49ba-9326-8e3ba276141e";
    	else if(year == 2021) apiYear = "/15084592/v1/uddi:943e757d-462b-4b3a-ab9f-9a8553637ca2";
    	
    	let url = "https://api.odcloud.kr/api" + apiYear;
    	url += "?serviceKey="+API_KEY;
    	url += "&page=1&perPage=200";
    	
    	const response = await fetch(url);
    	
    	const res = await response.json();
    	
    	console.log("res : ", res);
    	
    	/*
    	let str = "";
    	for(let i=0; i<res.data.length; i++) {
    		str += res.data[i] + "<br/>";
    	}
    	*/
    	
    	let str = res.data.map((item, i) => [
    		(i+1) + "." 
    		+ "발생년도: " + item.발생년도 + "년"
    		+ ",경찰서: " + item.경찰서
    		+ ", 강도 " + item.강도 + "건"
    		+ ", 살인 " + item.살인 + "건"
    		+ ", 절도 " + item.절도 + "건"
    		+ ", 폭력 " + item.폭력 + "건"
    		+ "<br/>"
    	]);
    	
    	$("#demo").html(str);
    }
    
    // 검색된 자료를 DB에 저장하기
    async function saveCrimeData() {
    	let year = $("#year").val();
    	let apiYear = "";
    	
    	if(year == 2015) apiYear = "/15084592/v1/uddi:fbbfd36d-d528-4c8e-aa9b-d5cdbdeec669";
    	else if(year == 2016) apiYear = "/15084592/v1/uddi:21ec6fa1-a033-413b-b049-8433f5b446ff";
    	else if(year == 2017) apiYear = "/15084592/v1/uddi:67117bd9-5ee1-4e07-ae4a-bfe0861ee116";
    	else if(year == 2018) apiYear = "/15084592/v1/uddi:2d687e27-b5c3-4bdb-9b77-c644dcafcbc7";
    	else if(year == 2019) apiYear = "/15084592/v1/uddi:b6cc7731-181b-48e1-9a6c-ae81388e46b0";
    	else if(year == 2020) apiYear = "/15084592/v1/uddi:fdde1218-987c-49ba-9326-8e3ba276141e";
    	else if(year == 2021) apiYear = "/15084592/v1/uddi:943e757d-462b-4b3a-ab9f-9a8553637ca2";
    	
    	let url = "https://api.odcloud.kr/api" + apiYear;
    	url += "?serviceKey="+API_KEY;
    	url += "&page=1&perPage=200";
    	
    	const response = await fetch(url);
    	
    	const res = await response.json();
    	
    	console.log("res : ", res);
    	
    	let str = res.data.map((item, i) => [
    		(i+1) + "." 
    		+ "발생년도: " + item.발생년도 + "년"
    		+ ",경찰서: " + item.경찰서
    		+ ", 강도 " + item.강도 + "건"
    		+ ", 살인 " + item.살인 + "건"
    		+ ", 절도 " + item.절도 + "건"
    		+ ", 폭력 " + item.폭력 + "건"
    		+ "<br/>"
    	]);
    	
    	$("#demo").html(str);
    	
    	// aJax를 이용하여 DB에 자료를 저장한다.
    	let query = "";
    	for(let i=0; i<res.data.length; i++) {
    		if(res.data[i].경찰서 != null) {
    			query = {
    					year    : year,
    					police  : res.data[i].경찰서,
    					robbery : res.data[i].강도,
    					murder  : res.data[i].살인,
    					theft   : res.data[i].절도,
    					violence: res.data[i].폭력
    			}
    			
    			$.ajax({
    				type  : "post",
    				url   : "${ctp}/SaveCrimeData.st",
    				data  : query,
    				error : function() {
    					alert("전송오류!");
    				}
    			});
    		}
    	}
    	alert(year + "년도 자료가 DB에 저장되었습니다.");
    }
    
    // DB에 저장된 자료 삭제처리
    function deleteCrimeData() {
    	let year = $("#year").val();
    	let ans = confirm(year + "년도의 자료를 삭제 하시겠습니까?");
    	if(!ans) return false;
    	
    	$.ajax({
    		type  : "post",
    		url   : "${ctp}/DeleteCrimeData.st",
    		data  : {year : year},
    		success:function(res) {
    			if(res == "1") {
    				alert(year + "년도 자료 삭제 완료!");
    				location.reload();
    			}
    			else {
    				alert(res);
    			}
    		},
    		error: function() {
    			alert("전송 오류!");
    		}
    	});
    }
    
    // DB에 저장된 자료 출력하기
    /*
    function listCrimeData() {
    	let year = $("#year").val();
    	$.ajax({
    		type  : "post",
    		url   : "${ctp}/ListCrimeData.st",
    		data  : {year : year},
    		success:function(res) {
    			if(res != "1") {
    				alert(year + "년도 자료 는 존재하지 않습니다.");
    				location.reload();
    			}
    		},
    		error: function() {
    			alert("전송 오류!");
    		}
    	});
    }
    */
    
    // DB안의 자료 출력하기(경찰서별 오름차순(내림차순) 정렬 출력)
    /*
    function policeSearch() {
    	let year = $("#year").val();
    	let crimeOrder = $("#crimeOrder").val();
    	$.ajax({
    		type  : "post",
    		url   : "${ctp}/ListOrderCrimeData.st",
    		data  : {year : year,
    			crimeOrder : crimeOrder},
    		success:function(res) {
    			if(res != "1") {
    				alert(year + "년도 자료 는 존재하지 않습니다.");
    				location.reload();
    			}
    		},
    		error: function() {
    			alert("전송 오류!");
    		}
    	});
    }
    */
    
    // 년도별 DB의 자료 출력하기
    function listCrimeData() {
    	myform.action = "${ctp}/ListCrimeData.st";
    	myform.submit();
    }
    
    // 경찰서별 + 년도별 DB의 자료 출력하기
    function policeSearch() {
    	myform.action = "${ctp}/PoliceCrimeDataSearch.st";
    	myform.submit();
    }
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br/></p>
<div class="container">
  <form name="myform" method="post">
	  <h2>경찰청_전국 경찰서별 강력범죄 발생 현황</h2>
	  <hr/>
	  <p>
	    <select name="year" id="year">
	      <c:forEach var="i" begin="2015" end="2021">
	        <option ${year == i ? 'selected' : ''}>${i}</option>
	      </c:forEach>
	    </select>
	    <input type="button" value="강력범죄자료조회" onclick="getCrimeData()" class="btn btn-success"/>
	    <input type="button" value="조회자료DB저장" onclick="saveCrimeData()" class="btn btn-success"/>
	    <input type="button" value="DB자료삭제" onclick="deleteCrimeData()" class="btn btn-success"/>
	    <input type="button" value="DB자료출력" onclick="listCrimeData()" class="btn btn-primary"/>
	  </p>
	  <p>
	    정렬순서 :
	    <input type="radio" name="crimeOrder" value="asc"  ${crimeOrder=='asc'  ? 'checked' : ''} />오름차순 &nbsp;
	    <input type="radio" name="crimeOrder" value="desc" ${crimeOrder=='desc' ? 'checked' : ''} />내림차순 &nbsp;
	    <input type="button" value="경찰서순서조회" onclick="policeSearch()" class="btn btn-secondary"/>
	  </p>
	  <p>
	    <input type="button" value="돌아가기" onclick="location.href='${ctp}/ApiTest.st';" class="btn btn-warning"/>
	  </p>
  </form>
  <hr/>
  <div id="demo"></div>
  <hr/>
  <c:if test="${!empty vos}">
    <h3>범죄 분석 통계(<font color="red"><b>합계</b></font>)</h3>
    <table class="table table-hover">
      <tr class="table-dark text-dark">
	      <th>구분</th>
	      <th>년도</th>
	      <th>강도</th>
	      <th>살인</th>
	      <th>절도</th>
	      <th>폭력</th>
      </tr>
      <tr>
        <td>총계</td>
        <td>${analyzeVo.year}</td>
        <td><fmt:formatNumber value="${analyzeVo.totRobbery}"/>건</td>
        <td><fmt:formatNumber value="${analyzeVo.totMurder}"/>건</td>
        <td><fmt:formatNumber value="${analyzeVo.totTheft}"/>건</td>
        <td><fmt:formatNumber value="${analyzeVo.totViolence}"/>건</td>
      </tr>
      <tr><td colspan="6" class="m-0 p-0"></td></tr>
    </table>
    <hr/>
    <h3>범죄 분석 통계(<font color="red"><b>평균</b></font>)</h3>
    <table class="table table-hover">
      <tr class="table-dark text-dark">
	      <th>구분</th>
	      <th>년도</th>
	      <th>강도</th>
	      <th>살인</th>
	      <th>절도</th>
	      <th>폭력</th>
      </tr>
      <tr>
        <td>평균</td>
         <td>${analyzeVo.year}</td>
        <td><fmt:formatNumber value="${analyzeVo.avgRobbery}" pattern="#,##0.0"/>건</td>
        <td><fmt:formatNumber value="${analyzeVo.avgMurder}" pattern="#,##0.0"/>건</td>
        <td><fmt:formatNumber value="${analyzeVo.avgTheft}" pattern="#,##0.0"/>건</td>
        <td><fmt:formatNumber value="${analyzeVo.avgViolence}" pattern="#,##0.0"/>건</td>
      </tr>
      <tr><td colspan="6" class="m-0 p-0"></td></tr>
    </table>
    <hr/>
    <br/>
    <h3><font color="red"><b>${year}</b></font>년 범죄 통계 현황(총 : <font color="blue"><b>${fn:length(vos)}</b></font>건)</h3>
    <c:if test="${!empty crimeOrder}">
    	<p><font color="blue">
    	  경찰서별 <font color="red"><b>
      	<c:if test="${crimeOrder == 'asc'}">오름차순</c:if>
      	<c:if test="${crimeOrder != 'asc'}">내림차순</c:if></b></font>
      	정렬된 자료입니다.</font>
      </p>
    </c:if>
    <table class="table table-hover">
      <tr class="table-dark text-dark">
        <th>번호</th>
        <th>발생년도</th>
        <th>관할경찰서</th>
        <th>강도</th>
        <th>살인</th>
        <th>절도</th>
        <th>폭력</th>
      </tr>
      <c:forEach var="vo" items="${vos}" varStatus="st">
        <tr>
          <td>${st.count}</td>
          <td>${vo.year}</td>
          <td>${vo.police}</td>
          <td>${vo.robbery}</td>
          <td>${vo.murder}</td>
          <td>${vo.theft}</td>
          <td>${vo.violence}</td>
        </tr>
      </c:forEach>
      <tr><td colspan="7" class="m-0 p-0"></td></tr>
    </table>
    <hr/>
  </c:if>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>