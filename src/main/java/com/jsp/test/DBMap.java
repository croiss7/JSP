package com.jsp.test;

import java.util.List;

import org.apache.ibatis.annotations.*;

@Mapper
public interface DBMap {
	
	@Insert("insert into prod values(#{id}, #{name})")
	public void insertProd(@Param("id") int id, @Param("name") String name);
	

	@Select("select * from prod where id = #{id}")
	public ProdDTO getProdById(@Param("id") int id);
	
	
	@Select("select * from prod")
	public List<ProdDTO> selectProd();
	
	
	
	
	
	//질의문을 다른 곳에서 받아오겠다
	//질의문 받을 때 오류 막으려고 예외 처리 할 때 씀
//	@SelectProvider(type=com.jsp.test.Provider.class, method="selectProvider")
//	public ProdDTO getProd2(@Param("id") int id);
//	
//	@Insert("insert into prod values(#{id}, #{name})")
//	public void InsertProd(@Param("id") int id, @Param("name") String name);
//	
//	@Select("select * from prod")
//	@Results(// 매핑 타입 지정
//			id = "prodList", value = { 
//					@Result(property = "id", column = "id", id = true), // true 기본 키라는 뜻임
//					@Result(property = "name", column = "name"), 					
//				}
//			)
//	public List<ProdDTO> getProd();
//	//매번 변화하는 검색
//	//어노테이션 특정 위치에 내가 작성한 값이 들어가도록 변경하는 기능
//	//@Param,  #{}, ${}   그러나 '#{}' 을 무조건 써 주자
//	//prepared  #{4} -> "4"
//	//statement ${4} -> 4     ${} 안에 쿼리문 넣으면 해킹됨 
//	
//	//매개변수 앞에 @Param("이름"), 질의문에 #{이름} 적어주면 해당 위치에
//	//매개 변수 값을 문자열로 변형해서 넣어준다
//	
//	
//	@Select("select * from prod where prod.id = #{prodid}")
//	public ProdDTO getProdById(@Param("prodid") int prodid);
//	
//	@Select("select * from movie")
//	@Results(// 매핑 타입 지정
//			id = "movieDTO", value = { 
//					@Result(property = "id", column = "id", id = true), // true 기본 키라는 뜻임
//					@Result(property = "name", column = "name"), 
//					@Result(property="prod", column="prodid", one=@One(select="getProdById"))
//					//one 검색 결과를 클래스 연결할 때 서브 쿼리를 만드는 용도로 쓴다
////					@Result(property="prodlist", column="prodid", javaType=List.class, many=@Many(select="getProd"))
//				}
//			)
//
//	public List<MovieDTO> getMovies();

}
