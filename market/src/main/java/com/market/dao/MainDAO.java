package com.market.dao;

import java.util.List;

import com.market.vo.CategoryVO;
import com.market.vo.Paging;
import com.market.vo.ProductsVO;
import com.market.vo.ReplyVO;

public interface MainDAO{
	
	public List<CategoryVO> category() throws Exception;
	
	//show list
	public List<CategoryVO> list(Paging p) throws Exception;
	public List<CategoryVO> Toylist(Paging p) throws Exception;
	public List<CategoryVO> Clothlist(Paging p) throws Exception;
	public List<CategoryVO> Fruitlist(Paging p) throws Exception;
	public List<CategoryVO> Electroniclist(Paging p) throws Exception;
	public List<CategoryVO> Shoelist(Paging p) throws Exception;
	
	//count the number of products
	public int listCount() throws Exception;
	public int ToyCount() throws Exception;
	public int ClothCount() throws Exception;
	public int FruitCount() throws Exception;
	public int ElectronicCount() throws Exception;
	public int ShoeCount() throws Exception;
	public int ReplyCount(int product_num) throws Exception;
	
	//write a product
	public void write(ProductsVO vo) throws Exception;
	
	//to show all products
	public List<ProductsVO> showProducts() throws Exception;
	
	//see the detail of product
	public ProductsVO productDetail(int product_num) throws Exception;
	
	public void productModify(ProductsVO vo) throws Exception;
	
	public void productDelete(int product_num) throws Exception;
	
	//reply
	public void reply(ReplyVO vo) throws Exception;
	
	public List<ReplyVO> showReplies(int product_num) throws Exception;
	
	public void replyModify(ReplyVO vo) throws Exception;
	
	public void replyDelete(int reply_num) throws Exception;
	
	public void hit(int product_num) throws Exception;
	
}