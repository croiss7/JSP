package com.jsp.test;

public class MovieDTO {
	private int id;
	private String name;
	private ProdDTO prod;
	
	
	
//	public MovieDTO() {}
//	public MovieDTO(int id, String name, ProdDTO prod) {
//		this.id = id;
//		this.name = name;
//		this.prod = prod;
//	}
//	
	public int getId() {
		return id;
	}
	
	public String getName() {
		return name;
	}

	public ProdDTO getProd() {
		return prod;
	}
	
	
	public void setId(int id) {
		this.id = id;
	}

	public void setName(String name) {
		this.name = name;
	}
	

	public void setProd(ProdDTO prodid) {
		this.prod = prodid;
	}
}