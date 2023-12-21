package com.jsp.test;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;



@WebServlet(urlPatterns = {
		"/test"
})	
public class DBTest extends HttpServlet{


	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try(InputStream in = 
				req.getServletContext().getResourceAsStream("/WEB-INF/config/mybatis-config.xml");)
		{
			SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
			
			SqlSessionFactory factory = builder.build(in);		
			factory.getConfiguration().addMapper(DBMap.class);
			
			SqlSession session = factory.openSession();//false = 오토커밋을 하지 않겠다 .commit()으로 때림
			
			
			//xml에 검색 방식 일일히 입력하면 귀찮으니까 그냥 interface 씀
			
			
//			
//			List<MovieDTO> movies = map.getMovies();
//			
//			for(MovieDTO dto : movies) {
//				System.out.println(dto.getName());
//				System.out.println(dto.getProd().getName());
//			}
			DBMap map = session.getMapper(DBMap.class);

//			map.insertProd(5,"남준형");
			List<ProdDTO> prods = map.selectProd();
			
			for(ProdDTO dto: prods) {
				System.out.println(dto.getId());
				System.out.println(dto.getName());
			}
			
			session.close();
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	
	
}
