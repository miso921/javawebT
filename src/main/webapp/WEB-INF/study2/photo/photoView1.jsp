<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>photoView1.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <script>
    'use strict';
    
    // 이미지 1장 미리보기
    function imgCheck(input) {
    	if(input.files && input.files[0]) {
    		let reader = new FileReader();
    		reader.onload = function(e) {
    			document.getElementById("demo").src = e.target.result;
    		}
    		reader.readAsDataURL(input.files[0]);
    	}
    	else {
    		document.getElementById("demo").src = "";
    	}
    }
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br/></p>
<div class="container">
  <h2>업로드 사진 미리보기1</h2>
  <form name="myform" id="myform" method="post" action="${ctp}/PhotoView1Ok.st" enctype="multipart/form-data">
  	<hr/>
  	<div>
  	  <input type="file" name="fName" id="fName" onchange="imgCheck(this)" class="form-control-file border mb-2" />
  	  <img id="demo" width="150px"/>
  	</div>
  	<div>
  	  사진 설명
  	  <textarea rows="4" name="content" id="content" class="form-control mb-3" placeholder="사진설명을 입력하세요."></textarea>
  	</div>
  	<div class="row">
  	  <div class="col"><input type="submit" value="전송" class="btn btn-success form-control mb-2"/></div>
	    <div class="col"><a href="${ctp}/PhotoView2.st" class="btn btn-primary form-control">업로드사진보러가기</a></div>
  	</div>
  </form>
  <hr/>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>