<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>test10.jsp</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script> -->
  <style>
    th {
      background-color: #ccc;
      text-align: center;
    }
  </style>
</head>
<body>
<p><br/></p>
<div class="container">
  <form name="myform" method="post" action="<%=request.getContextPath()%>/t10">
	  <table class="table table-bordered">
	    <tr>
	      <td colspan="2" class="text-center"><h2>로그인</h2></td>
	    </tr>
	    <tr>
	      <th>아이디</th>
	      <td><input type="text" name="mid" autofocus class="form-control"/></td>
	    </tr>
	    <tr>
	      <th>비밀번호</th>
	      <td><input type="password" name="pwd" class="form-control"/></td>
	    </tr>
	    <tr>
	      <td colspan="2" class="text-center">
	        <input type="submit" value="로그인" class="btn btn-success mr-4"/>
	        <input type="reset" value="취소" class="btn btn-warning"/>
	      </td>
	    </tr>
	  </table>
  </form>
</div>
<p><br/></p>
</body>
</html>