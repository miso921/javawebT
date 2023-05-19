<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>photoView2.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <script>
    'use strict';
    
    // 이미지 여러장 미리보기
    $(document).ready(function(){
    	$("#photoViewCloseBtn").hide();
    	$("#btnView").hide();
    	$("#demo").hide();
    	
    	$("#fName").on("change", multiImageCheck);		// 파일속성에 그림이 들어오게되면 multiImageCheck함수를 호출한다.
    });
    
    function multiImageCheck(e) {
    	// 그림파일 체크
    	let files = e.target.files;
    	let filesArr = Array.prototype.slice.call(files);
    	
    	filesArr.forEach(function(f){
    		if(!f.type.match("image.*")) {
    			alert("업로드할 파일은 이미지파일만 가능합니다.");
    			//return false;
    		}
    	});
    	
    	// 멀티파일 이미지 미리보기
    	let i = e.target.files.length;
    	for(let image of e.target.files) {
    		let img = document.createElement("img");
    		let reader = new FileReader();
    		reader.onload = function(e) {
    			img.setAttribute("src", e.target.result);
    			img.setAttribute("width", 200);
    		}
    		reader.readAsDataURL(e.target.files[--i]);
    		document.querySelector(".imgDemo").appendChild(img);
    	}
    }
    
    // 파일이 선택되었는지 체크후 파일이 있으면 전송처리한다.
    function fCheck() {
    	let fName = myform.fName.value;
    	if(fName.trim() == "") {
    		alert("파일을 선택하세요");
    	}
    	else {
    		myform.submit();
    	}
    }
    
    // 선택된 사진 삭제하기
    function selectDeleteCheck() {
    	let ans = confirm("선택된 파일을 삭제 하시겠습니까?");
    	if(!ans) return false;
    }
    
    // 사진첩 내용 닫기
    function photoClose() {
    	/* 
    	$("#photoViewBtn").show();
    	$("#photoViewCloseBtn").hide();
    	$("#btnView").hide();
    	$("#demo").hide();
    	 */
    	location.reload();
    }
    
    // 서버에 저장된 사진 보기
    function photoView() {
    	$("#photoViewBtn").hide();
    	$("#photoViewCloseBtn").show();
    	$("#btnView").show();
    	$("#demo").show();
    	
    	$.ajax({
    		type : "post",
    		url  : "${ctp}/PhotoViewList.st",
    		success:function(res) {
    			$("#demo2").html(res);					// 앞에서 JSON자료로 변환되어 넘어온 자료를 demo2에 출력해 보자.
    			let parsed = JSON.parse(res);		// JSON자료를 자바스크립트에서 사용하기위한 파싱처리한다.
    			let items = parsed.data;
    			for(let i=0; i<items.length; i++) {
    				addPhotoView(items[i].key);
    			}
    		},
    		error :function() {
    			alert("전송오류!");
    		}
    	});
    }
    
    // 앞에서 가져온 사진들을 출력시킬 준비를 하자...(demo에 출력)
    function addPhotoView(photo) {
    	$("#demo").append('<div class="row text-center">'
    		+ '<div class="col"><input type="checkbox" name="chk" class="chk" value="'+photo+'" /></div>'
    		+ '<div class="col">'+photo+'</div>'
    		+ '<div class="col"><img src="${ctp}/images/photoView/'+photo+'" width="150px" /></div>'
    		+ '<div class="col"><input type="button" value="삭제" onclick="photoDelete(\''+photo+'\')" class="btn btn-danger btn-sm" /></div>'
    		+ '</div><hr/>'
    	);
    }
    
    // 서버에 저장된 개별파일 삭제하기
    function photoDelete(fileName) {
    	let ans = confirm("선택된 파일을 삭제하시겠습니까?");
    	if(!ans) return false;
    	
    	$.ajax({
    		type  : "post",
    		url   : "${ctp}/PhotoViewDelete.st",
    		data  : {fileName : fileName},
    		success:function(res) {
    			if(res == "1") {
    				alert("삭제 완료!");
    				location.reload();
    			}
    			else {
    				alert('삭제 실패');
    			}
    		},
    		error : function() {
    			alert("전송오류!");
    		}
    	});
    }
    
    // 사진 전체 선택하기 / 전체 해제 하기
    $(function(){
    	$(".checkAll").click(function(){
    		if($(".checkAll").prop("checked")) {
    			$(".chk").prop("checked", true);
    		}
    		else {
    			$(".chk").prop("checked", false);
    		}
    	});
    });
    
    // 선택항목 반전처리
    $(function() {
    	$("#reverseAll").click(function(){
    		$(".chk").prop("checked", function(){
    			return !$(this).prop("checked");
    		});
    	});
    });
    
    // 선택한 항목 삭제처리(여러개 삭제처리)
    function selectDeleteCheck() {
    	if(photoForm.chk.length == 0) {
    		alert("삭제할 사진을 선택하세요");
    		return false;
    	}
    	
    	let ans = confirm("선택된 모든 사진들을 삭제하시겠습니까?");
    	if(!ans) return false;
    	
    	let delItems = "";
    	for(let i=0; i<photoForm.chk.length; i++) {
    		if(photoForm.chk[i].checked) delItems += photoForm.chk[i].value + "/"; 
    	}
    	delItems = delItems.substring(0,delItems.length-1);
    	
    	$.ajax({
    		type : "post",
    		url  : "${ctp}/PhotoViewDeleteAll.st",
    		data : {delItems : delItems},
    		success:function(res) {
    			if(res = "1") {
    				alert("삭제완료!");
    				location.reload();
    			}
    			else {
    				alert("삭제실패");
    			}
    		},
    		error : function() {
    			alert("전송오류!");
    		}
    	});
    }
    
    /*
    // 개별파일 삭제처리하기
    function photoDelete(fileName) {
    	let ans = confirm("선택된 파일을 삭제하시겠습니까?");
    	if(!ans) return false;
    	
    	// 사진 1개 삭제처리한다.
    	$.ajax({
    		type : "post",
    		url  : "${ctp}/PhotoViewDelete.st",
    		data : {fileName : fileName},
    		success:function(res) {
    			if(res = "1") {
    				alert("삭제완료!");
    				location.reload();
    			}
    			else {
    				alert("삭제실패");
    			}
    		},
    		error : function() {
    			alert("전송오류!");
    		}
    	});
    }
    */
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br/></p>
<div class="container">
  <h2>업로드 사진 미리보기2</h2>
  <form name="myform" id="myform" method="post" action="${ctp}/PhotoView2Ok.st" enctype="multipart/form-data">
  	<hr/>
  	<div>
  	  <input type="file" name="fName" id="fName" multiple class="form-control-file border mb-2" />
  	  <!-- <img id="demo" width="150px"/> -->
  	</div>
  	<div class="imgDemo"></div>
  	<br/>
  	<div>
  	  사진 설명
  	  <textarea rows="4" name="content" id="content" class="form-control mb-3" placeholder="사진설명을 입력하세요."></textarea>
  	</div>
  	<div class="row">
  	  <div class="col"><input type="button" value="전송" onclick="fCheck()" class="btn btn-success form-control mb-2"/></div>
  	  <div class="col"><input type="button" value="다시선택" onclick="location.reload()" class="btn btn-warning form-control mb-2"/></div>
  	  <div class="col"><input type="button" value="1장업로드이동" onclick="location.href='${ctp}/PhotoView1.st';" class="btn btn-info form-control mb-2"/></div>
  	  <div class="col">
  	    <input type="button" value="사진첩보기" onclick="photoView()" id="photoViewBtn" class="btn btn-primary form-control mb-2"/>
  	    <input type="button" value="사진첩닫기" onclick="photoClose()" id="photoViewCloseBtn" class="btn btn-primary form-control mb-2"/>
  	  </div>
  	</div>
  </form>
  <hr/>
  <div id="btnView" class="row text-center">
    <div class="col custom-control custom-switch">
      <input type="checkbox" name="switch1" id="switch1" class="custom-control-input checkAll">
      <label for="switch1" class="custom-control-label">전체선택/해제</label>
    </div>
    <div class="col"><button type="button" id="reverseAll" class="btn btn-secondary">선택반전</button></div>
    <div class="col"><button type="button" onclick="selectDeleteCheck()" class="btn btn-danger">선택삭제</button></div>
  </div>
  <hr />
  <form name="photoForm">
    <div id="demo"></div>
  </form>
  <h3>전송된 자료값?</h3>
  <div id="demo2"></div>
  <hr/>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>