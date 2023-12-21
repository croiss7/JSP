<%@ page language="java" contentType="application/json; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.*, org.json.*"%>
<%@ page
	import="com.jsp.dao.*, com.jsp.dto.*, com.jsp.system.DBConnector"%>

<%
	try (DBConnector con = new DBConnector();) {
		if (! request.getMethod().equalsIgnoreCase("GET"))throw new Exception();

		BoardDAO map = con.OpenMap(request, BoardDAO.class);

		BoardUser user = 
				map.getBoardUserCheck(request.getParameter("id"), request.getParameter("pw"));

		if (user == null) throw new Exception();
		map.insertBoard(request.getParameter("title"), user.getId());
		
		response.getWriter().write("Succeed");

	} 	catch (Exception e) {
			response.getWriter().write("잘못된 접속이거나 비정상적인 정보");

	}

/* try(DBConnector con = new DBConnector();){
	BoardDAO map = con.OpenMap(request, BoardDAO.class); 
	
	Map<String, Object> result = new HashMap<String, Object>();
	
	//id 비번비교
	if(request.getQueryString() == request.getParameter("id")){
		if(request.getQueryString() == request.getParameter("pw")){

		//유저 받아와	
		map.insertBoard(request.getParameter("id"), request.getParameter("pw"));
		BoardUser exec = 
		map.getBoardUserById(Integer.parseInt(request.getParameter("id")));
	  	result.put("data", exec);	
		
	
	  response.getWriter().write("작성 완료");		  
		}
	}else{
		response.getWriter().write("작성 실패");	
	}
	}catch(Exception e) {} */
%>