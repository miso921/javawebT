<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>uuidForm.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <script>
    'use strict';
    
    function uuidCheck() {
    	// ajax처리해서 아래쪽의 demo에 출력할것....
    	myform.submit();
    }
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br/></p>
<div class="container">
  <form name="myform" method="post" action="${ctp}/Uuid.st">
	  <h2>UUID란?</h2>
	  <p>
	    UUID(Univerally Unique Identifier)는 네트워크상에서 고유성이 보장되는 id를 만들기 위한 규약</br>
	    128Bit로, 16진수 32자리로 표현된다.<br/>
	    예: 112asdf3-f123-esa2-32we-rwkd13498fwe
	  </p>
	  <p>
	    <input type="button" value="UUID생성" onclick="uuidCheck()" class="btn btn-success"/>
	    <input type="button" value="다시하기" onclick="location.reload()" class="btn btn-secondary"/>
	  </p>
  </form>
  <hr/>
  출력결과<br/>
  <div id="demo"></div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>