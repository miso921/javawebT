<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<% pageContext.setAttribute("newLine", "\r\n"); %>			<!-- ', " 처리도 해야한다. -->
<% pageContext.setAttribute("singQuot", "\'"); %>
<% pageContext.setAttribute("doubleQuot", "\""); %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>ReservationMyList.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <script>
    'use strict';
    
    // 상세정보보기(모달을 사용함)
    function adminReservationContent(title,content,photo) {
    	$("#myModal #title").html(title); 
    	$("#myModal #content").html(content);
    	$("#myModal #photo").html("<img src='${ctp}/images/reservation/"+photo+"' width='450px' />");
    }
    
    // 예약취소
    function reservationCancel(idx, resInforIdx, reservationNum) {
    	let ans = confirm("현재 선택된 항목의 예약을 취소하시겠습니까?");
    	if(!ans) return false;
    	let query = {
    			idx            : idx,
    			resInforIdx    : resInforIdx,
    			reservationNum : reservationNum
    	}
    	
    	$.ajax({
    		type  : "post",
    		url   : "${ctp}/ReservationCancel.res",
    		data  : query,
    		success:function(res) {
    			if(res == "1") {
    				alert("예약이 취소되었습니다.");
    				location.reload();
    			}
    			else {
    				alert("예약 취소 실패~~");
    			}
    		},
    		error : function() {
    			alert("전송 오류!");
    		}
    	});
    }
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br/></p>
<div class="container">
  <h2 class="text-center">아이디 '${sMid}'(으)로 예약 처리된 리스트</h2>
  <br/>
  <table class="table table-borderless m-0">
    <tr>
      <td><a href="${ctp}/ReservationList.res" class="btn btn-primary">전체 프로그램 List보기</a></td>
    </tr>
  </table>
  <table class="table table-hover text-center">
    <tr class="table-dark text-dark">
      <th>번호</th>
      <th>프로그램명</th>
      <th>프로그램진행일</th>
      <th>과정신청인원</th>
      <th>참여예약일자</th>
      <th>과정신청(취소)날짜</th>
      <th>진행상황</th>
      <th>비고</th>
    </tr>
    <c:forEach var="vo" items="${vos}" varStatus="st">
      <tr>
        <td>${curScrStartNo}</td>
        <td><%-- ${vo.title}(${vo.resInforIdx}) --%>
          <c:set var="content" value="${fn:replace(fn:replace(vo.content,doubleQuot,''),singQuot,'')}"/>
          <a href="#" onclick="adminReservationContent('${vo.title}','${fn:replace(content,newLine,'<br/>')}','${vo.photo}')" data-toggle="modal" data-target="#myModal">${vo.title}</a>
        </td>
        <td>${fn:substring(vo.startDate,0,10)} ~ ${fn:substring(vo.endDate,0,10)}</td>
        <td>${vo.reservationNum}</td>
        <td>${fn:substring(vo.reservationDate,0,16)}</td>
        <td>${fn:substring(vo.rWDate,0,10)}</td>
        <td>
          ${vo.reservationFlag}
        </td>
        <td>
          <%-- <input type="button" value="예약취소" onclick="location.href='${ctp}/ReservationCancel.res?idx=${vo.idx}&resInforIdx=${vo.resInforIdx}';" class="btn btn-danger btn-sm" /> --%>
          <c:if test="${vo.reservationFlag == '예약완료'}">
          	<input type="button" value="예약취소" onclick="reservationCancel('${vo.idx}','${vo.resInforIdx}','${vo.reservationNum}')" class="btn btn-danger btn-sm" />
          </c:if>
        </td>
      </tr>
      <c:set var="curScrStartNo" value="${curScrStartNo - 1}" />
    </c:forEach>
    <tr><td colspan="8" class="m-0 p-0"></td></tr>
  </table>
</div>

<!-- 블록 페이지 시작 -->
<div class="text-center">
  <ul class="pagination justify-content-center">
    <c:if test="${pag > 1}">
      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/ReservationMyList.res?pag=1">첫페이지</a></li>
    </c:if>
    <c:if test="${curBlock > 0}">
      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/ReservationMyList.res?pag=${(curBlock-1)*blockSize + 1}">이전블록</a></li>
    </c:if>
    <c:forEach var="i" begin="${(curBlock)*blockSize + 1}" end="${(curBlock)*blockSize + blockSize}" varStatus="st">
      <c:if test="${i <= totPage && i == pag}">
    		<li class="page-item active"><a class="page-link bg-secondary border-secondary" href="${ctp}/ReservationMyList.res?pag=${i}">${i}</a></li>
    	</c:if>
      <c:if test="${i <= totPage && i != pag}">
    		<li class="page-item"><a class="page-link text-secondary" href="${ctp}/ReservationMyList.res?pag=${i}">${i}</a></li>
    	</c:if>
    </c:forEach>
    <c:if test="${curBlock < lastBlock}">
      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/ReservationMyList.res?pag=${(curBlock+1)*blockSize + 1}">다음블록</a></li>
    </c:if>
    <c:if test="${pag < totPage}">
      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/ReservationMyList.res?pag=${totPage}">마지막페이지</a></li>
    </c:if>
  </ul>
</div>
<!-- 블록 페이지 끝 -->

<!-- The Modal(모달창 클릭시 현재 예약항목의 상세 내역을 모달창에 출력한다. -->
<div class="modal fade" id="myModal">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
    
      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title"><span id="title"></span></h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      
      <!-- Modal body -->
      <div class="modal-body">
        - 설명 : <span id="content"></span>
        <hr/>
        <span id="photo" class="text-center"></span>
      </div>
      
      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
      
    </div>
  </div>
</div>

<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>