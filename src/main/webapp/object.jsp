<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true" isErrorpage="true"%>
<%@ page import ="javax.servlet.http.Cookie"%>

	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체</title>
</head>
<!-- 
0.page -> 나, 이 페이지
	1) page는 다른 모든 JSP, HTML 등을 방다와야 하니까 자료형은 최상위인 object
	2) 모든 JSP의 종착역은 servlet이니까 자료형을 servlet으로 해도 된다
	3) 그러니까 page는 모든 정보가 모이고 쓰기 편하려고 모든 내장객체를 page에 몰아넣었음
	4) page는 내장 정보를 포함하는 'this' 같은 거
	
1. request -> 내가 주고받을
	1) 요청인데 뭘 요청했는지 그냥 알 수 없음 이름을 붙여줘야 함
	2) 변수뿐만 아니라 메소드도 받아옴
	3) 세팅된 값을 가져오는 역할
	
2. response
	1) attribute 같은 건 없다 그냥 요청받으면 값을 돌려줄 뿐	
	
	
3. session
	1) @@@@@@@ 이건 서버의 세션	@@@@@@@
	2) 서버에서 사용자의 연결을 확인함
	
4. application
	1) 전체 서버에 관한 데이터를 가짐
	2) 기본적으로 비슷비슷한 녀석들

5.pageContext
	1) 페이지에 대한 전체 내용
	2) 당연히 위의 내용들을 전부 사용할 수 있다
	3) application은 없고 servlet으로 쓴다
	   pageContext.getServletContext();

	
	 -->
	
<body>
	<%-- 
	<%
	request.getContentType();
	request.getParameter("ID");
	request.getParameterNames();
	request.getParameterValues("datas"); /* 여러 개 배열로 받아옴 */
	request.getMethod();
	request.getHeader("Content-Disposition;referer");   /* ;별로 분류해줌 */
/* 	Content-Disposition 	다운받을때 저장할 폴더 변경할래
	referer 				정당하지 않은 접근 차단, 
	User-Agent 				접속 기기
	Host 					정보 요청한 도메인(localhost) */
	request.setAttribute("key", "value");
	request.getAttribute("key");
	request.removeAttribute("key");
	/* 리퀘스트의 변수 저장용 forward로 이동해도 남아았어서 쓸 수 있게 만듬 */
	
	request.getRemoteAddr();	/* 사용자 ip 주소 가져옴 */
	request.getRemoteHost();	/* 도메인 주소 가져옴 */
	request.getCookies();		/* 쿠키는 중요하니까 전용 칸이 있음 */
	request.getSession();
	/* 
	세션은 들어오는 애한테 서버에서 자동으로 만들어주는 거
	위에 page에 false값으로 넣으면 있으면 가져오고, 없으면 null 돌려줌
	그래서 출입 페이지를 만들어서 거기서만 세션을 true로 만들어주고 나머지는 false로 하면 출입증처럼 다른 접근 막음 */
	
	request.getContextPath();	/* server.xml Context path="/"  */
	request.getInputStream();	/* 서버가 유저에게서 입력 정보 받아올 때 */
	request.getLocale(); 		/* 언어 세팅 */
	request.getLocales(); 		/* 중국어 몰라 -> 영어로 봐 ch-ko */
	request.getCharacterEncoding(); //utf-8
	request.getServletPath();	/* context+  */
	
	request.getServletContext();// 서블렛에 담겨있는 내장 객체들
	request.getPathInfo();		// 주소 분석해줌
	
	request.getParts();			//multipart/form-data
	Part part = request.getPart("file");
	part.getInputStream();
	part.getContentType();	//jpg냐?
	part.getHeader("Content-Disposition");
	part.getSize();			//크기
	part.getName();			//이름
	part.write("/a.bmp");	//InputStream이나 임시 장소에 있던 거 다 지우고 저장
	part.delete();			//용량이 커서 임시 저장된 파일 삭제
	
	part.getSubmittedFileName();//사용자가 쓰던 파일명
	
	
	request.getRequestURL(); request.getRequestURI();//전체경로 내놔
	
	RequestDispatcher patcher = request.getRequestDispatcher("/index.jsp");
	//리퀘스트 변경 기능
	patcher.forward(request, response); 
	/* request, response를 유지한 상태로 /index.jsp로 이동할 수 있게 한다 */
	patcher.include(request, response);
	
	request.isSecure();//https:냐
	%>
	--%>
	
	<%--
	<% 
	response.setContentType("text/html");
	response.setCharacterEncoding("utf-8");
	response.getWriter().append("out내장 객체를 구하는 메서드");  // = out.append(); 이거랑 똑같다
	response.getOutputStream(); //전송하다 문제 생겼을 때 얼마나 갔는지 알아옴
	
	response.sendRedirect("/test.html");//진짜 그 경로로 가라
	response.sendError(404,"에러");// 에러 메시지를 띄울 때 쓴다.
	response.addCookie(new Cookie("key", "value"));
	response.addHeader("key", "value");
	response.setHeader("key", "value");
	response.setIntHeader("key", 5);
	response.setStatus(200); 		//결과 성공, 실패 여부를 숫자 값으로 돌려줌
	%>
	--%>
	
	
	<%-- 
	<%
	session.getAttribute("key");
	session.getAttributeNames();
	session.removeAttribute("key");
	session.removeValue("key");
	
	session.getId();	//세션의 식별자를 구해옴 중간에 세션이 끊겨도 이어서 할 수 있게
	session.isNew(); 	//세션이 있던거냐 아니면 새로 만든거냐
	
	session.getCreationTime();		//언제 처음 접속했냐
	session.getLastAccessedTime();	//마지막 시간
	session.invalidate();			//세션을 없애라 
	session.getMaxInactiveInterval();	//만료 기간
	session.setMaxInactiveInterval(1000);//만료 기간 설정

	%>
	--%>
	
	<%-- 
	<% 
	application.getAttribute("key");
	application.getAttributeNames();
	application.removeAttribute("key");
	application.getInitParameter("초기화 파라미터");
	application.getContext("/test.html");//귀환 지점
	application.getMimeType("/index.html"); //파일의 mime 타입 가져와서 String으로 돌려줌
	application.getRequestDispatcher("/index.html");
	//서버에게 페이지 이동하겠다고 말하고 정보 저장해달라고 만드는 변수
	application.log("console.log()");

	/* exception.
	config. */
	%>
	--%>
	
	<%
	pageContext.getAttribute("key");//기본적으로 똑같음
	pageContext.getAttributeNamesInScope(0); //scope에 따라 수명 결정함
	
	pageContext.getSession();//세션을 외부에서 가져오니까 무조건 생성됨 false값을 넣을 수가 없음
	
	pageContext.forward(""); // 페이지 전체가 배경이니까 굳이 주소를 가져올 필요 없이 바로 가져올 수 있음
	pageContext.getServletContext();
	
	
	%>
	
	
	
	
</body>
</html>










