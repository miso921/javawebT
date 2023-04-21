<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>title</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script> -->
	<style>
	  th {background-color: #eee;}
	  th, td {text-align: center;}
	</style>
	<script>
	  'use strict';
	  
	  function loginCheck() {
		  let mid = loginForm.mid.value.trim();
		  let pwd = document.getElementById("mid").value.trim();
		  
		  if(mid == "") {
			  alert("아이디를 입력하세요.");
			  loginForm.mid.focus();
		  }
		  else if(pwd == "") {
			  alert("비밀번호를 입력하세요.");
			  document.getElementById("pwd").focus();
		  }
		  else {
			  loginForm.submit();
		  }
	  }
	</script>
</head>
<body>
<p><br/></p>
<div class="container">
	<form name="loginForm" method="post" action="test1Ok.jsp">
		<table class="table table-bordered" style="width:500px; height:250px;" style="text-align:center;">
		  <tr>
		    <th colspan="2" class="text-center"><h2>회원 로그인</h2></th>
		  </tr>
		  <tr>
		    <th>아이디</th>
		    <td><input type="text" name="mid" id="mid" value="admin" autofocus class="form-control" /></td>
		  </tr>
		  <tr>
		    <th>비밀번호</th>
		    <td><input type="password" name="pwd" id="pwd" value="1234" class="form-control" /></td>
		  </tr>
		  <tr>
		    <th colspan="2" class="text-center">
		      <input type="button" value="로그인" onclick="loginCheck()" class="btn btn-success" /> &nbsp;
		      <input type="reset" value="다시입력" class="btn btn-warning" /> &nbsp;
		    </th>
		  </tr>
		</table>
	</form>
</div>
<p><br/></p>
</body>
</html>