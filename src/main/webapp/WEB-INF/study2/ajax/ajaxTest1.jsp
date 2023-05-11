<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>ajaxTest1.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <script>
    'use strict';
    
    // 일반 아이디 검색
    function idCheck() {
    	// let mid = document.myform.mid.value;
    	// let mid = document.getElementById("mid").value;
    	let mid = $("#mid").val();
    	
    	if(mid.trim() == "") {
    		alert("아이디를 입력하세요!");
    		// document.myform.mid.focus();
    		// document.getElementById("mid").focus();
    		$("#mid").focus();
    		return false;
    	}
    	location.href = "${ctp}/AjaxTest1_1?mid="+mid;
    }
    
    // aJax를 이용한 아이디 검색
    function idCheck1() {
    	let mid = $("#mid").val();
    	
    	if(mid.trim() == "") {
    		alert("아이디를 입력하세요~~~~");
    		$("#mid").focus();
    		return false;
    	}
    	
    	let query = {
    			mid: mid,
    	}
    	
    	$.ajax({
    		url  : "${ctp}/AjaxTest1_2",
    		type : "get",
    		data : query,
    		contextType: "application/json",
    		charset : "uft-8",
    		success : function(res) {
    			alert("서버에 성공적으로 다녀왔습니다. => " + res);
    			$("#demo").html(res);
    		},
    		error : function() {
    			alert("전송 실패~~");
    		}
    	});
    }
    
    function idCheck2() {
			let mid = $("#mid").val();
    	
    	if(mid.trim() == "") {
    		alert("아이디를 입력하세요~~~~");
    		$("#mid").focus();
    		return false;
    	}
    	
    	$.ajax({
    		url  : "${ctp}/AjaxTest2",
    		type : "post",
    		data : {mid: mid},
    		success:function(res) {
    			$("#demo").html(res);
    			let str = res.split("/");
    			$("#tMid").html(str[0]);
    			$("#name").html(str[1]);
    			$("#nickName").html(str[2]);
    			$("#gender").html(str[3]);
    			$("#point").html(str[4]);
    		},
    		error : function() {
    			alert("전송오류!!");
    		}
    	});
    }
    
    function idCheck3() {
			let mid = $("#mid").val();
    	
    	if(mid.trim() == "") {
    		alert("아이디를 입력하세요~~~~");
    		$("#mid").focus();
    		return false;
    	}
    	
    	$.ajax({
    		type : "post",
    		url  : "${ctp}/AjaxTest3",
    		data : {mid: mid},
    		success:function(res) {
    			res = res.substring(res.indexOf("[")+1,res.lastIndexOf("]"));
    			$("#demo").html(res);
    			
    			$("#tMid").html(res.substring(res.indexOf("mid=")+4,res.indexOf(",",res.indexOf("mid="))));
    			$("#name").html(res.substring(res.indexOf("name=")+5,res.indexOf(",",res.indexOf("name="))));
    			$("#nickName").html(res.substring(res.indexOf("nickName=")+8,res.indexOf(",",res.indexOf("nickName="))));
    			$("#gender").html(res.substring(res.indexOf("gender=")+6,res.indexOf(",",res.indexOf("gender="))));
    			$("#point").html(res.substring(res.indexOf("point=")+5,res.indexOf(",",res.indexOf("point="))));
    		}
    	});
    }
    
    function idCheck4() {
			let mid = $("#mid").val();
    	
    	if(mid.trim() == "") {
    		alert("아이디를 입력하세요~~~~");
    		$("#mid").focus();
    		return false;
    	}
    	
    	$.ajax({
    		type  : "post",
    		url   : "${ctp}/AjaxTest4",
    		data  : {mid: mid},
    		success:function(res) {
    			console.log("res", res);
    			$("#demo").html(res);
    			let js = JSON.parse(res);
    			console.log("js", js);
    			
    			$("#tMid").html(js.mid);
    			$("#name").html(js.name);
    			$("#nickName").html(js.nickName);
    			$("#gender").html(js.gender);
    			$("#point").html(js.point);
    		},
    		error : function() {
    			alert("전송실패~~");
    		}
    	});
    }
    
    // vos형태의 값을 처리
    function idCheck5() {
			let mid = $("#mid").val();
    	
    	if(mid.trim() == "") {
    		alert("아이디를 입력하세요~~~~");
    		$("#mid").focus();
    		return false;
    	}
    	
    	$.ajax({
    		type  : "post",
    		url   : "${ctp}/AjaxTest5",
    		data  : {mid: mid},
    		success:function(res) {
    			$("#demo").html(res);
    			let js = JSON.parse(res);
    			console.log("js", js);
    			/*
    			$("#tMid").html(js[0].mid);
    			$("#name").html(js[0].name);
    			$("#nickName").html(js[0].nickName);
    			$("#gender").html(js[0].gender);
    			$("#point").html(js[0].point);
    			*/
    			let tMid="", tName="", tNickName="", tGender="", tPoint="";
    			for(let j of js) {
    				tMid += j.mid + "/";
    				tName += j.name + "/";
    				tNickName += j.nickName + "/";
    				tGender += j.gender + "/";
    				tPoint += j.point + "/";
    			}
    			$("#tMid").html(tMid);
    			$("#name").html(tName);
    			$("#nickName").html(tNickName);
    			$("#gender").html(tGender);
    			$("#point").html(tPoint);
    		},
    		error : function() {
    			alert("전송오류~~");
    		}
    	});
    }
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br/></p>
<div class="container">
  <h2>aJax연습</h2>
  <hr/>
  <form name="myform">
    아이디 : <input type="text" name="mid" id="mid" class="mb-2"/> &nbsp;
    <input type="button" value="아이디일반검색" onclick="idCheck()" class="btn btn-success"/><br/>
    <hr/>
    aJax검색 : <br/>
    <input type="button" value="아이디검색1" onclick="idCheck1()" class="btn btn-warning"/>&nbsp;
    <input type="button" value="아이디검색2" onclick="idCheck2()" class="btn btn-primary"/>&nbsp;
    <input type="button" value="아이디검색3" onclick="idCheck3()" class="btn btn-secondary"/>&nbsp;
    <input type="button" value="아이디검색4" onclick="idCheck4()" class="btn btn-danger"/>&nbsp;
    <input type="button" value="아이디검색5" onclick="idCheck5()" class="btn btn-info"/>&nbsp;
    
    <div>출력결과 : <span id="demo"></span></div>
    <hr/>
    <div>
      <div>아이디 : <span id="tMid"></span></div>
      <div>성명 : <span id="name"></span></div>
      <div>별명 : <span id="nickName"></span></div>
      <div>성별 : <span id="gender"></span></div>
      <div>포인트 : <span id="point"></span></div>
    </div>
    <hr/>
  </form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>