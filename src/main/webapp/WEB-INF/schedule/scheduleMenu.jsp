<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>scheduleMenu.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <style>
    th {
      text-align: center;
      background-color: #eee;
    }
  </style>
  <script>
    'use strict';
    
    $(document).ready(function(){
	    $("#scheduleInputClose").hide();
    });
    
    function scheduleInputView() {
    	let str = '<div id="scheduleInputForm"><hr/>';
    	str += '<form name="myform">';
    	str += '<table class="table table-bordered">';
    	str += '<tr><th>일정분류</th><td>';
    	str += '<select name="part" class="form-control">';
    	str += '<option>모임</option>';
    	str += '<option>업무</option>';
    	str += '<option>학습</option>';
    	str += '<option>여행</option>';
    	str += '<option>기타</option>';
    	str += '</select>';
    	str += '</td></tr>';
    	str += '<tr><th>내역</th><td>';
    	str += '<textarea name="content" rows="4" class="form-control"></textarea>';
    	str += '</td></tr>';
    	str += '<tr><td colspan="2" class="text-center">';
    	str += '<input type="button" value="일정등록" onclick="scheduleInputOk()" class="btn btn-success form-control"/>';
    	str += '</td></tr>';
    	str += '</table>';
    	str += '</form></div>';
    	
    	$("#scheduleInputView").hide();
    	$("#scheduleInputClose").show();
    	$("#demo").slideDown(1000);
    	$("#demo").html(str);
    }
    
    // 일정 등록창 닫기
    function scheduleInputClose() {
    	$("#scheduleInputView").show();
    	$("#scheduleInputClose").hide();
    	$("#scheduleInputForm").slideUp(500);
    }
    
    // 일정 등록하기
    function scheduleInputOk() {
    	let part = myform.part.value;
    	let content = myform.content.value;
    	if(content.trim() == "") {
    		alert("일정을 입력하세요");
    		myform.content.focus();
    		return false;
    	}
    	let query = {
    			mid  : '${sMid}',
    			ymd  : '${ymd}',
    			part : part,
    			content  : content
    	}
    	
    	$.ajax({
    		type  : "post",
    		url   : "${ctp}/ScheduleInputOk.sc",
    		data  : query,
    		success:function(res) {
    			if(res == "1") {
    				alert("일정이 등록되었습니다.");
    				location.reload();
    			}
    		},
    		error : function() {
    			alert("전송오류!");
    		}
    	});
    }
    
    // 스케줄 수정하기
    function updateCheck(idx,part,content) {
    		let str = '<hr/><div id="scheduleUpdateForm'+idx+'">';
				str += '<form name="updateform'+idx+'">';
				str += '<table class="table table-bordered">';
				str += '<tr><th>일정분류</th><td>';
				str += '<select name="part" id="part'+idx+'"  class="form-control">';
				str += '<option>모임</option>';
				str += '<option>업무</option>';
				str += '<option>학습</option>';
				str += '<option>여행</option>';
				str += '<option>기타</option>';
				str += '<option value="'+part+'" selected>'+part+'</option>';
				str += '</select>';
				str += '</td></tr>';
				str += '<tr><th>내역</th><td>';
				str += '<textarea name="content" id="content'+idx+'" rows="4" class="form-control">'+content.replaceAll("<br/>","\n")+'</textarea>';
				str += '</td></tr>';
				str += '<tr><td colspan="2" class="text-center">';
				str += '<span class="row">';
				str += '<span class="col"><input type="button" value="일정수정" onclick="scheduleUpdateOk('+idx+')" class="btn btn-success form-control"/></span>';
				str += '<span class="col"><input type="button" value="수정창닫기" onclick="scheduleUpdateClose('+idx+')" class="btn btn-warning form-control"/></span>';
				str += '</span>';
				str += '</td></tr>';
				str += '</table>';
				str += '</form></div>';
    	
    	$("#scheduleUpdateOpen"+idx).hide();
    	$("#updateDemo"+idx).slideDown(500);
    	$("#updateDemo"+idx).html(str);
    }
    
    // 수정창 닫기
    function scheduleUpdateClose(idx) {
    	$("#scheduleUpdateOpen"+idx).show();
    	$("#scheduleUpdateForm"+idx).slideUp(500);
    }
    
    // 일정 수정하기
    function scheduleUpdateOk(idx) {
    	let part = $("#part"+idx).val();
    	let content = $("#content"+idx).val();
    	let query = {
    			idx  : idx,
    			part : part,
    			content : content
    	}
    	
    	$.ajax({
    		type  : "post",
    		url   : "${ctp}/ScheduleUpdateOk.sc",
    		data  : query,
    		success:function(res) {
    			if(res == "1") {
    				alert("수정완료!");
    				location.reload;
    			}
    			else {
    				alert("수정실패");
    			}
    		},
    		error : function() {
    			alert("전송 실패~~");
    		}
    	});
    }
    
    // 스케줄 삭제처리
    function deleteCheck(idx) {
    	let ans = confirm("선택된 일정을 삭제하시겠습니까?");
    	if(!ans) return false;
    	
    	$.ajax({
    		type  : "post",
    		url   : "${ctp}/ScheduleDeleteOk.sc",
    		data  : {idx : idx},
    		success:function(res) {
    			if(res == "1") {
    				alert("일정이 삭제되었습니다.");
    				location.reload();
    			}
    			else {
    				alert("일정 삭제 실패~~");
    			}
    		},
    		error : function() {
    			alert("전송 오류!!");
    		}
    	});
    }
    
    // 스케줄 상세내역을 모달로 출력하기
    function modalView(part, content) {
    	/*
    	$("#myModal").on("show.bs.modal", function(e){
    		$(".modal-body #part").html(part);
    		$(".modal-body #content").html(content);
    	});
    	*/
    	
    	$("#myModal #part").html(part);
		  $("#myModal #content").html(content);
    }
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br/></p>
<div class="container">
  <h4>${ymd}의 일정입니다.</h4>
  <p>오늘의 일정은 총 ${scheduleCnt}건 있습니다.</p>
  <hr/>
  <div>
    <input type="button" value="일정등록" onclick="scheduleInputView()" id="scheduleInputView" class="btn btn-success"/>
    <input type="button" value="등록창닫기" onclick="scheduleInputClose()" id="scheduleInputClose" class="btn btn-success"/>
    <input type="button" value="돌아가기" onclick="location.href='${ctp}/ScheduleList.sc';" class="btn btn-info"/>
  </div>
  <div id="demo"></div>
  <hr/>
  <c:if test="${scheduleCnt != 0}">
    <table class="table table-hover text-center">
      <tr class="table-dark text-dark">
	      <th>번호</th>
	      <th>내역</th>
	      <th>분류</th>
	      <th>비고</th>
      </tr>
      <c:forEach var="vo" items="${vos}" varStatus="st">
        <tr>
          <td>${st.count}</td>
          <td>
          	<a href="#" onclick="modalView('${vo.part}','${fn:replace(vo.content,newLine,'<br/>')}')" data-toggle="modal" data-target="#myModal">
	            <c:if test="${fn:indexOf(vo.content,newLine) != -1}">${fn:substring(vo.content,0,fn:indexOf(vo.content,newLine))}</c:if>
	            <c:if test="${fn:indexOf(vo.content,newLine) == -1}">${fn:substring(vo.content,0,20)}</c:if>
            </a>
          </td>
          <td>${vo.part}</td>
          <td>
            <input type="button" value="수정" id="scheduleUpdateOpen${vo.idx}" onclick="updateCheck('${vo.idx}','${vo.part}','${fn:replace(vo.content,newLine,'<br/>')}')" class="btn btn-warning btn-sm"/>
            <input type="button" value="삭제" onclick="deleteCheck(${vo.idx})" class="btn btn-danger btn-sm"/>
          </td>
        </tr>
        <tr><td colspan="4" class="m-0 p-0"><div id="updateDemo${vo.idx}"></div></td></tr>
      </c:forEach>
      <tr><td colspan="4" class="m-0 p-0"></td></tr>
    </table>
  </c:if>
</div>

<!-- The Modal(모달창 클릭시 자료실의 내용을 모달창에 출력한다. -->
<div class="modal fade" id="myModal">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title"><b>${ymd}</b> 일정</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <!-- Modal body -->
      <div class="modal-body">
        <table class="table table-bordered">
          <tr><th>분류 :</th><td><span id="part"></span></td></tr>
          <tr><th>내용 :</th><td><span id="content"></span></td></tr>
          <tr><th>작성자 :</th><td>${sMid}</td></tr>
        </table>
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