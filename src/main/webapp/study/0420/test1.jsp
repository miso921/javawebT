<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>test1.jsp</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script> -->
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>그림파일 불러오기연습</h2>
  <p><img src="../../images/1.jpg" width="150px"/></p>
  <p><img src="<%=request.getContextPath()%>/images/2.jpg" width="150px"/></p>
  <hr/>
  <p>
    <%
      for(int i=1; i<=6; i++) {
      	out.print("<img src='"+request.getContextPath()+"/images/"+i+".jpg' width='150px'/> &nbsp;");
      }
    %>
  </p>
</div>
<p><br/></p>
</body>
</html>