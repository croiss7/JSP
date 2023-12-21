package com.jsp.test;

public class Provider {

	public String selectProvider(int id) {
		if(id==0) 
			return "select * from prod where id = 9999";
		
		return "select * from prod where id = #{id}";
	}
}
