<!-- schedule.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<p><br/></p>
<form name="loginForm" method="post" action="<%=request.getContextPath()%>/t0421/LoginOk">
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
	      <input type="button" value="홈으로" onclick="location.href='main.jsp';" class="btn btn-info" />
	    </th>
	  </tr>
	</table>
</form>