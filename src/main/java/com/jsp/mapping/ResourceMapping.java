package com.jsp.mapping;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;

@WebServlet(urlPatterns = {
		"/resources/*",
		"/resource/*" 
		}, initParams = {
				@WebInitParam(name = "key", value = "값")
		})
											
public class ResourceMapping extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// getInitParameter("key"); WebInitParam의 기본 호출
		resp.setCharacterEncoding("utf-8");

		String info = req.getPathInfo();
		String token = info.substring(info.lastIndexOf('.') + 1);
		if(token.equalsIgnoreCase("js")) {
			resp.setContentType("application/javascript");
			try(OutputStream out = resp.getOutputStream();
					InputStream in = getServletContext().getResourceAsStream("/WEB-INF/resources/" + token + info);){
				out.write(in.readAllBytes());
			}catch(Exception e) {}	
		}
		else if(token.equalsIgnoreCase("css")) {
			resp.setContentType("text/css");
			try(OutputStream out = resp.getOutputStream();
					InputStream in = getServletContext().getResourceAsStream("/WEB-INF/resources/" + token + info);){
				out.write(in.readAllBytes());
			}catch(Exception e) {}	
		}
		else if(token.equalsIgnoreCase("jpeg") || token.equalsIgnoreCase("jpg")) {
			resp.setContentType("image/jpeg");
			try(OutputStream out = resp.getOutputStream();
					InputStream in = getServletContext().getResourceAsStream("/WEB-INF/resources/" + "image/original" + info);){
				out.write(in.readAllBytes());
			}catch(Exception e) {}
		}
		else if(token.equalsIgnoreCase("png")) {
			resp.setContentType("image/png");
			try(OutputStream out = resp.getOutputStream();
					InputStream in = getServletContext().getResourceAsStream("/WEB-INF/resources/" + "image/original" + info);){
				out.write(in.readAllBytes());
			}catch(Exception e) {}	
		}
		else if(token.equalsIgnoreCase("gif")) {
			resp.setContentType("image/gif");
			try(OutputStream out = resp.getOutputStream();
					InputStream in = getServletContext().getResourceAsStream("/WEB-INF/resources/" + "image/original" + info);){
				out.write(in.readAllBytes());
			}catch(Exception e) {}	
		}
		
	}
		
		
		
//		// text 이전, application 최신

//		String id =req.getParameter("id");
//
//		getServletContext();
//		InputStream a = getServletContext().getResourceAsStream("/WEB-INF/resources/js/a.js");
//
//		resp.setContentType("text/html");//내용물의 MIME 정보 -resources의 자료형- 를 세팅하는 메서드
//		resp.setCharacterEncoding("utf-8");
//		PrintWriter out = resp.getWriter();
//		out.append(new String(a.readAllBytes()));
//		a.close();
//		out.append("<div>"+id+"</div>");
//		out.append(getServletContext().getContextPath());
//		out.append("<ol>");
//		for(int i =0; i<10; i++) {
//			
//			out.append("<li>");
//			out.append(Integer.toString(i));
//			out.append("</li>");
//			
//		}
//		out.append("</ol>");

		// text/html ->기본값 ()
//		resp.getWriter().append("<div>내용</div>");
//		resp.getWriter().append("응답 내용2");
//		resp.getWriter().append("응답 내용3");
//		resp.getWriter().append("응답 내용4");
	}

