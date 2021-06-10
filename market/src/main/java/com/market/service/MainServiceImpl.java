package com.market.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.market.dao.MainDAO;
import com.market.vo.CategoryVO;
import com.market.vo.Paging;
import com.market.vo.ProductsVO;
import com.market.vo.ReplyVO;

@Service
public class MainServiceImpl implements MainService{
	
	@Inject
	private MainDAO dao;
	//show products in proper categories
	@Override
	public List<CategoryVO> category() throws Exception{
		return dao.category();
	}
	
	@Override
	public List<CategoryVO> Toylist(Paging p) throws Exception{
		return dao.Toylist(p);
	}
	@Override
	public List<CategoryVO> Clothlist(Paging p) throws Exception{
		return dao.Clothlist(p);
	}
	@Override
	public List<CategoryVO> Fruitlist(Paging p) throws Exception{
		return dao.Fruitlist(p);
	}
	@Override
	public List<CategoryVO> Electroniclist(Paging p) throws Exception{
		return dao.Electroniclist(p);
	}
	@Override
	public List<CategoryVO> Shoelist(Paging p) throws Exception{
		return dao.Shoelist(p);
	}
	//get the detail of the product
	@Override
	public List<CategoryVO> list(Paging p) throws Exception {
		return dao.list(p);
	}

	// count the number of products
	@Override
	public int listCount() throws Exception {
		return dao.listCount();
	}
	
	@Override
	public int ToyCount() throws Exception{
		return dao.ToyCount();
	}
	@Override
	public int ClothCount() throws Exception{
		return dao.ClothCount();
	}
	@Override
	public int FruitCount() throws Exception{
		return dao.FruitCount();
	}
	@Override
	public int ElectronicCount() throws Exception{
		return dao.ElectronicCount();
	}
	@Override
	public int ShoeCount() throws Exception{
		return dao.ShoeCount();
	}
	@Override
	public int ReplyCount(int product_num) throws Exception{
		return dao.ReplyCount(product_num);
	}
	//register a new product
	@Override
	public void write(ProductsVO vo) throws Exception{
		dao.write(vo);
	}
	//show detail of product
	@Override
	public List<ProductsVO> showProducts() throws Exception{
		return dao.showProducts();
	}
	
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public ProductsVO productDetail(int product_num) throws Exception{
		return dao.productDetail(product_num);
	}
	
	@Override
	public void productModify(ProductsVO vo) throws Exception{
		dao.productModify(vo);
	}
	
	@Override
	public void productDelete(int product_num) throws Exception{
		dao.productDelete(product_num);
	}
	
	@Override
	public void reply(ReplyVO vo) throws Exception{
		dao.reply(vo);
	}
	
	@Override
	public List<ReplyVO> showReplies(int product_num) throws Exception{
		return dao.showReplies(product_num);
	}
	
	@Override
	public void replyModify(ReplyVO vo) throws Exception{
		dao.replyModify(vo);
	}
	
	@Override
	public void replyDelete(int reply_num) throws Exception{
		dao.replyDelete(reply_num);
	}
	//get a hit value of the product_num
	@Override
	public void hit(int product_num) throws Exception{
		dao.hit(product_num);
	}
	
}