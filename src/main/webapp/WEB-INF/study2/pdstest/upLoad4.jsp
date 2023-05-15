<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>upLoad4.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <script>
    'use strict';
    
    function fCheck() {
    	let fName = document.getElementById("file").value;
			let ext = fName.substring(fName.lastIndexOf(".")+1).toUpperCase();
			let maxSize = 1024 * 1024 * 10; // 업로드 가능파일은 5MByte까지로 한다.
			
			if(fName.trim() == "") {
				alert("업로드할 파일을 선택하세요");
			}
			
			let fileSize = document.getElementById("file").files[0].size;
			if(ext != "JPG" && ext != "GIF" && ext != "PNG" && ext != "ZIP" && ext != "HWP" && ext != "PPT" && ext != "PPTX") {
				alert("업로드 가능한 파일은 'jpg/gif/png/zip/hwp/ppt/pptx' 입니다.");
			}
			else if(fileSize > maxSize) {
				alert("업로드할 파일의 최대용량은 5MByte 입니다.")
			}
			else {
				//alert("전송완료");
				myform.submit();
			}
    }
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br/></p>
<div class="container">
  <h2>파일 업로드 연습(멀티파일처리3)</h2>
  <p>COS라이브러리를 이용한 파일 업로드</p>
  <div>(http://servlets.com/cos/)</div>
  <div>여러개의 파일을 선택할 경우는 'Ctrl+클릭/Shift+클릭' 하세요.</div>
  <hr/>
  <form name="myform" method="post" action="${ctp}/FileUpLoad4Ok.st" enctype="multipart/form-data">
    파일명 : 
    <input type="file" name="fName" id="file" multiple class="form-control-file border mb-2">
    <input type="button" value="전송" onclick="fCheck()" class="btn btn-success form-control"/>
  </form>
  <hr/>
  <input type="button" value="다운로드사이트로이동" onclick="location.href='${ctp}/DownLoad.st';" class="btn btn-primary form-control"/>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>