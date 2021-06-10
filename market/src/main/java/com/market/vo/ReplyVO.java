package com.market.vo;

import java.util.Date;

public class ReplyVO{
	/*
	 * reply_num INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	userName VARCHAR(50) NOT NULL,
	userPssword VARCHAR(50) NOT NULL,
	userOpinion VARCHAR(200) NOT NULL,
	regDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	product_num INT NOT NULL
	 */
	
	private int reply_num; //unique number
	private String userName;
	private String userPssword;
	private String userOpinion;
	private Date regDate;
	private int product_num;//show replies for a product which has the same value of product_num
	
	public int getReply_num() {
		return reply_num;
	}
	public void setReply_num(int reply_num) {
		this.reply_num = reply_num;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPssword() {
		return userPssword;
	}
	public void setUserPssword(String userPssword) {
		this.userPssword = userPssword;
	}
	public String getUserOpinion() {
		return userOpinion;
	}
	public void setUserOpinion(String userOpinion) {
		this.userOpinion = userOpinion;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getProduct_num() {
		return product_num;
	}
	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}
	
	
}