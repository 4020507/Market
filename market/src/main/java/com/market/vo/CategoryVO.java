package com.market.vo;

public class CategoryVO
{
	/*
	 * category_name VARCHAR(20) NOT NULL, 
		cateogry_code VARCHAR(20) NOT NULL PRIMARY KEY
	 */
	
	private String category_name;
	private String category_code;//connects to the Products VO,and list names
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	public String getCategory_code() {
		return category_code;
	}
	public void setCategory_code(String category_code) {
		this.category_code = category_code;
	}
	
	
}