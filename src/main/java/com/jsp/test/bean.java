package com.jsp.test;

//멤버 변수를 private로 하고, getter, setter -> 자바빈

//규칙
//변수는 private 소문자
//생성자는 default
//getter, setter의 이름 규칙 -> camel-case , capitalize
//자바빈 자체를 생성하는 변수가 있다 자바에서 변수는 클래스 주소만 참조하니까
//<jsp:useBean



public class bean {
	private int x;
	private int y;

	public bean() {
		
		x = 0;
		y = 0;
	}

	public int getX() {
		return x;
	}

	public int getY() {
		return y;
	}

	public void setX(int x) {
		this.x = x;
	}

	public void setY(int y) {
		this.y = y;
	}

}