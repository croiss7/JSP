package com.jsp.system;


import java.io.IOException;
import java.util.Collection;

import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet(urlPatterns = {
		"/upload/*"
		
})
@MultipartConfig(
		fileSizeThreshold = 1024*1024*5,//파일 하나의 최대 크기
		maxFileSize = 1024*1024*100,
		maxRequestSize = 1024*1024*500
		//location="/WEB-INF/Temp/"//받는데 메모리에 저장 못하면 임시 저장할 경로
	)
public class Upload extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//x-application 문자열 전송방식 , multipart - 바이너리 그대로 하지만 getParam 못씀
		Collection<Part> parts = req.getParts();
		
		for(Part part :parts) {
			
			String header = part.getHeader("Content-Disposition");
			//header -> filename=a.jpg, ~ = ~, ~ = ~ 전부 구문분석 해줘야 알아볼 수 있다.
			String[] headers = header.split(";");
			for (String head:headers) {
				head = head.trim();
				if(head.startsWith("filename")) {
					//application 에 있어야 하는데...
					part.write(req.getRealPath("") + head.split("=")[1].substring(1,head.split("=")[1].length()-1)); //-> 받아온 파일명
					
					
				}
			}
		}
		
		
	}
}


