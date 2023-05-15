<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>downLoad.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <script>
    'use strict'
    
    // 다운로드는 비동기식으로 처리 불가...(x)
    function javaDownLoad(file) {
    	$.ajax({
    		type  : "post",
    		url   : "${ctp}/FileDownLoad.st",
    		data  : {file : file},
    		success:function() {
    			alert("다운로드완료!");
    		},
    		error:function() {
    			alert("전송오류!");
    		}
    	});
    }
    
    function fileDelete(file) {
    	let ans = confirm("선택한 파일을 삭제하시겠습니까");
    	if(!ans) return false;
    	
    	$.ajax({
    		type : "post",
    		url  : "${ctp}/FileDelete.st",
    		data : {file : file},
    		success:function(res) {
    			if(res == "1") {
    				alert("파일이 삭제되었습니다.");
    				location.reload();
    			}
    			else {
    				alert("파일 삭제 실패~~");
    			}
    		},
    		error : function() {
    			alert("전송 실패~~");
    		}
    	});
    }
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br/></p>
<div class="container">
  <h2>파일 다운로드 연습(총 : ${fileCount}개)</h2>
  <p>저장경로 : ${ctp}/images/pdstest/*.*</p>
  <hr/>
  <table class="table table-hover text-center">
    <tr class="table-dark text-dark">
      <th>번호</th>
      <th>파일명</th>
      <th>파일형식</th>
      <th>다운로드/삭제</th>
    </tr>
    <c:forEach var="file" items="${files}" varStatus="st">
      <tr>
        <td>${st.count}</td>
        <td>
          <a href="${ctp}/images/pdstest/${file}" download="${file}">${file}</a>
        </td>
        <td>
          <c:set var="fNameArr" value="${fn:split(file,'.')}"/>
          <c:set var="extName" value="${fn:toLowerCase(fNameArr[fn:length(fNameArr)-1])}"/>
          <c:if test="${extName == 'zip'}">압축파일</c:if>
          <c:if test="${extName == 'hwp'}">한글파일</c:if>
          <c:if test="${extName == 'ppt' || extName == 'pptx'}">파워포인트파일</c:if>
          <c:if test="${extName == 'jpg' || extName == 'gif' || extName == 'png'}">
            <img src="${ctp}/images/pdstest/${file}" width="150px"/>
          </c:if>
          : (${extName})
        </td>
        <td>
          <%-- <input type="button" value="자바다운로드" onclick="javaDownLoad('${file}')" class="btn btn-warning btn-sm"/> --%>
          <input type="button" value="자바다운로드" onclick="location.href='${ctp}/FileDownLoad.st?file=${file}';" class="btn btn-warning btn-sm"/>/
          <input type="button" value="삭제" onclick="fileDelete('${file}')" class="btn btn-danger btn-sm"/>
        </td>
      </tr>
    </c:forEach>
    <tr><td colspan="4" class="m-0 p-0"></td></tr>
  </table>
  <hr/>
  <input type="button" value="돌아가기" onclick="history.back()" class="btn btn-secondary form-control"/>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>