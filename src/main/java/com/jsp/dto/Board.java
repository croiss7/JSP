package com.jsp.dto;

public class Board {
	private int id;
	private String title;
	private BoardUser user;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public BoardUser getBoardUser() {
		return user;
	}
	public void setBoardUser(BoardUser boardUser) {
		this.user = boardUser;
	}
	
}

