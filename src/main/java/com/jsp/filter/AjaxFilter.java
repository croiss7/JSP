package com.jsp.filter;

import java.io.BufferedReader;
import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.json.JSONObject;

import com.jsp.system.Ajax;

public class AjaxFilter implements Filter {

	// 서버 왔다갔다 할 때 전처리를 함, 처리 이후 다음으로 가야하는 객체정보를 체이닝함
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		String result = ""; 
		// 전처리
		if (request.getContentType() != null) {
			if (request.getContentType().equalsIgnoreCase("application/json")) {
				BufferedReader reader = request.getReader();
				String line;
				while ((line = reader.readLine()) != null) {
					result += line;
				}
				JSONObject obj = Ajax.JsonToObj(result);
				request.setAttribute("json", obj);
			}
		}
			if(request.getParameter("password") != null){
				//복호화
				String temp = request.getParameter("password");
				temp = temp.replace("+EncodedData", "");
				 request.setAttribute("password_decoded", temp);
				
				
				System.out.println(request.getParameter("password_decoded") );
			}
		
		System.out.println(result);
		response.setCharacterEncoding("utf-8");
		chain.doFilter(request, response);
		// 후처리
		//response의 setCharacterEncoding은 전처리로 해줘야 내가 받아볼 때 안 깨진다
		
	}

//파일의 입력을 받는 등 추가 동작을 위해서 만듬, 기본 세팅 있음
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
// TODO Auto-generated method stub
		Filter.super.init(filterConfig);
	}

//끝났으면 닫아, 기본 세팅 있음
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		Filter.super.destroy();
	}
}