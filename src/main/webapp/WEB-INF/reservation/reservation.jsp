<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>reservation.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <script>
    'use strict';
    
    // 예약하기(모달창 사용)
    /*
    function reservationCheck(idx,title) {
    }
    */
    
    function reservationCheck() {
    	let resInforIdx = ${vo.idx};
    	let mid = '${sMid}';
    	let reservationNum = parseInt($("#reservationNum").val()) + 1;
    	let reservationTime = $("#reservationTime").val();
    	if(reservationTime.length == 4) reservationTime = '0'+reservationTime;
    	let reservationDate = $("#reservationDate").val() + " " + reservationTime;
    	
   		/* 
    	const date1 = new Date();
    	const date2 = new Date('${vo.startDate}');
    	const date3 = new Date('${vo.endDate}');
    	const selectDate = new Date(reservationDate);
   		 */
    	if(reservationTime == "") {
    		alert("예약 시간을 선택하셔야 합니다. 다시 진행해 주세요.");
    		return false;    		
    	}
    	else if((reservationNum + parseInt(${vo.reservationNum})) > parseInt(${vo.totalNum})) {
    		alert("현재 신청인원 초과로 신청하실 수 없습니다.");
    		location.reload();
    		return false;
    	}
   		// 날짜체크는 (자바스크립트로처리하게되면 시간부분때문에 처리가 복잡해지므로, Back에서 처리 하기로 한다.
    	/* else if(selectDate < date1 || selectDate < date2 || selectDate > date3) {
    		alert('예약할수 있는 일자가 아닙니다. 예약일자를 다시 체크해보세요.:'+selectDate+'/'+date1);
    		location.reload();
    		return false;
    	} */
    	
    	let query = {
    			resInforIdx : resInforIdx,
    			mid : mid,
    			reservationNum : reservationNum,
    			reservationDate : reservationDate
    	}
    	
    	$.ajax({
    		type : "post",
    		url  : "${ctp}/ReservationConfirm.res",
    		data : query,
    		success:function(res) {
   				alert(res);
    			location.reload();
    		},
    		error : function() {
    			alert("전송오류!");
    		}
    	});
    }
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br/></p>
<div class="container">
  <h2 class="text-center">회원들을 위한 테마 행사 예약하기</h2>
  <br/><hr/>
	<div class="row">
	  <div class="col ml-5">
			<div class="card" style="width:20rem;margin:20px 0 24px 0">
			  <img class="card-img-top" src="${ctp}/images/reservation/${vo.photo}" alt="image" style="width:100%">
			  <div class="card-body">
			    <h4 class="card-title">${vo.title}</h4>
			    <p class="card-text">
			      <c:if test="${fn:length(vo.content) > 40}">${fn:substring(vo.content, 0, 40)}...</c:if>
			      <c:if test="${fn:length(vo.content) <= 40}">${vo.content}</c:if>
			    </p>
			    <%-- <a href="#" onclick="reservationCheck('${vo.idx}','${vo.title}')" data-toggle="modal" data-target="#myModal" class="btn btn-primary">예약신청하기</a> --%>
			    <div class="text-center"><a href="#" data-toggle="modal" data-target="#myModal" class="btn btn-primary">예약신청하기</a></div>
			  </div>
			</div>
		</div>
		<div class="col-7 m-4">
		  <h3>행사명 : ${vo.title}</h3>
		  <hr/>
		  <div class="m-2">개최기간 : ${fn:substring(vo.startDate,0,10)} ~ ${fn:substring(vo.endDate,0,10)}</div>
		  <div class="m-2">개요 : ${vo.content}</div>
		  <div class="m-2">진행현황 : ${vo.progress}</div>
		  <div class="m-2">총 인 원 : ${vo.totalNum}</div>
		  <div class="m-2">신 청 자 : ${vo.reservationNum}</div>
		  <div class="m-4">기타 자세한 사항은 아래 전화로 문의하세요. (☎ 000-0000-0000)</div>
		  <div class="row">
			  <div class="col"><a href="${ctp}/ReservationMyList.res" class="btn btn-success">나의 예약정보 보기</a></div>
			  <div class="col"><a href="${ctp}/ReservationList.res" class="btn btn-info">전체행사내역보기</a></div>
		  </div>
		</div>
	</div>
	<hr/>
</div>

<!-- The Modal(모달창 클릭시 현재 예약항목의 상세 내역을 모달창에 출력한다. -->
<div class="modal fade" id="myModal">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content bg-warning">
    
      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title"><span id="title">${vo.title}</span></h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      
      <!-- Modal body -->
      <div class="modal-body">
        <form name="reservationForm">
          <div>
            <c:set var="now" value="<%=java.time.LocalDate.now()%>" />
					  <c:if test="${vo.startDate < now}"><c:set var="startDate" value="${now}"/></c:if>
					  <c:if test="${vo.startDate >= now}"><c:set var="startDate" value="${vo.startDate}"/></c:if>
	          예약날짜 : <input type="date" name="reservationDate" id="reservationDate" value="${fn:substring(startDate,0,10)}" /> &nbsp;&nbsp;
	          예약시간 : 
            <select name="reservationTime" id="reservationTime">
              <option value="">선택</option>
              <option value="09:00" selected>09:00</option>
              <c:forEach var="i" begin="10" end="18">
                <option>${i}:00</option>
              </c:forEach>
            </select>
          </div>
          <hr/>
          <div>
            예약 인원수 : 본인 1명 외 <input type="number" name="reservationNum" id="reservationNum" value="0" class="pl-2" />
          </div>
        </form>
      </div>
      
      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" onclick="reservationCheck()" class="btn btn-success" data-dismiss="modal">신청하기</button> &nbsp;
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
      
    </div>
  </div>
</div>

<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>