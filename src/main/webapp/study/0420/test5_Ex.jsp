<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>test5_Ex.jsp</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script> -->
  <style>
    div {
      margin: 10px;
    }
  </style>
  <script>
    'use strict';
    
    function fCheck() {
    	
    	const regEx = /[0-9]/gm;
    	
    	let su1 = document.getElementById("su1").value.trim();
    	let su2 = document.getElementById("su2").value.trim();
    	let su3 = document.getElementById("su3").value.trim();
    	let su4 = document.getElementById("su4").value.trim();
    	let su5 = document.getElementById("su5").value.trim();
    	let strsu = su1 + su2 + su3 + su4 + su5;
    	
    	if(su1 == "" || su2 == "" || su3 == "" || su4 == "" || su5 == "" || !regEx.test(strsu)) {
    		alert("숫자를 포함하고있지 않습니다.");
    		return false;
    	}
    	
    	if(isNaN(su1) || isNaN(su2) || isNaN(su3) || isNaN(su4) || isNaN(su5)) {
    		alert("다섯개의 숫자만 입력하셔야 합니다.");
    	}
    	else {
    	  myform.submit();
    	}
    }
  </script>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>5개 수를 입력하세요</h2>
  <form name="myform" method="post" action="<%=request.getContextPath()%>/0420/test5_ExOk">
    <div>수1 <input type="number" name="su" id="su1" value="15" class="form-control"/></div>
    <div>수2 <input type="number" name="su" id="su2" value="25" class="form-control"/></div>
    <div>수3 <input type="number" name="su" id="su3" value="5" class="form-control"/></div>
    <div>수4 <input type="number" name="su" id="su4" value="55" class="form-control"/></div>
    <div>수5 <input type="number" name="su" id="su5" value="35" class="form-control"/></div>
    <div class="text-center">
      <input type="button" value="전송" onclick="fCheck()" class="btn btn-success mr-3"/>
      <input type="reset" value="다시입력" class="btn btn-warning"/>
    </div>
  </form>
</div>
<p><br/></p>
</body>
</html>