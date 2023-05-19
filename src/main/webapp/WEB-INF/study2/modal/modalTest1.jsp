<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>modalTest1.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br/></p>
<div class="container">
  <h2>Modal 연습1</h2>
  <hr/>
  <h5>메세지 띄우기</h5>
  <p>
    <input type="button" value="표준모달창" class="btn btn-primary" data-toggle="modal" data-target="#myModal1"/>
    <input type="button" value="부드러운모달창" class="btn btn-secondary" data-toggle="modal" data-target="#myModal2"/>
    <input type="button" value="중앙모달창" class="btn btn-info" data-toggle="modal" data-target="#myModal3"/>
    <!-- <input type="button" value="크기변경(작은모달)" class="btn btn-warning" data-toggle="modal" data-target="#myModal4"/> -->
    <input type="button" value="크기변경(큰모달)" class="btn btn-warning" data-toggle="modal" data-target="#myModal4"/>
    <input type="button" value="내용이많은모달1" class="btn btn-danger" data-toggle="modal" data-target="#myModal5"/>
    <input type="button" value="내용이많은모달2" class="btn btn-success" data-toggle="modal" data-target="#myModal6"/>
  </p>
</div>

<!-- 표준 Modal -->
<div class="modal" id="myModal1">
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Modal Heading</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <!-- Modal body -->
      <div class="modal-body">
        Modal body..
      </div>
      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<!-- 부드러운 Modal(fade) -->
<div class="modal fade" id="myModal2">	<!-- fade 추가 -->
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Modal Heading</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <!-- Modal body -->
      <div class="modal-body">
        Modal body..
      </div>
      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<!-- 중앙출력 Modal(modal-dialog-centered) -->
<div class="modal fade" id="myModal3">	<!-- fade 추가 -->
  <div class="modal-dialog modal-dialog-centered">	<!-- 추가 : modal-dialog-centered -->
    <div class="modal-content">
      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Modal Heading</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <!-- Modal body -->
      <div class="modal-body">
        Modal body..
      </div>
      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<!-- samll/large/x-lirge Modal() -->
<div class="modal fade" id="myModal4">	<!-- fade 추가 -->
  <div class="modal-dialog modal-dialog-centered modal-xl">	<!-- 추가 : modal-dialog-centered -->
    <div class="modal-content">	<!-- modal-sm/modal-lg/modal-xl -->
      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Modal Heading</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <!-- Modal body -->
      <div class="modal-body">
        Modal body..
      </div>
      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<!-- 내용이 긴 Modal 처리(스크롤처리) -->
<div class="modal fade" id="myModal5">	<!-- fade 추가 -->
  <div class="modal-dialog modal-dialog-centered">	<!-- 추가 : modal-dialog-centered -->
    <div class="modal-content">	<!-- modal-sm/modal-lg/modal-xl -->
      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Modal Heading</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <!-- Modal body -->
      <div class="modal-body">  <!-- 긴 문장은 Modal body안에 넣어준다. -->
        <p>Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body..</p> 
        <p>Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body..</p> 
        <p>Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body..</p> 
      </div>
      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<!-- 내용이 긴 Modal 처리(스크롤처리2 : modal-dialog-scrollable) -->
<div class="modal fade" id="myModal6">	<!-- fade 추가 -->
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">	<!-- 추가 : modal-dialog-centered -->
    <div class="modal-content">	<!-- modal-sm/modal-lg/modal-xl -->
      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Modal Heading</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <!-- Modal body -->
      <div class="modal-body">  <!-- 긴 문장은 Modal body안에 넣어준다. -->
        <p>Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body..</p> 
        <p>Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body..</p> 
        <p>Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body.. Modal body..</p> 
      </div>
      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>