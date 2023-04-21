<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>test2.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>성적자료</h2>
  <form name="myform" method="post" action="<%=request.getContextPath()%>/t0423/Test2Ok">
    <p>성명 : <input type="text" name="name" value="홍길동" class="form-control"/></p>
    <p>학번 : <input type="text" name="hakbun" value="A1234" class="form-control"/></p>
    <p>국어 : <input type="number" name="kor" value="100" class="form-control"/></p>
    <p>영어 : <input type="number" name="eng" value="90" class="form-control"/></p>
    <p>수학 : <input type="number" name="mat" value="80" class="form-control"/></p>
    <p>사회 : <input type="number" name="soc" value="70" class="form-control"/></p>
    <p>과학 : <input type="number" name="sci" value="60" class="form-control"/></p>
    <p>
      <input type="submit" value="전송" class="btn btn-success" />
      <input type="reset" value="다시입력" class="btn btn-warning" />
    </p>
  </form>
</div>
<p><br/></p>
</body>
</html>