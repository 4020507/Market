package com.market.vo;

import java.util.Date;

/*
DROP TABLE if EXISTS products;

CREATE TABLE products
(
product_num INT auto_increment NOT NULL PRIMARY KEY,
seller VARCHAR(20) NOT NULL,
pssword VARCHAR(50) NOT NULL,
category_code VARCHAR(20) NOT NULL,
product_price INT NOT NULL,
image VARCHAR(500) NULL,
intro VARCHAR(500) NOT NULL,
regDate timestamp NOT NULL DEFAULT current_timestamp,
state INT NOT NULL
thumbnail varchar(200)
(hit INT DEFAULT 0
)
*/

public class ProductsVO
{
	private int product_num;
	private String seller;
	private String pssword;
	private String category_code;
	private int product_price;
	private String image;
	private String intro;
	private Date regDate;
	private int state;
	private String thumbnail;
	private String category_name;
	private int hit;
	
	
	
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public int getProduct_num() {
		return product_num;
	}
	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}
	public String getSeller() {
		return seller;
	}
	public void setSeller(String seller) {
		this.seller = seller;
	}
	public String getPssword() {
		return pssword;
	}
	public void setPssword(String pssword) {
		this.pssword = pssword;
	}
	public String getCategory_code() {
		return category_code;
	}
	public void setCategory_code(String category_code) {
		this.category_code = category_code;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	
	
	
	
}