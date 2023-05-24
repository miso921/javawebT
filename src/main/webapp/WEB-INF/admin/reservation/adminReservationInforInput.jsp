<%@ page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
  LocalDate startDate = LocalDate.now();
  LocalDate endDate = startDate.plusDays(10);
  pageContext.setAttribute("startDate", startDate);
  pageContext.setAttribute("endDate", endDate);
%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>reservationInforInput.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <style>
    th {
      text-align: center;
      background-color: #eee;
    }
  </style>
  <script>
    'use strict';
    
    // 이미지 1장 미리보기
    function imgCheck(evt) {
    	if(evt.files && evt.files[0]) {
    		let reader = new FileReader();
    		reader.onload = function(e) {
    			document.getElementById("demo").src = e.target.result;
    		}
    		reader.readAsDataURL(evt.files[0]);
    	}
    	else {
    		document.getElementById("demo").src = "";
    	}
    }
  </script>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2 class="text-center mb-4">예약 관리 현황 등록하기</h2>
  <form name="myform" method="post" action="${ctp}/AdminReservationInforInputOk.res" class="was-validated" enctype="multipart/form-data">
    <table class="table table-bordered">
      <tr>
        <th style="width:25%">예약프로그램명</th>
        <td style="width:75%"><input type="text" name="title" id="title" class="form-control" autofocus required /></td>
      </tr>
      <tr>
        <th>프로그램상세내역</th>
        <td><textarea rows="4" name="content" id="content" class="form-control" required></textarea></td>
      </tr>
      <tr>
        <th>총 인원수</th>
        <td><input type="number" name="totalNum" id="totalNum" value="20" class="form-control" required /></td>
      </tr>
      <tr>
        <th>프로그램진행현황</th>
        <td>
          <select name="progress" id="progress" class="form-control">
            <option selected>모집중</option>
            <option>모집마감</option>
            <option>프로그램종료</option>
            <option>모집대기</option>
          </select>
        </td>
      </tr>
      <tr>
        <th>예약시작일</th>
        <td><input type="date" name="startDate" id="startDate" value="${startDate}" class="form-control" required /></td>
      </tr>
      <tr>
        <th>예약종료일</th>
        <td><input type="date" name="endDate" id="endDate" value="${endDate}" class="form-control" required /></td>
      </tr>
      <tr>
        <th>공지고정유무</th>
        <td>
          <input type="radio" name="popup" id="popupOk" value="OK" checked />고정하기 &nbsp;
          <input type="radio" name="popup" id="popupNo" value="NO"  />해제하기
        </td>
      </tr>
      <tr>
        <th>홍보사진</th>
        <td>
          <input type="file" name="photo" id="photo" onchange="imgCheck(this)" class="form-control-file border" /><br/>
			    <img id="demo" width="200px"/>
        </td>
      </tr>
      <tr>
        <td colspan="2" class="text-center">
          <input type="submit" value="등록하기" class="btn btn-success"/> &nbsp;
          <input type="reset" value="다시입력" class="btn btn-info"/> &nbsp;
          <input type="button" value="돌아가기" onclick="location.href='${ctp}/AdminReservationList.res';" class="btn btn-warning" />
        </td>
      </tr>
    </table>
    <br/>
  </form>
</div>
<p><br/></p>
</body>
</html>