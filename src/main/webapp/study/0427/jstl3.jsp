<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>jstl3.jpg</title>
  <jsp:include page="/include/bs4.jsp" />
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>Function 라이브러리</h2>
  <pre>
    사용법 : $ { fn:함수명(변수/값....)}
    관계연산자 : ==(eq), !=(ne), <(lt), >(gt), 예외) >=(ge), <=(le)
  </pre>
<%
               //0         1         2
               //012345678901234567890123456
  String atom = "Welcome to My Homepage!";
  pageContext.setAttribute("atom", atom);
  pageContext.setAttribute("atom2", atom);
  
  String[] hobbys = {"등산","낚시","수영","바둑","싸이클","독서"};
  pageContext.setAttribute("hobbys", hobbys);
%>
  <p>
    atom변수의 값? ${atom}<br/>
    1-1.atom변수 값의 길이(length()) : <%=atom.length() %> / ${fn:length(atom)}<br/>
    1-2.hobbys변수 값의 길이 : <%=hobbys.length %> (O) / ${fn:length(hobbys)}<br/><br/>
    2.대문자변환(toUpperCase()) : <%=atom.toUpperCase() %> / ${fn:toUpperCase(atom)}<br/><br/>
    3.소문자변환(toLowerCase()) : <%=atom.toLowerCase() %> / ${fn:toLowerCase(atom)}<br/><br/>
    4-1.문자열추출(substring()) : <%=atom.substring(0,3) %> / ${fn:substring(atom,0,3)}<br/>
    4-2.문자열추출(substring()) : <%=atom.substring(2,5) %> / ${fn:substring(atom,2,5)}<br/>
    4-3.문자열추출(substring()) : <%=atom.substring(2) %> / <%-- ${fn:substring(atom,2)} --%>
    																											${fn:substring(atom,2,fn:length(atom))} /
    																											${fn:substring(atom,2,-1)}<br/><br/>
    5-1.특정문자열의 위치값 검색(indexOf()) : <%=atom.indexOf("o") %> / ${fn:indexOf(atom, 'o')}<br/>
    5-2.특정문자열의 위치값 검색(indexOf()) : <%=atom.lastIndexOf("o") %> / <%-- ${fn:lastIndexOf(atom, 'o')} --%><br/>
      atom변수에 기억되어 있는 'o'문자의 위치를 모두 출력해보자.<br/>
      'o'의 위치는 => 
      <c:set var="cnt" value="0"/>
      <c:forEach var="i" begin="0" end="${fn:length(atom)-1}">
      	<c:if test="${fn:substring(atom,i,i+1) == 'o'}">
      		<c:set var="cnt" value="${cnt + 1}"/>
      		${cnt}번째위치. ${i} //
      	</c:if>
      </c:forEach>
      <br/>
      atom변수값의 'o'문자 개수는? <font color="red">${cnt}</font> 개가 있습니다.<br/>
    5-3.<숙제1><br/>
			String atom = "Welcome to My Homepage!";<br/>
			① 찾고자 하는 문자를 입력받는다.<br/>
			② '찾고자하는 문자'가 atom변수에서 포함된 3번째 위치를 찾아서 출력하시오.(출력시는 검색한 위치값을 모두 출력할것)<br/>
			단, 찾고자 하는 문자가 없다면 '검색문자 없음'이라고 출력하시오. 3번째문자까지를 모두 검색하였다면 더이상 수행하지 않도록 프로그램을 제작하시오.<br/>
			<!-- 풀이 -->
      - (1) atom 변수에 기억된 문자중 입력받은 문자의 위치를 찾아서 변수에 기억시켜둔다.(여기서는 ''o'문자를 검색한다고 하자.) :<br/>
      검색문자 : 'o' : 검색된 위치값?

      <c:set var="position1" value="${fn:indexOf(atom,'o')}"/> <font color='red'><b>${position1}</b></font><br/>
      - (2) substring()을 사용한, 첫번째로 만나는 'o'의 문자 뒤의 모든값을 변수(str1)에 담는방법 :
      < c :set var="str1" value="$ {fn:substring(atom,fn:indexOf(atom,'o')+1,fn:length(atom))}"/> =>
      <c:set var="str1" value="${fn:substring(atom,fn:indexOf(atom,'o')+1,fn:length(atom))}"/>
      <font color='red'><b>${str1}</b></font><br/>
      - (3) 이어서 저장되어 있는 값중에서 'o'문자의 위치를 변수에 담는다. : 
      < c :set var="position2" value="$ {fn:indexOf(str1,'o')}"/> =>
      <c:set var="position2" value="${fn:indexOf(str1,'o')}"/>
      <font color='red'><b>${position2}</b></font><br/>
      - (4) 처음에 저장된 위치와 2번째 저장된 위치를 더하고 +1 시키면 2번째 'o'의 위치가 된다. : 
      <font color='red'><b>${position1 + position2 + 1}</b></font><br/>
      - (5) 앞에서의 반복작업으로 3번째 저장된 문자열의 위치도 검색할 수 있다.<br/><br/>
      
    6.문자열추출(substringBefore() / substringAfter())<br/>
      문자 'o'앞의 문자열 출력substringBefore() : ${fn:substringBefore(atom, 'o')}<br/>
      문자 'o'뒤의 문자열 출력substringAfter() : ${fn:substringAfter(atom, 'o')}<br/><br/>
    7.문자열분리(split(변수,분리할문자)) : 문자분리후에는 분리된 문자들을 '변수'에 담아줘야 한다.<br/>
      예) atom변수의 문자중 'o'문자를 기준으로 분리해 보세요?<br/>
      <c:set var="atoms" value="${fn:split(atom,'o')}"/>
      <c:forEach var="atom" items="${atoms}" varStatus="st">
      	${st.count}. ${atom}<br/>
      </c:forEach>
      atom안에 입력된 'o'문자의 개수는? ${fn:length(atoms) - 1}<br/><br/>
    8-1.문자열 치환(replace())<br/>
      예) atom변수의 'My'를 'Your'로 변경하시오?
      <%=atom.replace("My", "Your") %> / ${fn:replace(atom2, 'My', 'Your')}<br/>
    8-2.문자열 치환(replace())<br/>
      예) atom변수의 'o'를 'O'로 변경하시오?
      <%=atom.replace("o", "O") %> / ${fn:replace(atom2, 'o', 'O')}<br/><br/>
    9.특정문자(열) 포함유무? contains()<br/>
      예) atom2변수에 'o'를 포함하고 있느냐? ${fn:contains(atom2, 'o')}<br/>
      예) atom2변수에 'My'를 포함하고 있느냐? ${fn:contains(atom2, 'My')}<br/>
      예) atom2변수에 'Your'를 포함하고 있느냐? ${fn:contains(atom2, 'Your')}<br/>
  </p>
</div>
<p><br/></p>
</body>
</html>














