<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 		<c:set target="limit" property="x" value="0"/>  --%>
	<%--  	<c:remove var="i" scope="page"/>  지울 때 스코프 필수 없으면 못 찾아서 못 지워요--%>





	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<c:out value="Hello" default="base" />
	<c:out value="Hello2">기본값</c:out>

	<c:set var="i" value="0" scope="page" />
	<c:set var="i" scope="page">0</c:set>
	<jsp:useBean id="limit" class="com.jsp.test.bean" scope="request" />


	<%-- 	<c:if test="${i <10}" var "i" scope="page">판별식에 의한 if</c:if>--%>



	<c:catch var="error">
		<c:choose>
			<c:when test="${i = 1}">${i}번</c:when>
			<c:when test="${i = 2}">${i}번</c:when>
			<c:otherwise>아무것도 아니면</c:otherwise>
		</c:choose>
	</c:catch>

	<c:forEach var="j" begin="0" end="10" step="2">
	${j}
	</c:forEach>
	<%
	int[] z = new int[4];
	z[0] = 1;
	z[1] = 2;
	z[2] = 3;
	z[3] = 4;
	%>

	<c:forEach var="p" items="${z}" begin="0" end="3">
	${p}
	</c:forEach>

	<c:forTokens var="j" items="hello;wor;ld" delims=";">
	${j}
	</c:forTokens>

	<c:url var="naver" value="https://www.naver.com/">
		<c:param name="id" value="아이디"></c:param>
	</c:url>

	<a href="${naver}">네이버로 갈래</a>



	<c:import url="/include.jsp" var="in">
		<c:param name="id" value="값" />
	</c:import>


	<%-- <c:redirect url="https://www.naver.com/"/> --%>
	<!-- 	완전히 새 페이지로 날려보냄-->







</body>
</html>














