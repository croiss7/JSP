<!-- html 주석  -->
<%--
	JSP 주석 
 컴파일 과정에서 우선 자바 문법을 실행 코드로 번역
 번역된 JVM이 실행되어 HTML 만들어냄 

'<% %>'가 적혀있는 부분에서 JSP문법이 동작한다고 알려줌
- 스크립틀릿이라 부름
 자바 문법이 동작하는 구간
스크릿틀릿이 HTML을 포함하거나 HTML에 스크립틀릿이 포함되어도 동작

자바 문법의 특수 목적 코드(import 같은 거)는 어떻게 작성?
JSP도 이에 대응하는 특수 문법을 가지고 있음

 지시어 = @ + 키워드
 지시어들은 알아보기 쉽게 key = value 형식
1. @page		 : 페이지 세팅 밑에 써있음 앞에 @가 붙어있음
<%@	language : 스크립틀릿(java, javascript, ruby...) 요소들은 나눠서 적어도 됨
<%@	import="java.util.Scanner,java.io.IOException;"%>
<%@ extends=
	
	
2. include
	외부의 JSP를 내장시키는 지시어
<%@ include file="/include.jsp"%>



3. taglib => 태그가 기록된 라이브러리를 불러오는 태그
	==액션 태그
	쓰는 건 태그인데 작동은 자바로
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
 	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
 	<c: >
	표현식 <%= %> 이것도 귀찮음
	식이 아닌 단순 값 출력을 위한 기능
	표현언어 (EL)
	${}사이에 넣은 값을 출력하는 기능
	간단한 수식이나 출력문 표현 가능
	원래 < , = , >= 안됐는데 이제 됨
	=  eq
	!= ne
	<  lt
	>  gt
	>= ge
== null -> empty
instanceof

	<fn: -> 이건 특별한 녀석 함수라서 taglib으로 넣기는 부적합
	${fn:length}
	${fn:toUpperCase}
	${fn:substring}
	그냥 우리 쓰는 거 함수 넣어놓음
	
	<fmt: -> format 
	<fmt:formatDate value ="2023/11/15" pattern=:YY-MM-DD/'>
	
--%>
<%-- <%@ page extends="com.jsp.test.JSPSuper"%>--%>





<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page buffer="8kb"%><%-- 임시 저장용량의 크기 제한 --%>
<%@ page autoFlush="true"%>
<%-- true는 지운다, false는 오류띄운다 --%>
<%-- <%@ page errorPage="/error.jsp"%>
<%@ page isErrorPage="true"%>jsp를 받았을 때 띄울 에러 메세지
<% exception.~~ %> --%>
<%@ page session="true"%><%-- 이 페이지에서 자동으로 세션을 만들게 허용할 거냐? (서버에 저장되는 세션만) --%>
<%
session.setMaxInactiveInterval(30);
%><%-- 세션의 수명(초) --%>




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- <jsp:forward page="/include.jsp">
사용자에게 현재 페이지 껍데기는 유지하고 내용물만 원하는 페이지로 이동시킬 때
</jsp:forward> --%>
		<%-- 이렇게 파라미터를 전달 할 수도 있음 --%>

<!-- 자바빈을 변수로 불러오고 값을 세팅하거나 불러오는 방법-->	

<!-- scope => 변수 수명 키워드 
 1. page(default)	: 해당 페이지 안에서만 유효 
 2. request			: 요청 받으면 요쳥이 사라질때까지 계속 유지
 3. session 		: 접속 끊어질 때까지- 세션이 사라질 때까지
 4. application 	: 해당 프로그램이 끊어질 때까지 모든 유저가 공유하는 변수
 -->	
 
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
 
 
	<jsp:useBean id="limit" class="com.jsp.test.bean" scope="request"/>
	<jsp:setProperty name="limit" property="x" value="10"/>
	<jsp:getProperty name="limit" property="x"/>
	
	
	<!-- setProperty에 값을 할당하지 않으면 request.getParameter(property)값을 넣는다 
	액션 태그를 이용한 bean은 정보를 그대로 쓰는 용도
	데려오고 싶으면 limit.getY() 메소드로 호출해야 함
	-->	
	${1>2}
	${empty limit}
	
	
	
	<c:set var="now" value="<%= new java.util.Date() %>" />
	<fmt:formatDate value="${now}" type="date" dateStyle="full" /> <br>
	
	
	<jsp:include page="/include.jsp">
		<jsp:param name="y" value="${limit.y}"/>
	</jsp:include>
	
	
<%-- 	<%@ include file="/include.jsp"%>--%>	
	
	
	
	<img src ="<%="HTML 사이에 스크릿틀릿을 넣어도 작동" %>" alt=""/>
	<ol>
		<%
		for (int i = 0; i < 10; i++) {
		%>
		<li><%=i%></li>
		<%
		}
		%>
	</ol>
</body>
</html>