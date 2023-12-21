<%@ page language="java" contentType="application/json; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%@ page import="java.util.*, org.json.*"%>
	<%@ page import="com.jsp.dao.*, com.jsp.dto.*, com.jsp.system.DBConnector"%>
	
<%
	try(DBConnector con = new DBConnector();){
		BoardDAO map = con.OpenMap(request, BoardDAO.class); 		
		List<Board> exec = null;
		
		
		
		if(request.getParameter("searchtype") == null || 
				request.getParameter("searchtype").equalsIgnoreCase("all"))
			exec = map.getBoardAll();
		else if(request.getParameter("searchtype").equalsIgnoreCase("title"))
			exec = map.getBoardByTitle(request.getParameter("title"));
		
		
		
		
		  Map<String, Object> result = new HashMap<String, Object>();
		  result.put("data", exec);	  
		  response.getWriter().write(new JSONObject(result).toString());		  
		  
	
		  }catch(Exception e) {}
		 
		 %>