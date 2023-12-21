<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--스크립틀릿 식 툴력이 안됨
out.내장객체를 이용해서 출력해야하는데 불편
그래서 나온 게 표현식
<%= 표현식 => 출력할 것이다
<%! 선언할 것이다


귀찮잖아? 액션 태그
스크립틀릿이나 지시어를 이용해서 복잡하게 작성해야 하는 기능 중 몇 개를 간단하게 이용 가능
태그 모양이지만 자바 동작을 함
URL을 만들어내는 태그 대부분에 사용 가능한 녀석들
<jsp:include> <%@ include 랑 똑같은데 좀 더 값에 변화를 줄 수 있음
Integer.parseInt(request.getParameter("y"))


<jsp:forward>

 --%>

 	<jsp:useBean id="limit" class="com.jsp.test.bean" scope="request"></jsp:useBean>
 	
 	
 	<jsp:getProperty name="limit" property="x" />
 	<jsp:setProperty name="limit" property="x" value="6"/>
 	<jsp:setProperty name="limit" property="y" value="11"/>
 	
 
<%-- <%! public int s = 5; %>--%>	
 <table>
		<%for (int y = 1; y <limit.getY(); y++) {%>
		<tr>
			<%for (int x = 1; x < limit.getX(); x++) {%>
			<td><%=y*x%></td>
			<%}%>
			</tr>
		<%}%>
	</table>

</body>
</html>