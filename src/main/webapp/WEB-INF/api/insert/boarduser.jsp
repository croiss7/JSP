<%@ page language="java" contentType="text/plain; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%@ page import="java.util.*, org.json.*"%>
	<%@ page import="com.jsp.dao.*, com.jsp.dto.*, com.jsp.system.DBConnector"%>
	
	
	
	<%-- 게시글 작성 api
	삭제 api
	작성은 유저 name과 유저 password를 받아서유저 판별 후 아니면 reject
	title 받아와서 해당 유저의 게시글 작성
	삭제는 유저 name 비번 받아서 확인 후 아니면 reject
	맞으면 board id 삭제 --%>
	
<%

	try(DBConnector con = new DBConnector();){
	if(request.getMethod().equalsIgnoreCase("GET")) throw new Exception();
		
		
		
		BoardDAO map = con.OpenMap(request, BoardDAO.class); 
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		map.insertBoardUser(request.getParameter("id"), request.getParameter("pw"));
		
		
		response.getWriter().write("Succeed");		 

	
		  }catch(Exception e) {
			  response.getWriter().write("잘못된 접속이거나 비정상적인 정보");
			  
		  }
		 
%>