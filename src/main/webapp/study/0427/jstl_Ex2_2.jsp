<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>jstl_Ex2.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <script>
    'use strict';
    
    let pictureArray = [];
    let pictureNameArray = [];
    
    function pictureCheck() {
    	let picture = myform.picture.value;
    	let pictureName = myform.pictureName.value.trim();
    	
    	if(picture == "") {
    		alert("그림을 선택하세요!");
    	}
    	else if(pictureName == "") {
    		alert("그림 이름을 입력하세요!");
    		myform.pictureName.focus();
    	}
    	else {
    		pictureArray.push(picture);
    		pictureNameArray.push(pictureName);
    		alert("선택하신 그림을 저장하였습니다.");
    		myform.pictureName.value = "";
    	}
    }
    
    function pictureView() {
    	if(pictureArray.length == 0) {
    		alert("저장된 그림이 없습니다.");
    		return false;
    	}
    	
    	myform.pictureArray.value = pictureArray;
    	myform.pictureNameArray.value = pictureNameArray;
    	
    	myform.submit();
    }
    
    function pictureReset() {
    	// location.reload();
    	
    	pictureArray.splice(0,pictureArray.length);
    	pictureNameArray.splice(0,pictureNameArray.length);
    	demo.innerHTML = "";
    	alert("저장소의 그림을 모두 제거시켰습니다.");
    }
    
    function moveCheck() {
    	let picture = myform.picture.value;
    	let str = '<img src="${pageContext.request.contextPath}/images/'+picture+'.jpg" width="400px" />&nbsp;';
    	demo.innerHTML = str;
    	
    	myform.pictureName.value = "";
    	myform.pictureName.focus();
    }
  </script>
</head>
<body>
<p><br/></p>
<div class="container">
  <pre>
    콤보상자에 숫자 1~6까지를 기억시키고 화면에 보여준다.(화면에 보여주는 숫자는 1~6.jpg인 그림파일명이다.)
    콤보상자 옆에 텍스트박스를 위치시키고, 해당 그림의 '그림명'을 입력후 '저장'버튼을 클릭하면,
    '그림명'과, '그림파일명'을 저장시켜준다.(여러개를 저장할 수 있도록 처리)
    마지막으로 '출력'버튼을 클릭하면 아래쪽(demo)으로 저장된 모든 그림파일과 그림파일명을 출력한다.
  </pre>
  <form name="myform" method="post" action="${pageContext.request.contextPath}/t0427/Jstl_Ex2_2Ok">
    <div class="row">
      <div class="col">
		    그림선택 :
		    <select name="picture" id="picture" onchange="moveCheck()" class="form-control">
			    <option value="">그림번호선택</option>
			    <c:forEach var="i" begin="1" end="6">
			      <option>${i}</option>
			    </c:forEach>
			  </select>
		  </div>
		  <div class="col">
		    그림설명 :
		    <input type="text" name="pictureName" class="form-control"/>
		  </div>
	  </div>
	  <hr/>
	  <div class="text-center">
		  <input type="button" value="선택그림저장" onclick="pictureCheck()" class="btn btn-success" /> &nbsp;
		  <input type="button" value="선택그림모두출력" onclick="pictureView()" class="btn btn-primary" /> &nbsp;
		  <input type="button" value="Reset" onclick="pictureReset()" class="btn btn-primary" />
	  </div>
	  <hr/>
	  <div id="demo"></div>
	  <input type="hidden" name="pictureArray"/>
	  <input type="hidden" name="pictureNameArray"/>
  </form>
</div>
<p><br/></p>
</body>
</html>