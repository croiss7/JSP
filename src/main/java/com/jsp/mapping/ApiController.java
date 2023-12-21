package com.jsp.mapping;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {
		"/api/*" 
		})
public class ApiController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		//req에서 getparameter로 id 값 가져와 
		//해당 id값의 검색결과 JSON반환하는 Servlet 으로 변경
		
		
		
		/*
		 * try(DBConnector con = new DBConnector();){ DBMap map = con.OpenMap(req,
		 * DBMap.class); ProdDTO list =
		 * map.getProdById(Integer.parseInt(req.getParameter("id")));
		 * 
		 * Map<String, Object> result = new HashMap<String, Object>();
		 * //List<Map<String, Object>>
		 * 
		 * 
		 * result.put("data", list);
		 * 
		 * resp.getWriter().write(new JSONObject(result).toString());
		 * 
		 * resp.setCharacterEncoding("utf-8"); resp.setContentType("application/JSON");
		 * 
		 * 
		 * 
		 * }catch(Exception e) {}
		 */
				
				
//		try(DBConnector con = new DBConnector();){
//			DBMap map = con.OpenMap(req, DBMap.class);
//			List<ProdDTO> list = map.selectProd();
//			//Map
//			
//			Map<String, Object> result = new HashMap<String, Object>();
//			//List<Map<String, Object>>
//			
//			
//			result.put("data", list);
//			
//			resp.getWriter().write(new JSONObject(result).toString());
//			
//			resp.setCharacterEncoding("utf-8");
//			resp.setContentType("application/json");
//			
//			for(ProdDTO dto : list) {
//				resp.getWriter().printf("%d | %s<br>", dto.getId(),dto.getName());
//			}
//			
//	}catch(Exception e) {}
//		
		
		RequestDispatcher dispatcher = null;
		String path = req.getPathInfo().toLowerCase();
		if(path.endsWith(".jsp"))
			dispatcher = req.getRequestDispatcher("/WEB-INF/api" + path);
		else
			dispatcher = req.getRequestDispatcher("/WEB-INF/api"+ path + ".jsp");
		  
		  dispatcher.forward(req, resp);
		 
	//정보를 규격화함 
	
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doGet(req, resp);
	}
	
	
	
	
}
